package com.artfactory.project01.todayart.service;

import com.artfactory.project01.todayart.controller.PaymentController;
import com.artfactory.project01.todayart.entity.*;
import com.artfactory.project01.todayart.exception.VerificateFailException;
import com.artfactory.project01.todayart.model.ChangeOrderDetail;
import com.artfactory.project01.todayart.model.OrderForSeller;
import com.artfactory.project01.todayart.model.OrderForm;
import com.artfactory.project01.todayart.model.Period;
import com.artfactory.project01.todayart.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    OrderedRepository orderedRepository;
    @Autowired
    OrderedDetailRepository orderedDetailRepository;
    @Autowired
    CartRepository cartRepository;
    @Autowired
    PaymentController paymentController;
    @Autowired
    PaymentRepository paymentRepository;
    @Autowired
    ArtistRepository artistRepository;


    /**
      작성자: 국화
      1. orderForm 을 받아 ordered을 생성한다
      2. 각 ordered 와 연결되는 shipping 레코드를 생성한다
      3. orderForm 의 CartIdList 에 따라 orderedDetail 를 생성한다
      4. 각 orderedDetail 과 연결되는 payment 레코드를 생성한다
      5. 주문생성이 완료되면 HttpStatus.OK , 실패하면 HttpStatus.BAD_REQUEST 를 return 한다
      @param member
      @param orderForm
      @return ResponseEntity<Ordered>
    */
    @Transactional(rollbackFor = VerificateFailException.class)
    public ResponseEntity<Ordered> createOrder(Member member, OrderForm orderForm){

        Ordered ordered = new Ordered();
        ordered.setMemberId(member.getMemberId());
        ordered.setTotalPrice(orderForm.getTotalPrice());
        ordered.setShippingFee(orderForm.getShippingFee());
        ordered = orderedRepository.save(ordered);

        List<Integer> cartIdList = orderForm.getCartIdList();
        List<OrderedDetail> orderedDetails = new ArrayList<>();


        for(Integer cartId : cartIdList){
            Payment payment = orderForm.getPayment();
            Cart cart = cartRepository.findById(cartId).get();
            Product product = cart.getProduct();
            OrderedDetail orderedDetail = setOrderDetail(ordered, product, cart);
            orderedDetailRepository.save(orderedDetail);

            orderedDetails.add(orderedDetail);
            paymentController.createPayment(payment, ordered.getOrderId(),orderedDetail.getOrderDetailId(), orderedDetail.getTotalPrice());
        }

        ordered.setOrderDetails(orderedDetails);

        try {
            return new ResponseEntity(ordered, HttpStatus.OK);
        }catch(Exception e){
            return new ResponseEntity(ordered, HttpStatus.BAD_REQUEST);
        }

    }


    /*
      작성자: 국화
      OrderedDetail setting
      @param Ordered
      @param Product
      @param Cart
      @return OrderedDetail
    */
    public OrderedDetail setOrderDetail(Ordered ordered, Product product, Cart cart){
        OrderedDetail orderedDetail = new OrderedDetail();
        orderedDetail.setOrderId(ordered.getOrderId());
        orderedDetail.setProduct(product);
        orderedDetail.setCartId(cart.getCartId());
        orderedDetail.setProductName(product.getProductName());
        orderedDetail.setProductPrice(cart.getProductPrice());
        orderedDetail.setProductSize(cart.getProductSize());
        orderedDetail.setShippingFee(cart.getShippingFee());
        orderedDetail.setQuantity(cart.getQuantity());
        orderedDetail.setTotalProductPrice(cart.getProductPrice()*cart.getQuantity());
        orderedDetail.setTotalPrice(orderedDetail.getTotalProductPrice()+cart.getShippingFee());
        orderedDetailRepository.save(orderedDetail);

        return orderedDetail;
    }


    /*
      작성자: 국화
      모든 주문을 조회한다
      @param null
      @return List<Ordered>
    */
    @Transactional
    public List<Ordered> retrieveOrders(){
        List<Ordered> orders = orderedRepository.findAll();
        return orders;
    }

    /*
      작성자: 국화
      멤버 Id 로 모든 주문을 조회한다
      @param Member
      @return List<Ordered>
    */
    @Transactional
    public List<Ordered> retrieveOrdersByMemberId(int id){
        List<Ordered> orders = orderedRepository.findByMemberId(id);
        return orders;
    }



    /*
      작성자: 국화
      기간에 따라 주문을 조회한다
      @param Period
      @return ArrayList<Ordered>
    */
    @Transactional
    public ArrayList<Ordered> retrieveOrdersByPeriod(Period period){
        Date startDate = period.getStartDate();
        Date endDate = period.getEndDate();
        ArrayList<Ordered> orderedList = orderedRepository.findByMemberIdWithTerm(startDate, endDate);
        return orderedList;
    }

    /*
      작성자: 국화
      멤버 ID 와 기간으로 주문을 조회한다
      @param int
      @param Period
      @return ArrayList<Ordered>
    */
    @Transactional
    public ArrayList<Ordered> retrieveOrdersByMemberIdAndPeriod(int id, Period period){
        Date startDate = period.getStartDate();
        Date endDate = period.getEndDate();
        ArrayList<Ordered> orderedList = orderedRepository.findByMemberIdWithTerm(id, startDate, endDate);
        return orderedList;
    }


    /*
      작성자: 국화
      주문자가 마이페이지에서 특정 주문을 클릭하면 상세정보를 조회할 수 있다
      @param int
      @param Member
      @return List<OrderedDetail>
    */
    @Transactional
    public List<OrderedDetail> retrieveOrderedDetails(int orderId, Member member){
        int memberId = member.getMemberId();
        Ordered order = orderedRepository.findByOrderIdAndMemberId(orderId,memberId);
        if(order!=null){
            List<OrderedDetail> orderedDetailList = orderedDetailRepository.findAllByOrderId(orderId);
            return orderedDetailList;
        }else{
            return null;
        }
    }

    /*
      작성자: 국화
      관리자가 특정 주문에 대한 상세정보를 조회할 수 있다
      @param int
      @return List<OrderedDetail>
    */
    @Transactional
    public List<OrderedDetail> retrieveOrderedDetailsForAdmin(int orderId){
         List<OrderedDetail> orderedDetailList = orderedDetailRepository.findAllByOrderId(orderId);
         return orderedDetailList;

    }


    /*
      작성자: 국화
      1. 구매자가 주문상태를 조건으로 자신의 주문을 조회한다
      2. 관리자가 주문상태를 조건으로 모든 주문을 조회한다
      @param String, int, String
      @return List<OrderedDetail>
    */
    @Transactional
    public List<Ordered> retrieveOrdersByStatus(String role, int memberId, String status){
        List<Ordered> orderedList;

        if(role.equals("ROLE_ADMIN")){
            orderedList = orderedRepository.findAllByOrderDetails_Status(status);
        }
        else {
            orderedList = orderedRepository.findAllByOrderDetails_StatusAndMemberId(status, memberId);
        }
        return orderedList;
    }

    /*
      작성자: 국화
      각 주문상세의 상태를 변경한다
      @param Member
      @param ChangeOrderDetail
      @return OrderedDetail
    */
    @Transactional
    public OrderedDetail updateStatus(Member member, ChangeOrderDetail item){
        String code = item.getChangeCode();
        OrderedDetail orderedDetail = orderedDetailRepository.findByOrderDetailId(item.getOrderDetailId());

        if(code.equals("CUSTOMER")){
            int memberId = member.getMemberId();
            int orderId = orderedDetail.getOrderId();
            Ordered ordered = orderedRepository.findByOrderId(orderId);
            if(memberId==ordered.getMemberId()){
                if(orderedDetail.getStatus().equals("배송준비")||orderedDetail.getStatus().equals("결제완료")||orderedDetail.getStatus().equals("결제대기")){
                    orderedDetail.setStatus("주문취소");
                    return orderedDetailRepository.save(orderedDetail);
                }else if(orderedDetail.getStatus().equals("배송완료")){
                    orderedDetail.setStatus("주문확정");
                    return orderedDetailRepository.save(orderedDetail);
                }
            }
            return null;
        }
        else if(code.equals("SELLER")){
            if(item.getStatus().equals("배송중")){
                orderedDetail.setStatus(item.getStatus());
                orderedDetail.setTrackingNumber(item.getTrackingNumber());
                return orderedDetailRepository.save(orderedDetail);
            }else if(item.getStatus().equals("주문취소")){
                orderedDetail.setStatus(item.getStatus());
                return orderedDetailRepository.save(orderedDetail);
            }

        }
        else if(code.equals("ADMIN")){
            orderedDetail.setStatus(item.getStatus());
            return orderedDetailRepository.save(orderedDetail);

        }
    return orderedDetailRepository.findByOrderDetailId(item.getOrderDetailId());
    }

    /**
     * 작성자 : 국화
     * orderedDetail 업데이트를 위한 사전작업으로 ChangeOrderDetail 을 세팅 후 각 OrderedDetail을 순회하며 updateStatus를 호출한다
     * @param list
     * @return ; 모든 작업이 끝난 후 true 를 return
     * @throws Exception ; 작업중 exception 이 발생하면 false 대신 exception 을 throw
     */
    public Boolean updateOrderDetailForKakao(List<OrderedDetail> list) throws Exception{
        ChangeOrderDetail changeOrderDetail = new ChangeOrderDetail();
        changeOrderDetail.setChangeCode("ADMIN");
        try {
            for (OrderedDetail item : list) {
                changeOrderDetail.setStatus("결제완료");
                changeOrderDetail.setOrderDetailId(item.getOrderDetailId());
                updateStatus(null, changeOrderDetail);
            }
            return true;

        }catch(Exception e){
            throw new Exception();
        }
    }

    /*
      작성자: 국화
      특정 주문을 감춘다(삭제한다)
      @param int
      @return null
    */
    @Transactional
    public void deleteOrdered(int orderedId){
        Ordered ordered = orderedRepository.findByOrderId(orderedId);
        ordered.setIsHidden("y");
        orderedRepository.save(ordered);
    }


    /**
     * author : 국화
     *
     * @param member : 접근하려는 유저객체
     * @return
     */
    public ResponseEntity retreiveOrdersArtist(Member member){
            Artist artist = artistRepository.findByMemberId(member.getMemberId());
            return retreiveOrders(artist);
    }

    /**
     * author : 국화
     * 만약 artist 가 admin 처럼 접근했을 때 artist Id를 member 의 artistId 와 비교해서 서로 다르면 BadRequest 반환
     * @param member
     * @param artistId
     * @return
     */
    public ResponseEntity retreiveOrdersArtist(Member member, int artistId){
        Artist artist = artistRepository.findByMemberId(member.getMemberId());

        if(artist.getArtistId()==artistId){
            return retreiveOrders(artist);
        }else{
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    /**
     * author: 국화
     * 관리자용...
     * @param artistId
     * @return
     */
    public ResponseEntity retreiveOrdersAdmin(int artistId){
        Artist artist = artistRepository.findByMemberId(artistId);
        return retreiveOrders(artist);
    }

    public ResponseEntity retreiveOrdersAdmin(){
        List<OrderedDetail> orderDetails = orderedDetailRepository.findAll();
        return retreiveOrders(orderDetails);
    }


    /**
     * author: 국화
     * @param artist : 찾고자하는 판매자 객체
     * @return
     */
    public ResponseEntity retreiveOrders(Artist artist){
        List<OrderedDetail> orderedDetails =orderedDetailRepository.findAllByProduct_ArtistOrderByOrderIdDesc(artist);
        return retreiveOrders(orderedDetails);
    }

    public ResponseEntity retreiveOrders(List<OrderedDetail> orderedDetails){
        List<OrderForSeller> orderForSellers = new ArrayList<>();
        for(OrderedDetail item : orderedDetails){
            OrderForSeller order = new OrderForSeller();
            order.setOrderId(item.getOrderId());
            order.setImage(item.getProduct().getThumbnail().getFileName());
            order.setPaymentMethod(paymentRepository.findByOrderIdAndOrderedDetailId(item.getOrderId(), item.getOrderDetailId()).getPayMethod());
            order.setOrderStatus(item.getStatus());
            order.setDate(orderedRepository.findByOrderId(item.getOrderId()).getOrderDate());
            order.setProductPrice(item.getTotalProductPrice());
            order.setShippingFee(item.getShippingFee());
            order.setTotalPrice(item.getTotalPrice());

            orderForSellers.add(order);
        }
        return new ResponseEntity(orderForSellers, HttpStatus.OK);
    }


}
