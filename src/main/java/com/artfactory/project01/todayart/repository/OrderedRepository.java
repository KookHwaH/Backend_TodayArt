package com.artfactory.project01.todayart.repository;

import com.artfactory.project01.todayart.entity.Ordered;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public interface OrderedRepository extends JpaRepository<Ordered, Integer> {
    @Query(value = "SELECT * FROM ordered WHERE member_id = ?1 and isHidden = 'n' Order By order_dated DESC", nativeQuery = true)
    List<Ordered> findByMemberId(Integer memberId);


    List<Ordered> findAllByOrderDetails_Status(String status);

    List<Ordered> findAllByOrderDetails_StatusAndMemberId(String status, int memberId);


    @Query(value = "SELECT * FROM ordered WHERE member_id = ?1 and order_dated BETWEEN ?2 AND DATE_ADD(?3, INTERVAL 1 DAY)", nativeQuery = true)
    ArrayList<Ordered> findByMemberIdWithTerm(int memberId, Date startDate, Date endDate);

    @Query(value = "SELECT * FROM ordered WHERE order_dated BETWEEN ?1 AND DATE_ADD(?2, INTERVAL 1 DAY)",nativeQuery = true)
    ArrayList<Ordered> findByMemberIdWithTerm(Date startDate, Date endDate);

    Ordered findByOrderId(int orderId);

    Ordered findByOrderIdAndMemberId(int orderId, int memberId);


}
