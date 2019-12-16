package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.festival.QnaDTO;

public interface QnaMapper {
	
	List<QnaDTO> list(Map map);

	int total(Map map);
	
	QnaDTO read(int q_no);
	
	void upq_cnt(int q_no);

	int create(QnaDTO dto);

	int checkRefnum(int q_no);
	
	int delete(int q_no);
	
	int update(QnaDTO dto);
	
	// reply
	void reply_ansnum(Map map);
	
	int reply_create(QnaDTO dto);
	
	QnaDTO reply_read(int q_no);

	// 구현???
	int idCheck(Map map);
	
	// 부모글에 답글 표시
	List<QnaDTO> r_read(int q_no);

}
