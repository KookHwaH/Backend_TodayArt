package com.artfactory.project01.todayart.repository;

import com.artfactory.project01.todayart.entity.Artist;
import com.artfactory.project01.todayart.entity.OrderedDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderedDetailRepository extends JpaRepository<OrderedDetail, Integer> {

    @Query(value = "select * from ordered_detail where ordered_id = ?1", nativeQuery = true)
    List<OrderedDetail> findAllByOrderId(int orderId);

    OrderedDetail findByOrderDetailId(int orderDetailId);


    List<OrderedDetail> findAllByOrderIdAndStatus(int memberId, String status);

    List<OrderedDetail> findAllByProduct_ArtistOrderByOrderIdDesc(Artist artist);
}
