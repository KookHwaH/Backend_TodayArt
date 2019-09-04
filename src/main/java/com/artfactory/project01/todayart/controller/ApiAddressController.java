package com.artfactory.project01.todayart.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;


@RestController
public class ApiAddressController {
	
    @GetMapping(value="/getAddrApi", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public void getAddrApi(@RequestParam String keyword, HttpServletResponse response) throws Exception {
		// 요청변수 설정
    	String currentPage = "1"; //요청 변수 설정 (현재 페이지. currentPage : n > 0)
		String countPerPage = "20"; //요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
		String resultType = "json"; //요청 변수 설정 (검색결과형식 설정, json)
		String confmKey = "devU01TX0FVVEgyMDE5MDkwMTE0NDY1MDEwODk5MzQ="; //요청 변수 설정 (승인키)

		// OPEN API 호출 URL 정보 설정
		String apiUrl = "http://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey+"&resultType="+resultType;
		URL url = new URL(apiUrl);
    	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
    	StringBuffer sb = new StringBuffer();
    	String tempStr = null;

    	while(true){
    		tempStr = br.readLine();
    		if(tempStr == null) break;
    		sb.append(tempStr);								// 응답결과 JSON 저장
    	}
    	br.close();
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(sb.toString());			// 응답결과 반환
    }
}
