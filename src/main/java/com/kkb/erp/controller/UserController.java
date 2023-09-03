package com.kkb.erp.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kkb.erp.model.User;
import com.kkb.erp.service.UserService;

@Controller
@RequestMapping(value = "/kkb_login")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public void joinGET() {
        logger.info("회원가입 페이지 진입");
    }

    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String joinPOST(User member) throws Exception {
        userService.memberJoin(member);
        return "redirect:/main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void loginGET() {
        logger.info("로그인 페이지 진입");
    }

    @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
    @ResponseBody
    public String memberIdChkPOST(String memberId) throws Exception {
        logger.info("memberIdChk() 진입");
        int result = userService.idCheck(memberId);
        logger.info("결과값 = " + result);
        if (result != 0) {
            return "fail"; // 중복 아이디가 존재
        } else {
            return "success"; // 중복 아이디 없음
        }
    }

    @RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception {
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호: " + email);
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호: " + checkNum);

        String setFrom = "kkb3431@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "인증번호는 " + checkNum + "입니다. 회원가입 페이지로 돌아가 인증번호를 입력해주세요.";

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content);

            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String num = Integer.toString(checkNum);
        return num;
    }
	// 로그인 상태 확인 메서드
	private boolean isLoggedIn(HttpSession session) {
		User member = (User) session.getAttribute("member");
		return member != null;
	}

	// 메인 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainGET(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		boolean isLoggedIn = isLoggedIn(session);
		model.addAttribute("isLoggedIn", isLoggedIn);
		return "main";
	}

	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, User member, RedirectAttributes rttr) throws Exception {
		logger.info("loginPOST");
		HttpSession session = request.getSession();
		User login = userService.memberLogin(member);
		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			session.setAttribute("member", login);
		}
		return "redirect:/main";
	}

	/* 메인페이지 로그아웃 */
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		logger.info("logoutMainGET메서드 진입");

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/main";

	}
}
