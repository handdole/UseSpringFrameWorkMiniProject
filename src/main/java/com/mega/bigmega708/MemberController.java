package com.mega.bigmega708;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	MemberDAO dao;
	
	
	@RequestMapping("mypage.do")
	public void selectone(String id , Model m) {
//		System.out.println(id);
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		MemberDTO dto2 = dao.selectone(dto);
//		System.out.println(dto2);
		m.addAttribute("dto", dto2);
	}
	
	@RequestMapping("update.do")
	public String update(MemberDTO memberDTO) {
		dao.update(memberDTO);
		return "ok";
	}
	
	@RequestMapping("pwcheck.do")
	public String pwcheck(String id , String pw) {
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		System.out.println(dto);
		MemberDTO dto2 = dao.pwCheck(dto);
		System.out.println(dto2 + "비밀번호는 : " +pw);
		if (dto2.getPw().equals(pw)) {
			return "ok";
		} else {
			return "no";
		}
	}
	
	@RequestMapping("delete.do")
	public String delete(MemberDTO memberDTO , HttpSession session) {
		dao.delete(memberDTO);
		System.out.println(memberDTO);
		session.invalidate();
		return "ok";
	}
	
	@RequestMapping("pwupdate.do")
	public String pwupdate(MemberDTO memberDTO) {
		dao.pwupdate(memberDTO);
		return "ok";
	}
	
	
}
