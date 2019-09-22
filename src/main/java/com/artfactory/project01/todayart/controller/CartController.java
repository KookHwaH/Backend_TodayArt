package com.artfactory.project01.todayart.controller;

import com.artfactory.project01.todayart.entity.Cart;
import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.entity.Product;
import com.artfactory.project01.todayart.model.ChangedCartItem;
import com.artfactory.project01.todayart.service.CartService;
import com.artfactory.project01.todayart.util.PrincipalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/cart")
public class CartController {

    @Autowired
    CartService cartService;
    private Member member;
    private static Member getMember(Principal principal){
        return (Member) PrincipalUtil.from(principal);
    }

    /*
    작성자: 국화
    장바구니에 담기 눌렀을 때 장바구니에 아이템 생성
    @Param Cart
    @Return Cart
    */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST')")
    @RequestMapping(method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public Cart createCart(@RequestBody Cart cart, Principal principal){

        member = getMember(principal);
        return cartService.createCart(member, cart);
    }


    /*
    작성자: 채경
    찜하기에서 장바구니로 이동을 누르면 장바구니로 이동됨
    (장바구니로 이동을 누르면 자동 찜하기에서는 삭제)
    @param Integer
    @return null
    */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN')")
    @RequestMapping(path="/{wishListId}",
            method = RequestMethod.POST,
            produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public Cart createWishToCart (@PathVariable("wishListId") int wishListId, Principal principal) {
        member = getMember(principal);
        return cartService.createWishToCart(member, wishListId);
    }



     /*
    작성자: 국화
    장바구니를 클릭했을 때 장바구니에 담겨있는 아이템이 보인다
    @Param
    @Return ArrayList<Cart>
    */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST')")
    @RequestMapping(method = RequestMethod.GET, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public List<Cart> retrieveCart(Principal principal){
        member = getMember(principal);
        return cartService.retrieveCart(member);
    }

     /*
    작성자: 국화
    장바구니에 담긴 아이템 수량변경
    @param Map<String, changeCartItem>
    @param Principal
    @return ArrayList<Cart>
    */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST')")
    @RequestMapping(method = RequestMethod.PATCH, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public List<Cart> updateCart(@RequestBody Map<String, ChangedCartItem> changedCartItem, Principal principal){
        member = getMember(principal);
        return cartService.updateCart(member,changedCartItem);
    }

     /*
    작성자: 국화
    장바구니에 담긴 아이템 삭제
    @param int
    @return null
    */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST')")
    @RequestMapping(path="/{id}", method = RequestMethod.DELETE, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public Cart deleteCart(@PathVariable("id")int cartId){
        cartService.deleteCart(cartId);
        Cart cart= new Cart();
        cart.setCartId(cartId);
        return cart;
    }

}
