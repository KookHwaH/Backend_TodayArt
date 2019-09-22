package com.artfactory.project01.todayart.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import java.util.Date;
import java.util.IdentityHashMap;

/*
 * 작성자 : 상현
 * 설명 : Shipping 엔티티
 */
@Entity
@Table(name = "shipping")
@DynamicUpdate
@DynamicInsert
@Getter
@Setter
public class Shipping {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "shipping_id", insertable = false, nullable = false, updatable = false)
    private Integer shippingId; // 배송번호

    @Column(name = "ordered_id")
    private Integer orderedId; // 주문번호

    @Column(name = "shipping_dated", insertable = false)
    @Nullable
    private Date shippingDated; // 배송 시작일

    @Column(name = "shipping_fee")
    private Integer shippingFee; // 배송료

    @Column(name = "consignee")
    private String consignee; // 수취인

    @Column(name = "postal_code")
    private String postalCode; // 우편번호

    @Column(name = "receive_addr")
    private String receiveAddr; // 수취인 주소

    @Column(name = "consignee_phone")
    private String consigneePhone; // 수취인 번호

    @Column(name = "artist_id")
    private Integer artistId; // 판매자 PK (아티스트)

    @Column(name = "member_id")
    private Integer memberId; // 구매자 PK (일반)

    @Column(name = "courier")
    private String courier; // 택배사

    @Column(name = "tracking_number", insertable = false)
    @Nullable
    private String trackingNumber; // 송장번호

    @Column(name = "is_delete")
    private String isDelete; // 삭제여부
}
