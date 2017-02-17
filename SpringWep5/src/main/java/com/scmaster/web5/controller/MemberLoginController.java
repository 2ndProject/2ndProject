package com.scmaster.web5.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.web5.dao.MemberDao;
import com.scmaster.web5.vo.Member;

@Controller

public class MemberLoginController {

	@Autowired
	MemberDao dao = new MemberDao();

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm(String password) {
		/* member.getPassword.equals(password); */
		return "Member/loginForm";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String custid, String password, Model model, HttpSession session) {
		Member member = dao.searchMember(custid);

		if (member == null) {
			model.addAttribute("loginErr", "로그인정보가 틀렸습니다.");
			return "Member/loginForm";
		} else {
			if (member.getPassword().equals(password)) {
				session.setAttribute("custid", member.getCustid());
				session.setAttribute("name", member.getName());
				return "redirect:/";
			} else {
				model.addAttribute("loginErr", "로그인정보가 틀렸습니다.");
				return "Member/loginForm";
			}
		}
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}
