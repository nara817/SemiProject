package com.gdu.semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.semi.domain.MemberDTO;
import com.gdu.semi.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void memberJoin(MemberDTO member) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public boolean memberLogin(MemberDTO member) {
		// TODO Auto-generated method stub
		return false;
	}
}
