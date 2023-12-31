package kr.co.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.service.UserService;
import kr.co.vo.UserVo;

@Controller
public class UserController {

	@Autowired
	private UserService service;

	@GetMapping(value = { "/" })
	public String home() {
		return "index";
	}

	@PostMapping("/regist")
	public String registAfter(@RequestParam String userName, @RequestParam String userId, @RequestParam String userPw,
			@RequestParam("rn1") String rnString1, @RequestParam("rn2") String rnString2, HttpServletRequest req) {
		UserVo vo = new UserVo();
		String rnString = rnString1 + rnString2;
		long rnN = Long.parseLong(rnString);

		vo.setUserName(userName);
		vo.setUserId(userId);
		vo.setUserPw(userPw);
		vo.setRegistNumber(rnN);
		service.insertUser(vo);

		return "index";
	}

	@PostMapping(value = { "/regist/login", "/login" })
	public String loginAfter(@RequestParam String userId, @RequestParam String userPw, HttpServletRequest req) {
		UserVo vo = new UserVo();
		vo = service.selectUserById(userId);
		if (vo != null) {
			System.out.println("아이디일치!!!!!!");
			if (vo.getUserPw().equals(userPw)) {
				System.out.println("로그인 성공!!!!!!!");
				HttpSession session = req.getSession(false);
				session.setAttribute("sessionVo", vo);
				session.setAttribute("check", true);
				return "index";
			} else {
				System.out.println("아이디 일치, 비밀번호 틀림 ㅅㄱ");
				return "index";
			}
		} else {
			System.out.println("해당아이디없음 ㅅㄱ");
			return "index";
		}
	}

	@RequestMapping(value = "/logout")
	public String logoutAfter(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.invalidate();
		System.out.println("로그아웃 ㅅㄱ");
		return "index";
	}

	@RequestMapping(value = "/deleteUser")
	public String deleteAfter(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		UserVo vo = (UserVo) session.getAttribute("sessionVo");
		if (service.deleteUser(vo) > 0) {
			System.out.println("회원탈퇴함");
			session.invalidate();
		} else {
			System.out.println("회원탈퇴안됨 ㄷㄷ");
		}
		return "index";
	}

	@PostMapping("/userInfoEdit")
	public String infoEdit(HttpServletRequest req, @RequestParam String userPw) {
		HttpSession session = req.getSession(false);
		UserVo vo = (UserVo) session.getAttribute("sessionVo");
		vo.setUserPw(userPw);
		service.updateUser(vo);
		System.out.println("비밀변호 변경됨..");
		return "index";
	}

}
