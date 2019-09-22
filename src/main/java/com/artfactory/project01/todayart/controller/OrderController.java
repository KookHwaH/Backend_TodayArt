package com.artfactory.project01.todayart.controller;

import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.entity.Ordered;
import com.artfactory.project01.todayart.entity.OrderedDetail;
import com.artfactory.project01.todayart.model.ChangeOrderDetail;
import com.artfactory.project01.todayart.entity.KakaoInfoRequest;
import com.artfactory.project01.todayart.model.OrderForm;
import com.artfactory.project01.todayart.model.Period;
import com.artfactory.project01.todayart.repository.KakaoInfoRequestRepository;
import com.artfactory.project01.todayart.service.CartService;
import com.artfactory.project01.todayart.service.OrderService;
import com.artfactory.project01.todayart.service.PaymentService;
import com.artfactory.project01.todayart.util.PrincipalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.xml.ws.Response;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    PaymentService paymentService;
    @Autowired
    CartService cartService;
    @Autowired
    KakaoInfoRequestRepository kakaoInfoRequestRepository;

    private Member member;
    private static Member getMember(Principal principal){
        return (Member) PrincipalUtil.from(principal);
    }

    /*
    작성자: 국화
    front에서 orderForm 을 받아 주문-배송-결제까지 원스톱 주문 생성
    @param OrderForm
    @param Principal
    @return Ordered
     */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST')")
    @RequestMapping(method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<Ordered> createOrder(@RequestBody OrderForm orderForm, Principal principal){
        member = getMember(principal);
        return orderService.createOrder(member, orderForm);
    }

    /**
     * 작성자 : 국화
     * kakaoPay 승인 후 연관 데이터 업데이트
     * @return
     */
    @Transactional
    public Boolean updateKakaoOrders(Ordered ordered, KakaoInfoRequest kakao){
        List<OrderedDetail> orderedDetails = ordered.getOrderDetails();
        try{
            cartService.deleteCart(orderedDetails);
            orderService.updateOrderDetailForKakao(orderedDetails);
            paymentService.updatePaymentForKakao(orderedDetails, kakao);
            kakaoInfoRequestRepository.save(kakao);
            return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }


    /*
    작성자: 국화
    1. 모든 주문 확인
        - 관리자 ; 모든 주문
        - 주문자 ; 자신의 주문
    2. 주문상태로 주문 조건 검색
    @param String : ReqeustParam 으로 받는 ordered 의 status
    @param Principal
    @return List<Ordered>
    */
    @RequestMapping(method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public List<Ordered> retrieveOrders(@RequestParam(value = "type", required = false) String type, Principal principal){
        member = getMember(principal);
        int id = member.getMemberId();
        String role = member.getRole();
        if(type==null){
            return ((role.equals("ROLE_ADMIN"))?orderService.retrieveOrders():orderService.retrieveOrdersByMemberId(id));}
        else{
            return orderService.retrieveOrdersByStatus(role, id, type);
        }
    }

    /*
    작성자: 국화
    판매자가 자신에게 들어온 주문을 확인할 수 있다
    @param Principal
    @return List<Ordered>
     */
    @PreAuthorize("hasAnyRole('ARTIST', 'ADMIN')")
    @GetMapping("/artist")
    public ResponseEntity retrieveOrders(@RequestParam(value="seller", required = false)Integer artistId, Principal principal){
        member = getMember(principal);
        ResponseEntity result = artistId==null?
                (member.getRole().equals("ROLE_ADMIN")?
                        orderService.retreiveOrdersAdmin():
                        orderService.retreiveOrdersArtist(member)):
                (member.getRole().equals("ROLE_ADMIN")?
                        orderService.retreiveOrdersAdmin(artistId):
                        orderService.retreiveOrdersArtist(member, artistId));

        return result;
    }

    /*
        작성자: 국화
        기간별 주문 조회
        @param Period
        @param Principal
        @return ArrayList<Ordered>
     */
    @RequestMapping(path="/period", method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ArrayList<Ordered> retrieveOrderesByPeriod(@RequestBody Period period, Principal principal){
        member = getMember(principal);
        String role = member.getRole();
        if(role.equals("ROLE_ADMIN")){
            return orderService.retrieveOrdersByPeriod(period);
        }
        int id = member.getMemberId();
        return orderService.retrieveOrdersByMemberIdAndPeriod(id, period);

    }





    /*
       작성자: 국화
       주문 디테일 확인
       @param int
       @param Principal
       @return List<OrderedDetail>
    */
    @RequestMapping(path="/{id}/detail", method = RequestMethod.GET, produces ={MediaType.APPLICATION_JSON_UTF8_VALUE})
    public List<OrderedDetail> retrieveOrderDetails(@PathVariable("id") int orderId, Principal principal){
        member = getMember(principal);
        String role = member.getRole();
        return ((role.equals("ROLE_ADMIN"))?orderService.retrieveOrderedDetailsForAdmin(orderId):orderService.retrieveOrderedDetails(orderId, member));
    }




    /*
      작성자: 국화
      회원 id 로 주문 조회(관리자용)
      @param int
      @return List<Ordered>
   */
    @PreAuthorize("hasRole('ADMIN')")
    @RequestMapping(path="/user/{memberId}", method=RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public List<Ordered> retrieveOrders(@PathVariable("memberId") int memberId){
        return orderService.retrieveOrdersByMemberId(memberId);
    }



    /*
      작성자: 국화
      주문 상태 변경
      1. 관리자(모든 상태->모든상태)
      2. 판매자
        - 결제완료 -> 배송준비/주문취소
        - 배송준비 -> 배송중
      3. 구매자
        - 결제완료 -> 주문취소
        - 배송준비 -> 주문취소
        - 배송완료 -> 주문확정
        - 배송완료 -> 반품대기 (환불절차 첫번째)
      @param ChangeOrderDetail
      @return OrderedDetail
    */
    @RequestMapping(method=RequestMethod.PATCH, produces ={MediaType.APPLICATION_JSON_UTF8_VALUE})
    public OrderedDetail updateOrderedDetail(@RequestBody ChangeOrderDetail changeList,
                                             Principal principal){
        member = getMember(principal);
        return orderService.updateStatus(member, changeList);

    }


    /*
      작성자: 국화
      주문내역 감추기(주문자 기준 주문삭제 기능)
      @param int
      @return null
   */
    @RequestMapping(path="/{id}", method=RequestMethod.DELETE, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public void deleteOrder(@PathVariable("id") int id){
        orderService.deleteOrdered(id);

    }
}
