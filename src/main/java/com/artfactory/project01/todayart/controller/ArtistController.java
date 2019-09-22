package com.artfactory.project01.todayart.controller;

import com.artfactory.project01.todayart.entity.Artist;
import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.repository.ArtistRepository;
import com.artfactory.project01.todayart.service.ArtistService;
import com.artfactory.project01.todayart.util.PrincipalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@RequestMapping("/artists")
public class ArtistController {

    @Autowired
    ArtistService artistService;

    @Autowired
    ArtistRepository artistRepository;


    /*
       작성자:  희창
       기능 설명 : 판매회원 신청
      @param int id(PathVariable), Artist
      @return member에서 id,username가져온 artist객체
      * 상품이미지는 프론트에서 올릴때 그정보 받아서 등록할 예정
    */
//    @PreAuthorize("hasAnyRole('CUSTOMER')")
    @PostMapping(path = "/{id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public Artist createArtist(@PathVariable("id") int id,@RequestBody Artist artist){
        return artistService.createArtist(id, artist);
    }
    /*
       작성자:  희창
       기능 설명 : 판매회원 승인,거부 체크
      @param int id(PathVariable)
      @return id로 조회한 artist객체
      * 프론트에서 승인 누를시 true, 거부 누를시 false로 해서 조건 줄 예정
    */
    @PreAuthorize("hasRole('ADMIN')")
    @PatchMapping(path = "/{id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public Artist updateArtist(@PathVariable("id") int id){
        return artistService.updateArtist(id);
    }


    @GetMapping(path="/info", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity retrieveArtistInfo(Principal principal){
        Member member = (Member)PrincipalUtil.from(principal);
        return artistService.retrieveArtistInfo(member);

    }
}
