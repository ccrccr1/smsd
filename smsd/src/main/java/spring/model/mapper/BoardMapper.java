package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.festival.BoardDTO;

public interface BoardMapper {
	
	int create(BoardDTO dto);
	List<BoardDTO> list(Map map);
	int total(Map map);
	BoardDTO read(int b_no);
	void upViewcnt(int b_no);
	int update(BoardDTO dto);
	int delete(int b_no);
	int checkRefnum(int b_no);
	
	void reply_ansnum(Map map);
	int reply_create(BoardDTO dto);
	BoardDTO reply_read(int b_no);
	
}