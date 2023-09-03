package com.kkb.erp.service;


import com.kkb.erp.model.User;

public interface UserService {

	// 회원가입
	public void memberJoin(User member) throws Exception;

	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;

	/* 로그인 */
	public User memberLogin(User member) throws Exception;

	/* 주문자 정보 */
	public User getMemberInfo(String memberId);
}