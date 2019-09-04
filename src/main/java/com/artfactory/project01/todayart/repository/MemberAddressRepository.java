package com.artfactory.project01.todayart.repository;

import com.artfactory.project01.todayart.entity.MemberAddress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MemberAddressRepository extends JpaRepository<MemberAddress, Integer> {
    Optional<MemberAddress> findByMainAddress(String y);
    List<MemberAddress> findAllByMemberId(Integer userId);
    List<MemberAddress> findAllByMemberIdAndIsDelete(Integer userId, String isDelete);
    MemberAddress findByMemberIdAndMainAddressAndIsDelete(Integer memberId, String mainAddress, String isDelete);
    MemberAddress findByMemberIdAndAddressId(Integer memberId, Integer addressId);
}
