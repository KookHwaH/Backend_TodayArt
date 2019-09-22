package com.artfactory.project01.todayart.controller;

import com.artfactory.project01.todayart.entity.Shipping;
import com.artfactory.project01.todayart.model.ShippingForm;
import com.artfactory.project01.todayart.model.ShippingModel;
import com.artfactory.project01.todayart.service.ShippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/*
 * 작성자 : 상현
 * 기능 : 배송관련 API Controller
 */
@RestController
@RequestMapping("/shipping")
public class ShippingController {

    @Autowired
    ShippingService shippingService;

    /*
     * 작성자 : 상현
     * 기능 : 전체 배송 조회기능 (관리자)
     * 반환 : List<Shipping>
     */
    @GetMapping(produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<Shipping> retrieveShippingList() {
        return shippingService.retrieveShippingList();
    }

    /*
     * 작성자 : 상현
     * 기능 : 배송 정보 생성
     * 인자 : shipping (JSON Object)
     * 반환 : 생성 된 Shipping
     *
     * #2019/09/05
     * 작성자 : 국화
     * 주문 후 결제 완료시 해당 주문건에 대한 배송정보생성
     *
     */
    @PostMapping(produces =MediaType.APPLICATION_JSON_UTF8_VALUE)
    public List<Shipping> createShipping(@RequestBody ShippingModel data) {
        return shippingService.createShipping(data);
    }

    /*
     * 작성자 : 상현
     * 기능 : 배송 정보 업데이트 ( 배송 준비 중 상태에서 수취자 정보 수정 )
     * 인자 : int id(shipping_id), ShippingForm shippingForm
     * 반환 : 수정 된 Shipping
     */
    @PatchMapping(path = "/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Shipping updateShippingBefore(@PathVariable("id") int id, @RequestBody ShippingForm shippingForm) {
        return shippingService.updateShippingBefore(id, shippingForm);
    }

    /*
     * 작성자 : 상현
     * 기능 : 배송 정보 삭제 ( 배송취소(?) 역할을 하는 기능 - 실제 isDelete 값만 변함 )
     * 인자 : int id(shipping_id), ShippingForm shippingForm
     * 반환 : 삭제 된 Shipping
     */
    @DeleteMapping(path = "/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Shipping deleteShipping(@PathVariable("id") int id, @RequestBody ShippingForm shippingForm) {
        return shippingService.deleteShipping(id, shippingForm);
    }

    /*
     * 작성자 : 상현
     * 기능 : 배송 정보 업데이트 ( 송장번호, 택배사, 배송시작날짜 업데이트 )
     * 인자 : int id(shipping_id), ShippingForm shippingForm
     * 반환 : 변경 된 Shipping
     */

    // Shipping Items 와 함께 트랜잭션처리가 필요함.
    // 현재는 되어 있지 않음 - 내일 여기서부터 시작
    @PatchMapping(path = "/{id}/tracking")
    public Shipping updateShipping(@PathVariable("id") int id, @RequestBody ShippingForm shippingForm) {
        return shippingService.updateShipping(id, shippingForm);
    }

    // 현재 없는 리스트
    // 기간 별 조회기능
    // 오븐에는 결제완료부터 프로세스가 있는데 배송이라는 페이지를 별도로 분리하여 배송 관련된 작업을 진행해야 하나
    // 고민이 필요하다.

    // 상품명 검색 기능
    // 송장번호 조회기능
    // 해당 송장번호에 묶인 아이템 리스트(?)

    // trackingNumber 이 null 에서 -> 송장번호 존재로 바뀜으로써 shipping_items 에 해당 송장에 맞는 items 가
    // insert 된다.

    // 1. 임시테이블을 만든다.
    // 2. Shipping 테이블을 수정
    // 3. 기타 등등 .. 생각해봐야 함
}
