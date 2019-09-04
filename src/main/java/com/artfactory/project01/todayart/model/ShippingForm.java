package com.artfactory.project01.todayart.model;

import com.artfactory.project01.todayart.entity.Shipping;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import java.util.Date;

/*
 * 작성자 : 상현
 * 설명 : 배송 정보 업데이트 DTO
 */
@Getter
@Setter
public class ShippingForm {
    private String consignee; // 수취인
    private String postalCode; // 우편번호
    private String receiveAddr; // 수취인 주소
    private String consigneePhone; // 수취인 연락처

    private Date shippingDated; // 배송 시작 시간
    private String courier; // 택배사
    private String trackingNumber; // 송장 번호

    private String isDelete; // 배송 취소 유무

    public Shipping updateShippingBefore(Shipping shipping) {
        shipping.setConsignee(getConsignee());
        shipping.setPostalCode(getPostalCode());
        shipping.setReceiveAddr(getReceiveAddr());
        shipping.setConsigneePhone(getConsigneePhone());

        return shipping;
    }

    public Shipping updateShipping(Shipping shipping) {
        shipping.setCourier(getCourier());
        shipping.setTrackingNumber(getTrackingNumber());
        shipping.setShippingDated(new Date());

        return shipping;
    }

    public Shipping deleteShipping(Shipping shipping) {
        shipping.setIsDelete(getIsDelete());

        return shipping;
    }
}
