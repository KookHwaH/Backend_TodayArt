
package com.artfactory.project01.todayart.controller;

import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.entity.Product;
import com.artfactory.project01.todayart.model.ProductForm;
import com.artfactory.project01.todayart.service.ProductService;
import com.artfactory.project01.todayart.util.PrincipalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    ProductService productService;

    private Member member;
    private static Member getMember(Principal principal){
        return (Member) PrincipalUtil.from(principal);
    }


    /*
    작성자: 채경
    기능 설명 : 새로운 상품 등록(판매자)
    @param Product Entity
    @return save된 Product 객체
    */
    @PreAuthorize("hasAnyRole('ARTIST', 'ADMIN')")
    @RequestMapping(
            method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public Product createProduct(@RequestBody Product product, Principal principal) {
        member = getMember(principal);
        return productService.createProduct(member, product);
    }


    /*
   작성자: 채경
   기능 설명 : isDelete=0(미삭제)인 상품의 전체리스트 출력(최신 등록순으로 출력)
              (상품 전체 리스트 : 구매 고객)
   @return 전체 List<Product>객체
   */
    //@PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN', 'GUEST')")
    @RequestMapping(
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public List<Product> retrieveProduct() {
        return productService.retrieveProduct();
    }


    /*
   작성자: 채경
   기능 설명 : 상품 리스트 가격 오름차순 정렬 후 출력
   @return 오름차순 정렬된 List<Product> 객체
   */
    //@PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN', 'GUEST')")
    @RequestMapping(
            path = "/priceasc",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public List<Product> retrieveProductPriceAsc() {
        return productService.retrieveProductPriceAsc();
    }


    /*
   작성자: 채경
   기능 설명 : 상품 리스트 가격 내림차순 정렬 후 출력
   @return 내림차순 정렬된 List<Product> 객체
   */
    //@PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN', 'GUEST')")
    @RequestMapping(
            path = "/pricedesc",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public List<Product> retrieveProductPriceDesc() {
        return productService.retrieveProductPriceDesc();
    }


    /*
    작성자: 채경
    기능 설명 : 상품 ID로 상품 상세페이지 출력
    @param Integer productId
    @return 오름차순 정렬된 List<Product> 객체
    */
    //@PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN', 'GUEST')")
    @RequestMapping(
            path = "/detail/{productId}",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public Product retrieveProductByProductId(@PathVariable("productId") Integer productId) {
        return productService.retrieveProductDetail(productId);
    }


     /*
    작성자: 채경
    기능 설명 : 카테고리를 선택하면 선택한 카테고리 상품만 출력
    @param Integer categoryId
    @return 각 카테고리별 List<Product> 객체
    */
    //@PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN', 'GUEST')")
    @RequestMapping(
            path = "/{categoryId}",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public List<Product> retrieveProductByCategory(@PathVariable("categoryId") Integer categoryId) {

        return productService.retrieveByCategory(categoryId);
    }

    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN', 'GUEST')")
    @RequestMapping(
            path = "/{categoryId}/asc",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public List<Product> retrieveProductByCategoryAsc(@PathVariable("categoryId") Integer categoryId) {

        return productService.retrieveByCategoryAsc(categoryId);
    }


    //@PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN', 'GUEST')")
    @RequestMapping(
            path = "/{categoryId}/desc",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public List<Product> retrieveProductByCategoryDesc(@PathVariable("categoryId") Integer categoryId) {

        return productService.retrieveByCategoryDesc(categoryId);
    }





    /*
    작성자: 채경
    기능 설명 : 판매자시점에서 자기가 올린 상품만 조회
    @param Integer artistId
    @return 판매자별 List<Product> 객체
    */
    @PreAuthorize("hasAnyRole('ARTIST', 'ADMIN')")
    @RequestMapping(
            path = "/artistId",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public List<Product> retrieveProductByArtistId(Principal principal) {
        member = getMember(principal);
        return productService.retrieveByArtistId(member);
    }





    /*
   작성자: 채경
   기능 설명 : 작가이름/상품명으로 상품 조회/출력
   @param String artistName
   @return 각 판매자별 List<Product> 객체
   /search?search=검색어
   */
   // @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN', 'GUEST')")
    @RequestMapping(
            path = "/search",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE

    )
    public List<Product> retrieveProduct(@RequestParam(value = "search", required = false) String search) {

        return productService.retrieveProductBySearch(search);
    }



    /*
    작성자: 채경
    기능 설명 : 상품 개별 컬럼 업데이트
    @param Integer productId, ProductForm Model
    @return save된 Product 객체
    */
    @PreAuthorize("hasAnyRole('ARTIST', 'ADMIN')")
    @RequestMapping(
            path = "/{product_id}",
            method = RequestMethod.PATCH,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public Product updateProduct(Principal principal, @PathVariable("product_id") Integer productId, @RequestBody ProductForm productForm) {
        member = getMember(principal);
        return productService.updateProduct(productId, productForm);
    }







    /*
    작성자: 채경
    기능 설명 : 판매자가 상품삭제를 누르면 is_delete 상태가 1로 바뀌며 삭제
    @param Integer productId, ProductForm Model
    @return is_delete 1로 save된 Product 객체
    */
    @PreAuthorize("hasAnyRole('ARTIST', 'ADMIN')")
    @RequestMapping(
            path = "/{product_id}",
            method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public Product deleteProduct(@PathVariable("product_id") Integer product_id) {
        productService.deleteProduct(product_id);
        Product product = new Product();
        product.setProductId(product_id);
        return product;
    }


    /*
    작성자: 채경
    기능 설명 : 상품이 DB에서 삭제(관리자)
    @param Integer productId
    @return Product 객체
    */
    @PreAuthorize("hasAnyRole('ADMIN')")
    @RequestMapping(
            path = "/remove/{product_id}",
            method = RequestMethod.DELETE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE
    )
    public Product realDeleteProduct(@PathVariable("product_id") Integer product_id) {
        productService.deleteProductReal(product_id);
        Product product = new Product();
        product.setProductId(product_id);
        return product;
    }
}

