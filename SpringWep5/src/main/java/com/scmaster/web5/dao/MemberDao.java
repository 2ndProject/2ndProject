package com.scmaster.web5.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.web5.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	
	private SqlSession sqlsession;
	
	//검색기능
	public Member searchMember(String idCheck){
		MemberMapper mapper=sqlsession.getMapper(MemberMapper.class);
		Member member=mapper.searchMember(idCheck);
		return member;
	}
	
	//회원가입
	public int insertMember(Member mb){
		MemberMapper mapper=sqlsession.getMapper(MemberMapper.class);
		int result=mapper.insertMember(mb);
		return result;
	}
	
	//회원정보수정
	public int updateMember(Member mb){
		MemberMapper mapper=sqlsession.getMapper(MemberMapper.class);
		int result=mapper.updateMember(mb);
		return result;
	}
}
