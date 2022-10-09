package com.nrifintech.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nrifintech.lms.entity.Member;
import com.nrifintech.lms.entity.User;


@Repository
public interface MemberRepository extends JpaRepository<Member, Integer> {

}
