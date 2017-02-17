package com.scmaster.web5.dao;

import com.scmaster.web5.vo.Member;

public interface MemberMapper {

	public Member searchMember(String idCheck);
	public int insertMember(Member mb);
	public int updateMember(Member mb);
}
