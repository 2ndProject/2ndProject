package com.scmaster.web5.dao;

import java.util.ArrayList;

import com.scmaster.web5.vo.Board;

public interface BoardMapper {

	public int boardWrite(Board board);
	public ArrayList<Board> selectAll();
	public Board boardRead(int num);
}
