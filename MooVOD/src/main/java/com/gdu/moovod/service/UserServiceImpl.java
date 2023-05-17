package com.gdu.moovod.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.moovod.domain.UserDTO;
import com.gdu.moovod.mapper.MemberMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void memberJoin(UserDTO member) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public boolean memberLogin(UserDTO member) {
		// TODO Auto-generated method stub
		return false;
	}
}
