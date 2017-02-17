package com.scmaster.web5.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scmaster.web5.dao.BoardDao;
import com.scmaster.web5.vo.Board;

@Controller
public class BoardController {

	@Autowired

	private BoardDao dao;

	@RequestMapping(value = "boardlist", method = RequestMethod.GET)
	public String boardlist(Model model) {
		ArrayList<Board> bList = dao.selectAll();
		model.addAttribute("bList", bList);

		return "Board/boardlist";
	}

	@RequestMapping(value = "boardWriteForm", method = RequestMethod.GET)
	public String boardWriteForm() {
		return "Board/boardWriteForm";
	}

	@RequestMapping(value = "boardWirte", method = RequestMethod.POST)
	public String boardWrite(Board board, HttpSession session) {
		String custid = (String) session.getAttribute("custid");
		board.setId(custid);

		try {
			dao.boardWrite(board);
		} catch (Exception e) {
			e.printStackTrace();
			return "Board/boardWriteForm";
		}
		return "redirect:boardlist";
	}

	@RequestMapping(value = "boardRead", method = RequestMethod.GET)
	public String boardRead(String boardNum, Model model) {
		int num = Integer.parseInt(boardNum);

		try {
			Board board = dao.boardRead(num);
			model.addAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:boardlist";
		}
		return "Board/boardRead";
	}

}
