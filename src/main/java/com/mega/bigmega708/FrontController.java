package com.mega.bigmega708;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FrontController {

	@Autowired
	MemberDAO dao;
	
	
	@RequestMapping("idcheck.do")
	public String idcheck(MemberDTO memberDTO , Model model) {
		int result = dao.idcheck(memberDTO);
		String page = "";
		if (result == 1) {
			page = "ok";
			
		} else {
			page = "no";
		}
		return page;
	}
	
	@RequestMapping("insert.do")
	public String insert(MemberDTO memberDTO) {
		dao.insert(memberDTO);
		return "ok";
	}
	
	@RequestMapping("login.do")
	public String login(MemberDTO memberDTO , HttpSession request) {
		MemberDTO dto = dao.login(memberDTO);
		String page = "";
		if (dto != null) {
			page = "ok";
			System.out.println(dto.getId());
			request.setAttribute("id", dto.getId());
		} else {
			page = "no";
		}
		return page;
	}
	
	
}
