package com.scmaster.web5.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.scmaster.web5.dao.MemberDao;
import com.scmaster.web5.vo.Member;

@Controller
@SessionAttributes("member")
public class memberController {

	@Autowired

	private MemberDao dao;

	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		Member member = new Member();// 객체를 실제로 만들어서 모델에
		model.addAttribute("member", member);
		// 회원가입폼으로 이동시 모델에 멤버를 넣어 세션까지 가지고 있는 멤버를 만든다.
		return "Member/joinForm";
	}

	@RequestMapping(value = "idCheckForm", method = RequestMethod.GET)
	public String idCheckForm(Model model) {
		model.addAttribute("search", false);
		return "Member/idCheckForm";
	}

	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public String idCheck(Model model, String idCheck) {
		model.addAttribute("search", true);
		try {
			Member result = dao.searchMember(idCheck);
			model.addAttribute("result", result);
			model.addAttribute("idCheck", idCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Member/idCheckForm";
	}

	@RequestMapping(value = "joinComplete", method = RequestMethod.GET)
	public String joinComplete(Model model, @ModelAttribute("member") Member mb, SessionStatus sessionStatus) {
		model.addAttribute("id", mb.getCustid());
		sessionStatus.setComplete();// 세션에 있었던 멤버라는 정보는 다 사라짐.

		return "Member/joinComplete";
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute("member") Member mb, Model model) {
		int result = 0;
		try {
			result = dao.insertMember(mb);
			if (result == 0) {
				model.addAttribute("errMsg", "가입실패");
				return "Member/joinForm";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsg", "가입실패");
			return "Member/joinForm";
		}
		return "redirect:joinComplete";
	}
	
	@RequestMapping(value="updateForm", method = RequestMethod.GET)
	public String updateForm(HttpSession session, Model model){
		String custid=(String) session.getAttribute("custid");
		Member mb=dao.searchMember(custid);
		model.addAttribute("member", mb);
		return "Member/updateForm";
	}

	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(Member mb, Model model){
		int result = 0;
		try {
			result = dao.updateMember(mb);
			if (result == 0) {
				model.addAttribute("errMsg", "수정실패");
				return "Member/updateForm";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errMsg", "수정실패");
			return "Member/updateForm";
		}
		return "redirect:/";
	}
	
}
