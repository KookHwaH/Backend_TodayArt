package com.artfactory.project01.todayart.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class OrderForSeller implements Serializable {
    private Integer orderId; // by orderDetail
    private String image; //by orderDetail_product_thumbnali_fileName
    private String paymentMethod;// by payment
    private String orderStatus; //by orderedDetail
    private Date date; // by ordered
    private Integer productPrice;// by orderedDetail totalProductPrice
    private Integer shippingFee; // by orderedDetail shippingFee
    private Integer totalPrice; // by totalPrice
}
