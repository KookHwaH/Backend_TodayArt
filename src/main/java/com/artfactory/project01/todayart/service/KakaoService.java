package com.artfactory.project01.todayart.service;

import com.artfactory.project01.todayart.controller.OrderController;
import com.artfactory.project01.todayart.controller.ShippingController;
import com.artfactory.project01.todayart.entity.Ordered;
import com.artfactory.project01.todayart.entity.OrderedDetail;
import com.artfactory.project01.todayart.entity.KakaoInfoRequest;
import com.artfactory.project01.todayart.model.kakao.KakaoRequest;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

@Service
@Log
public class KakaoService {
    private static final String HOST = "https://kapi.kakao.com";
    private KakaoRequest kakaoRequest;
    private KakaoInfoRequest kakaoInfoRequest;
    @Autowired
    OrderController orderController;
    @Autowired
    ShippingController shippingController;


    public ResponseEntity kakaoPayReady(Ordered ordered){
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = headers();

        MultiValueMap<String, String> params = params(ordered);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);

        try{
            kakaoRequest = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoRequest.class);

            log.info("KakaoPayReadyVO : "+kakaoRequest);

            return new ResponseEntity<KakaoRequest>(kakaoRequest, HttpStatus.OK);
        }catch (RestClientException e){
            e.printStackTrace();
        }catch (URISyntaxException e){
            e.printStackTrace();
        }
        return new ResponseEntity<String>("/kakaoPaySuccessFail", HttpStatus.BAD_REQUEST);

    }

    public MultiValueMap<String,String> params (Ordered ordered) {

        MultiValueMap<String, String> params = new LinkedMultiValueMap<String,String>();
        List<OrderedDetail> orderedDetails = ordered.getOrderDetails();
        int totalQuantity = 0;

        for(OrderedDetail item : orderedDetails){totalQuantity+=item.getQuantity();}

        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", ordered.getOrderId().toString());
        params.add("partner_user_id", ordered.getMemberId().toString());
        params.add("item_name", orderedDetails.get(0).getProductName()
                + (checkSize(ordered)!= 1?" 외 "+(checkSize(ordered)-1)+"건":""));
        params.add("quantity", totalQuantity+"");
        params.add("total_amount", ordered.getTotalPrice().toString());
        params.add("tax_free_amount", ordered.getTotalPrice().toString());
        params.add("approval_url", "http://localhost:3000/checkout/kakaoSuccess");
        params.add("cancel_url", "http://localhost:3000/checkout/kakaoCancel");
        params.add("fail_url", "http://localhost:3000/checkout/kakaoSuccessFail");

        return params;

    }

    public int checkSize(Ordered ordered){
        return ordered.getOrderDetails().size();
    }



    public ResponseEntity kakaoPayInfo(Ordered ordered, String pg_token, String tid){
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = headers();

        MultiValueMap<String, String> params = infoParams(ordered, pg_token, tid);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);

        try{
            kakaoInfoRequest = restTemplate.postForObject(new URI(HOST+"/v1/payment/approve"), body, KakaoInfoRequest.class);
            log.info("kakaoInfoRequest"+kakaoInfoRequest);
            log.info("!!!!!!!!!!!!결제 승인 성공!!!!!!!!!!!!!");
            orderController.updateKakaoOrders(ordered, kakaoInfoRequest);
            return new ResponseEntity<KakaoInfoRequest>(kakaoInfoRequest, HttpStatus.OK);
        }catch(RestClientException e){
            e.printStackTrace();
        }catch (URISyntaxException e){
            e.printStackTrace();;
        }
        return new ResponseEntity<String>("결제 정보를 찾을 수 없습니다", HttpStatus.NOT_FOUND);
    }

    public MultiValueMap<String, String> infoParams(Ordered ordered,String pg_token, String tid){
        log.info("ordered : "+ordered);
        log.info("ordered.getOrderedId : "+ordered.getOrderId());
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", tid);
        params.add("partner_order_id", ordered.getOrderId().toString());
        params.add("partner_user_id", ordered.getMemberId().toString());
        params.add("pg_token", pg_token);
        params.add("total_amount", ordered.getTotalPrice().toString());
        return params;
    }


    public HttpHeaders headers(){
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK fe28e9c152baf07902fb72a7e6120c29");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE+";charset=UTF-8");
        return headers;
    }
}
