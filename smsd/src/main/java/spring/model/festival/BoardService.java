package spring.model.festival;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.mapper.BoardMapper;
import spring.model.mapper.BoardReplyMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	@Autowired
	private BoardReplyMapper brmapper; 
	
	
	public void delete(int b_no) throws Exception{	
		
		brmapper.rdelete(b_no); 
		mapper.delete(b_no);  
		
	}
	 
	
	public void reply(BoardDTO dto) throws Exception{
		
		Map map = new HashMap();
		map.put("b_ref", dto.getB_ref());
		map.put("b_ansnum", dto.getB_ansnum());
		
		mapper.reply_ansnum(map);
		mapper.reply_create(dto);
		
	}
}
