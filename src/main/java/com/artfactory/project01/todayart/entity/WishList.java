package com.artfactory.project01.todayart.entity;


import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="wishlist")
@DynamicUpdate
@DynamicInsert
@Getter
@Setter
public class WishList {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name ="wishlist_id", nullable = false, updatable = false)
    private Integer wishlistId;



    @Column(name ="member_id", nullable = false, updatable = false)
    private Integer memberId;


    @Column(name = "artist_name")
    private String artistName;

    @ManyToOne(fetch=FetchType.EAGER, targetEntity = Product.class)
    @JoinColumn(name ="product_id", nullable = false, updatable = false)
    private Product product;





    @Column(name = "product_price")
    private Integer productPrice;


    @Column(name = "product_size")
    private String productSize;


    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    @Column(name = "enroll_dated")
    private Date enrollDated;


    @Column(name = "is_deleted")
    private String isDelete;


    @Column(name = "is_stock")
    private String isStock;



}
