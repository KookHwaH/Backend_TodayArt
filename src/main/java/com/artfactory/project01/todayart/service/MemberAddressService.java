package com.artfactory.project01.todayart.service;

import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.entity.MemberAddress;
import com.artfactory.project01.todayart.repository.MemberAddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class MemberAddressService {
    @Autowired
    MemberAddressRepository memberAddressRepository;

    @Transactional
    public ResponseEntity createMemberAddress(Member member, MemberAddress memberAddress){
        try {
            if (memberAddress.getMainAddress() == "y") {
                Optional<MemberAddress> oldMainAddress = memberAddressRepository.findByMainAddress("y");
                oldMainAddress.get().setMainAddress("n");
                memberAddressRepository.save(oldMainAddress.get());
                memberAddress.setMemberId(member.getMemberId());
                memberAddress = memberAddressRepository.save(memberAddress);
            } else {
                memberAddress.setMemberId(member.getMemberId());
                memberAddress = memberAddressRepository.save(memberAddress);
            }
        return new ResponseEntity(memberAddress, HttpStatus.OK);
        }catch(Exception e){
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }
    }

    public ResponseEntity retrieveMemberAddress(Member member){
        try {
            List<MemberAddress> memberAddresses = memberAddressRepository.findAllByMemberIdAndIsDelete(member.getMemberId(), "n");
            return new ResponseEntity(memberAddresses, HttpStatus.OK);
        }catch(Exception e){
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
    }

    public ResponseEntity updateMainAddress(Member member, Integer addressId) {
        try {
            MemberAddress oldMainMemberAddress =
                    memberAddressRepository.findByMemberIdAndMainAddressAndIsDelete(
                            member.getMemberId(), "y", "n");

            if(oldMainMemberAddress != null) {
                oldMainMemberAddress.setMainAddress("n");
                memberAddressRepository.save(oldMainMemberAddress);
            }

            Optional<MemberAddress> newMainMemberAddress = memberAddressRepository.findById(addressId);
            newMainMemberAddress.get().setMainAddress("y");
            memberAddressRepository.save(newMainMemberAddress.get());

            return new ResponseEntity(newMainMemberAddress, HttpStatus.OK);
        }catch(Exception e){
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
    }

    public ResponseEntity deleteAddress(Member member, Integer addressId) {
        try {
            MemberAddress memberAddress = memberAddressRepository.findByMemberIdAndAddressId(member.getMemberId(), addressId);
            memberAddress.setIsDelete("y");
            memberAddressRepository.save(memberAddress);

            return new ResponseEntity(memberAddress, HttpStatus.OK);
        }catch(Exception e){
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
    }
}
