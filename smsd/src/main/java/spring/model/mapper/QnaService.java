package spring.model.mapper;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.festival.QnaDTO;
import spring.model.mapper.QnaMapper;

@Service
public class QnaService {
	
	@Autowired
	private QnaMapper qmapper;
	
	public void delete(int q_no) throws Exception{
		qmapper.delete(q_no);
	}
	
	public void reply(QnaDTO dto) throws Exception{
		Map map = new HashMap();
		map.put("q_ref", dto.getQ_ref());
		map.put("q_ansnum", dto.getQ_ansnum());
		qmapper.reply_ansnum(map);
		qmapper.reply_create(dto);
	}

}
