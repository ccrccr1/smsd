package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.festival.BoardReplyDTO;

public interface BoardReplyMapper {
	
	List<BoardReplyDTO> list(Map map);
	int total(int b_no);
	BoardReplyDTO read(int br_no);
	int create(BoardReplyDTO dto);
	int update(BoardReplyDTO dto);
	int delete(int br_no);
	int rdelete(int b_no);
	int rcount(int b_no);

}
