package com.kkbERP.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class kkbController {

	private static final Logger logger = LoggerFactory.getLogger(kkbController.class);
	
	//메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET() {
		
		logger.info("메인 페이지 진입");
		
	}

}

//웹 애플리케이션의 기본 작동 여부를 확인하기 위한 테스트용 단순 컨트롤러입니다.
