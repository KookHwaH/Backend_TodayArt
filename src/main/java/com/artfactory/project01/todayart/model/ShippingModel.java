package com.artfactory.project01.todayart.model;

import com.artfactory.project01.todayart.entity.OrderedDetail;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class ShippingModel implements Serializable {
    private Integer orderedId;
    private Integer memberId;
    private List<OrderedDetail> orderedDetails;
    private String consignee;
    private String consigneePhone;
    private String postalCode;
    private String receiveAddr;

}
