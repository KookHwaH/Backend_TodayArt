package com.artfactory.project01.todayart.repository;

import com.artfactory.project01.todayart.entity.ShippingItems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShippingItemsRepository extends JpaRepository<ShippingItems, Integer> {
    ShippingItems findByShippingId(int id);
}
