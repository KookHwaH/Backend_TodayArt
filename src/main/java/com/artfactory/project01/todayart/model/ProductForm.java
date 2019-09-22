package com.artfactory.project01.todayart.model;

import com.artfactory.project01.todayart.entity.File;
import com.artfactory.project01.todayart.entity.Product;
import com.artfactory.project01.todayart.entity.ProductCategory;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;


@Getter
@Setter
public class ProductForm implements Serializable {

    private String productName;
    private String productSize;
    private Integer productPrice;
    private File thumbnail;
    private Integer remain;
    private Integer shippingFee;
    private String isSoldOut;
    private String isDelete;
    private String productContent;
    private Product product;
    private Date deleteDated;
    private Integer categoryId;
    private ProductCategory productCategory;





    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {

        this.isDelete = isDelete;

    }

    public void setDelete(Product product) {
        product.setIsDelete("y");
        product.setDeleteDated(new Date());
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {


        if(productName != null){
            product.setProductName(this.productName);
        }
        if(productSize != null){
            product.setProductSize(this.productSize);
        }
        if(thumbnail != null){
            product.setThumbnail(this.thumbnail);
        }
        if(productCategory != null){
            product.setProductCategory(productCategory);
        }
        if(remain!= null){
            product.setRemain(this.remain);
        }
        if(shippingFee != null){
            product.setShippingFee(this.shippingFee);
        }
        if(isSoldOut != null){
            product.setIsSoldOut(this.isSoldOut);
        }
        if(productPrice != null){
            product.setProductPrice(this.productPrice);
        }
        if(productContent != null){
            product.setProductContent(this.productContent);
        }



        this.product = product;

    }


}