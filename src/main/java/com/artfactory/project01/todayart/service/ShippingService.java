package com.artfactory.project01.todayart.service;

import com.artfactory.project01.todayart.entity.Ordered;
import com.artfactory.project01.todayart.entity.OrderedDetail;
import com.artfactory.project01.todayart.entity.Shipping;
import com.artfactory.project01.todayart.model.ShippingForm;
import com.artfactory.project01.todayart.model.ShippingModel;
import com.artfactory.project01.todayart.repository.OrderedDetailRepository;
import com.artfactory.project01.todayart.repository.OrderedRepository;
import com.artfactory.project01.todayart.repository.ShippingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.MultiValueMap;

import java.util.*;

@Service
public class ShippingService {
    @Autowired
    ShippingRepository shippingRepository;
    @Autowired
    OrderedRepository orderedRepository;
    @Autowired
    OrderedDetailRepository orderedDetailRepository;

    public List<Shipping> retrieveShippingList() {
        return shippingRepository.findAll();
    }

    @Transactional
    public List<Shipping> createShipping(ShippingModel model) {
        HashSet<Integer> artistIds = new HashSet<>();
        for(OrderedDetail item:model.getOrderedDetails()){
            int artistId = item.getProduct().getArtist().getArtistId();
            artistIds.add(artistId);
        }

        List<Shipping> shippings = new ArrayList<>();
        for(Integer artistId:artistIds){
            Shipping shipping = new Shipping();
            shipping.setOrderedId(model.getOrderedId());
            shipping.setArtistId(artistId);
            shipping.setMemberId(model.getMemberId());
            shipping.setConsignee(model.getConsignee());
            shipping.setConsigneePhone(model.getConsigneePhone());
            shipping.setPostalCode(model.getPostalCode());
            shipping.setReceiveAddr(model.getReceiveAddr());
            shipping = shippingRepository.save(shipping);
            shippings.add(shipping);
        }


        return shippings;
    }

    public Shipping updateShippingBefore(int id, ShippingForm shippingForm) {
        Shipping shipping = shippingRepository.findById(id).get();
        return shippingRepository.save(shippingForm.updateShippingBefore(shipping));
    }

    public Shipping deleteShipping(int id, ShippingForm shippingForm) {
        Shipping shipping = shippingRepository.findById(id).get();
        return shippingRepository.save(shippingForm.deleteShipping(shipping));
    }

    public Shipping updateShipping(int id, ShippingForm shippingForm) {
        Shipping shipping = shippingRepository.findById(id).get();
        return shippingRepository.save(shippingForm.updateShipping(shipping));
    }
}
