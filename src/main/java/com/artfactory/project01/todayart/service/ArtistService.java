package com.artfactory.project01.todayart.service;

import com.artfactory.project01.todayart.entity.*;
import com.artfactory.project01.todayart.model.InfomationForSeller;
import com.artfactory.project01.todayart.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ArtistService {

    @Autowired
    ArtistRepository artistRepository;

    @Autowired
    MemberRepository memberRepository;

    @Autowired
    OrderedRepository orderedRepository;

    @Autowired
    OrderedDetailRepository orderedDetailRepository;

    @Autowired
    ShippingRepository shippingRepository;

    @Autowired
    ShippingItemsRepository shippingItemsRepository;

    @Transactional
    public Artist createArtist(int id, Artist artist){
        Member member = memberRepository.findById(id).get();

            artist.setMemberId(member.getMemberId());
            artist.setArtistName(member.getRealName());

            return artistRepository.save(artist);

    }

    @Transactional
    public Artist updateArtist(int id){
        Date admCheckDated = new Date();
        Artist artist = artistRepository.findById(id).get();
//        if(admBtn == true)
        artist.setAdmCheck("n");
        artist.setAdmCheckDated(admCheckDated);
        return artistRepository.save(artist);
    }

    @Transactional
    public ResponseEntity retrieveArtistInfo(Member member) {
        try {
            Artist artist = artistRepository.findByMemberId(member.getMemberId());
            List<InfomationForSeller> infoList = new ArrayList<>();
            List<OrderedDetail> orderedDetails = orderedDetailRepository.findAllByProduct_ArtistOrderByOrderIdDesc(artist);
            for (OrderedDetail item : orderedDetails) {
                InfomationForSeller info = new InfomationForSeller();
                Ordered order = orderedRepository.findById(item.getOrderId()).get();
                Shipping shipping = shippingRepository.findByOrderedIdAndArtistId(order.getOrderId(), artist.getArtistId());
                ShippingItems shippingItems = shipping==null?null:shippingItemsRepository.findByShippingId(shipping.getShippingId());
                info.setOrderedId(item.getOrderId());
                info.setOrderDetailId(item.getOrderDetailId());
                info.setMemberId(order.getMemberId());
                info.setProductName(item.getProductName());
                info.setQuantity(item.getQuantity());
                info.setProductPrice(item.getProductPrice());
                info.setFilename(item.getProduct().getThumbnail().getFileName());
                info.setShippingFee(item.getShippingFee());
                info.setTotalPrice(item.getTotalPrice());
                info.setOrderedDate(order.getOrderDate());
                info.setOrderStatus(item.getStatus());


                info.setPostalNumber(shipping==null?null:shipping.getPostalCode());
                info.setConsignee(shipping==null?null:shipping.getConsignee());
                info.setConsigneePhone(shipping==null?null:shipping.getConsigneePhone());
                info.setAddress(shipping==null?null:shipping.getReceiveAddr());
                info.setCourier(shipping==null?null:shipping.getCourier());
                info.setTrackingNumber(shipping==null?null:shipping.getTrackingNumber());
                info.setShippingStatus(shippingItems==null?null:shippingItems.getStatus());

                infoList.add(info);
            }
            return new ResponseEntity(infoList, HttpStatus.OK);
        }catch(Exception e){
            e.printStackTrace();
            return new ResponseEntity(e, HttpStatus.BAD_REQUEST);
        }
    }
}
