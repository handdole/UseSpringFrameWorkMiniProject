package com.mega.bigmega708;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BbsController {
	@Autowired
	BbsDAO dao;
	
	@Autowired
	ReplyDAO r_dao;

	@RequestMapping("write.do")
	public String write(BbsDTO bbsDTO, Model model) {
		dao.insert(bbsDTO);		
		System.out.println(bbsDTO);
		List<BbsDTO> list = dao.list();
		int total = list.size();
		model.addAttribute("list", list);
		model.addAttribute("total", total);		
		return "bbs";
	}

	@RequestMapping("content.do")
	public String content(BbsDTO bbsDTO, Model model, ReplyDTO replyDTO) {
		BbsDTO select = dao.select(bbsDTO);		
		List<BbsDTO> list = dao.list();
		List<ReplyDTO> reply_list = r_dao.list(replyDTO);
		int total = list.size();
		model.addAttribute("list", list);
		model.addAttribute("reply_list", reply_list);
		model.addAttribute("total", total);
		model.addAttribute("bbsDTO", select);
		return "bbscontent";
	}

	@RequestMapping("bbs.do")
	public void bbs(Model model) {		
		List<BbsDTO> list = dao.list();
		int total = list.size();
		model.addAttribute("list", list);
		model.addAttribute("total", total);			
	}

	@RequestMapping("bbsupdate.do")
	public String bbs(BbsDTO bbsDTO, Model model, ReplyDTO replyDTO) {
		dao.update(bbsDTO);
		BbsDTO select = dao.select(bbsDTO);	
		List<BbsDTO> list = dao.list();
		List<ReplyDTO> reply_list = r_dao.list(replyDTO);
		int total = list.size();
		model.addAttribute("list", list);
		model.addAttribute("reply_list", reply_list);
		model.addAttribute("total", total);
		model.addAttribute("bbsDTO", select);
		return "bbscontent";
	}
	@RequestMapping("reply.do")
	public String reply(BbsDTO bbsDTO, ReplyDTO replyDTO, Model model) {	
		System.out.println(bbsDTO);
		System.out.println(replyDTO);
		r_dao.insert(replyDTO);	
		BbsDTO select = dao.select(bbsDTO);	
		List<BbsDTO> list = dao.list();
		List<ReplyDTO> reply_list = r_dao.list(replyDTO);
		int total = list.size();
		model.addAttribute("list", list);
		model.addAttribute("reply_list", reply_list);
		model.addAttribute("total", total);
		model.addAttribute("bbsDTO", select);
		return "bbscontent";
	}
	@RequestMapping("reply_delete.do")
	public String reply_delete(BbsDTO bbsDTO, ReplyDTO replyDTO, Model model) {
		r_dao.delete(replyDTO);
		BbsDTO select = dao.select(bbsDTO);	
		List<BbsDTO> list = dao.list();
		List<ReplyDTO> reply_list = r_dao.list(replyDTO);
		int total = list.size();
		model.addAttribute("list", list);
		model.addAttribute("reply_list", reply_list);
		model.addAttribute("total", total);
		model.addAttribute("bbsDTO", select);
		return "bbscontent";
	}
	@RequestMapping("content_delete.do")
	public String content_delete(BbsDTO bbsDTO, ReplyDTO replyDTO, Model model) {
		dao.delete(bbsDTO);
		r_dao.all_delete(replyDTO);		
		List<BbsDTO> list = dao.list();
		int total = list.size();
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		return "bbs";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:login.jsp";
	}
	
}
