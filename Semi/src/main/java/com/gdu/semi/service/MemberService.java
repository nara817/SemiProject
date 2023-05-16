package com.gdu.semi.service;

import com.gdu.semi.domain.MemberDTO;

public interface MemberService {
	


	public void memberJoin(MemberDTO member);

	public boolean memberLogin(MemberDTO member);
}

