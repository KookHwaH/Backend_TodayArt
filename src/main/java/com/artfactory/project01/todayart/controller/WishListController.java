package com.artfactory.project01.todayart.controller;



import com.artfactory.project01.todayart.entity.Cart;
import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.entity.WishList;
import com.artfactory.project01.todayart.service.WishListService;
import com.artfactory.project01.todayart.util.PrincipalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;

@RestController
@RequestMapping(value = "/wish")
public class WishListController {


    @Autowired
    WishListService wishListService;
    private Member member;
    private static Member getMember(Principal principal){
        return (Member) PrincipalUtil.from(principal);
    }

    /*
    작성자: 채경
    찜하기(하트버튼) 눌렀을 때 장바구니에 아이템 생성
    @Param WishList
    @Return WishList
    */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN')")
    @RequestMapping(method = RequestMethod.POST, produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public WishList createWishList(@RequestBody WishList wishList, Principal principal){
        member = getMember(principal);
        return wishListService.createWishList(member, wishList);
    }


    /*
   작성자: 채경
   찜하기를 클릭했을 때 나오는 찜하기 리스트
   @Param
   @Return ArrayList<Cart>
   */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN')")
    @RequestMapping(method = RequestMethod.GET,
                    produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ArrayList<WishList> retrieveWishList(Principal principal){
        member = getMember(principal);
        return wishListService.retrieveWishList(member);
    }




    /*
    작성자: 채경
    찜하기에 담긴 아이템 삭제
    @param Integer
    @return null
    */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST', 'ADMIN')")
    @RequestMapping(path="/{wishlistId}",
            method = RequestMethod.DELETE,
            produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public WishList deleteWishList(@PathVariable("wishlistId")Integer wishlistId){
        wishListService.deleteWishList(wishlistId);
        WishList wishList = new WishList();
        wishList.setWishlistId(wishlistId);
        return wishList;

    }








}
