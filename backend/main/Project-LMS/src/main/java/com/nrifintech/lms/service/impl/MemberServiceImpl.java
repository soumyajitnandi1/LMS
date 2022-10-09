package com.nrifintech.lms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nrifintech.lms.entity.Member;
import com.nrifintech.lms.repository.MemberRepository;
import com.nrifintech.lms.service.MemberService;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberRepository memberRepository;
	@Override
	public void save(Member member) {
		memberRepository.save(member);
	}
	
}
