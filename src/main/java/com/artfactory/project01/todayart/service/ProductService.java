
package com.artfactory.project01.todayart.service;

import com.artfactory.project01.todayart.entity.Artist;
import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.entity.Product;
import com.artfactory.project01.todayart.model.ProductForm;
import com.artfactory.project01.todayart.repository.ArtistRepository;
import com.artfactory.project01.todayart.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    @Autowired
    ArtistRepository artistRepository;




   /*
    작성자: 수지
    기능 설명 : 상품등록
    <POST>
    @param Product product
    @return Product 객체
    */
    @Transactional
    public Product createProduct(Member member, Product product) {

        product.setArtistName(member.getRealName());
        Artist artist = artistRepository.findByMemberId(member.getMemberId());
        product.setArtist(artist);


        return productRepository.save(product);
    }


     /*
    작성자: 수지
    기능 설명 : 등록된 상품중 삭제되지 않은 모든 상품 리스트 조회(최신등록순)
    <GET>
    @return List<Product> 객체
    */
    @Transactional(readOnly = true)
    public List<Product> retrieveProduct() {
        return productRepository.findByIsDeleteOrderByEnrollDatedDesc("n");
    }


     /*
    작성자: 수지
    기능 설명 : 등록된 상품 가격 오름차순으로 조회(저렴한 가격-> 비싼가격 순으로 조회)
    <GET>
    @return 오름차순 정렬된 List<Product> 객체
    */
    @Transactional(readOnly = true)
    public List<Product> retrieveProductPriceAsc() {
        return productRepository.findAllByIsDeleteOrderByProductPriceAsc("n");
    }


    /*
    작성자: 수지
    기능 설명 : 등록된 상품 가격 내림차순으로 조회(비싼 가격-> 저렴한 순으로 조회)
    <GET>
    @return 내림차순 정렬된 List<Product> 객체
    */
    @Transactional(readOnly = true)
    public List<Product> retrieveProductPriceDesc() {
        return productRepository.findAllByIsDeleteOrderByProductPriceDesc("n");
    }



    /*
    작성자: 수지
    기능 설명 : 상품 상세 페이지
    <GET>
    @param Integer product_id
    @return 각 상품별 Product 객체
    */
    @Transactional(readOnly = true)
    public Product retrieveProductDetail(Integer productId) {
        return productRepository.findById(productId).get();
    }


    /*
    작성자: 수지
    기능 설명 : 상품 카테고리별 검색
    <GET>
    @param Integer categoryId
    @return 각 카테고리별 List<Product> 객체
    */
    @Transactional(readOnly = true)
    public List<Product> retrieveByCategory(Integer category_id) {
        return productRepository.findByProductCategory_CategoryIdAndIsDeleteOrderByEnrollDatedDesc(category_id, "n");
    }


    @Transactional(readOnly = true)
    public List<Product> retrieveByCategoryAsc(Integer category_id) {
        return productRepository.findByProductCategory_CategoryIdAndIsDeleteOrderByProductPriceAsc(category_id, "n");
    }

    @Transactional(readOnly = true)
    public List<Product> retrieveByCategoryDesc(Integer category_id) {
        return productRepository.findByProductCategory_CategoryIdAndIsDeleteOrderByProductPriceDesc(category_id, "n");
    }


    /*
    작성자: 수지
    기능 설명 : 상품을 판매자 아이디로 검색
    <GET>
    @param Integer artistId
    @return 각 판매자 아이디별 List<Product> 객체
    */
    @Transactional(readOnly = true)
    public List<Product> retrieveByArtistId(Member member) {

        Artist artist = artistRepository.findByMemberId(member.getMemberId());
        Integer artistId = artist.getArtistId();

        return productRepository.findByArtist_ArtistIdAndIsDelete(artistId, "n");
    }




    /*
   작성자: 수지
   기능 설명 : 아티스트 이름/작품명으로 검색
   <GET>
   @param String search
   @return 아티스트 이름/작품명으로 검색한 List<Product> 객체
   */
    @Transactional(readOnly = true)
    public List<Product> retrieveProductBySearch(String search) {
        // Like 검색을 위해 앞뒤로 % 달아줌
        search = "%" + search +"%";

        return productRepository.findByArtistNameAndIsDeleteAndProductName(search,search);
    }




    /*
    작성자: 수지
    기능 설명 : 상품 정보 수정(상품별 컬럼 개별업데이트)
    <PATCH>
    @param Integer id, ProductForm productForm
    @return save된 Product 객체
    */
    @Transactional
    public Product updateProduct(Integer productId, ProductForm productForm) {

        Product product = productRepository.findById(productId).get();
        productForm.setProduct(product);

        return productRepository.save(product);
    }


    /*
    작성자: 수지
    기능 설명 : 상품 삭제(is_delete=1로 변경)
    setDelete 는 delete_dated update를 위한 메서드
    <PATCH>
    @param Integer id, ProductForm productForm
    @return Product 객체
    */
    @Transactional
    public boolean deleteProduct(Integer id) {
        Product product = productRepository.findById(id).get();
        product.setIsDelete("y");
        product.setDeleteDated(new Date());
        productRepository.save(product);

        return true;
    }


    /*
    작성자: 수지
    기능 설명 : 상품 삭제(DB에서 삭제됨)
    <DELETE>
    @param Integer productId
    */
    @Transactional
    public void deleteProductReal(Integer productId) {
        productRepository.deleteById(productId);
    }
    }
