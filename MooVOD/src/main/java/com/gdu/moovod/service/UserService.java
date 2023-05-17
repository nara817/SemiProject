package com.gdu.moovod.service;

import com.gdu.moovod.domain.UserDTO;

public interface UserService {
	


	public void memberJoin(UserDTO member);

	public boolean memberLogin(UserDTO member);
}

