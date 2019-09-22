package com.artfactory.project01.todayart.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class InfomationForSeller implements Serializable {
    private int orderedId;
    private int orderDetailId;
    private int memberId;
    private String productName;
    private int quantity;
    private int productPrice;
    private String filename;
    private Integer shippingFee;
    private int totalPrice;
    private Date orderedDate;
    private String orderStatus;
    private String postalNumber;
    private String consignee;
    private String consigneePhone;
    private String address;
    private String courier;
    private String trackingNumber;
    private String shippingStatus;
}
