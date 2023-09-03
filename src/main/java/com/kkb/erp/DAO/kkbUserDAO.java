package com.kkb.erp.DAO;

import com.kkb.erp.model.User;

public interface kkbUserDAO {

	// 회원가입
	public void memberJoin(User member);

	// 아이디 중복 검사
	public int idCheck(String memberId);

	// 로그인
	public User memberLogin(User member);

	// 회원 정보 조회
	public User getMemberInfo(String memberId);
}
