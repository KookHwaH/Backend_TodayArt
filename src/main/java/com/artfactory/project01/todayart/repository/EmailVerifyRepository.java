package com.artfactory.project01.todayart.repository;

import com.artfactory.project01.todayart.entity.EmailVerify;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmailVerifyRepository extends JpaRepository<EmailVerify, Integer> {
    EmailVerify findByMemberId(Integer memberId);
    EmailVerify findByVerifyText(String verifyText);
}
