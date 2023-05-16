package com.gdu.semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdu.semi.domain.UserDTO;
import com.gdu.semi.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
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
