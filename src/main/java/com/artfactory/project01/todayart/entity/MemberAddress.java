package com.artfactory.project01.todayart.entity;


import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;


import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="member_address")
@DynamicInsert
@DynamicUpdate
@Getter
@Setter
public class MemberAddress implements Serializable {
    @Id
    @Column(name="address_id", updatable = false, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer addressId;

    @Column(name="member_id")
    private Integer memberId;

    @Column(name="consignee")
    private String consignee;

    @Column(name="consignee_phone")
    private String consigneePhone;

    @Column(name="postal_number")
    private String postalNumber;

    @Column(name="address")
    private String address;

    @Column(name="address_detail")
    private String addressDetail;

    @Column(name="main_address")
    private String mainAddress;

    @Column(name="is_delete")
    private String isDelete;
}
