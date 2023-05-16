package com.gdu.semi.service;

import com.gdu.semi.domain.UserDTO;

public interface UserService {
	


	public void memberJoin(UserDTO member);

	public boolean memberLogin(UserDTO member);
}

