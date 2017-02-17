package com.scmaster.web5.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scmaster.web5.vo.Board;

@Repository
public class BoardDao {

	@Autowired

	private SqlSession sqlsession;

	public int boardWrite(Board board) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		int result = mapper.boardWrite(board);
		return result;
	}

	public ArrayList<Board> selectAll() {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		ArrayList<Board> bList = mapper.selectAll();
		return bList;
	}

	public Board boardRead(int num) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		Board board = mapper.boardRead(num);
		return board;
	}
}
