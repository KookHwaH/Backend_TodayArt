package com.artfactory.project01.todayart.repository;

import com.artfactory.project01.todayart.entity.Shipping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShippingRepository extends JpaRepository<Shipping, Integer> {
    Shipping findByOrderedIdAndArtistId(int OrderId, int ArtistId);
}
