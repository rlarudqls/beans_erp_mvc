package com.kkb.erp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kkb.erp.DAO.kkbUserDAO;
import com.kkb.erp.model.User;
import com.kkb.erp.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	kkbUserDAO kkbUserDAO;

	@Override
	public void memberJoin(User member) throws Exception {

		kkbUserDAO.memberJoin(member);

	}

	@Override
	public int idCheck(String memberId) throws Exception {

		return kkbUserDAO.idCheck(memberId);
	}

	/* 로그인 */
	@Override
	public User memberLogin(User member) throws Exception {

		return kkbUserDAO.memberLogin(member);

	}

	/* 주문자 정보 */
	@Override
	public User getMemberInfo(String memberId) {

		return kkbUserDAO.getMemberInfo(memberId);

	}
}