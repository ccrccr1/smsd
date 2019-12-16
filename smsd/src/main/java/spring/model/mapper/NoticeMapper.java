package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.festival.NoticeDTO;

public interface NoticeMapper {
	
	List<NoticeDTO> list(Map map);
	
	int total(Map map);
	
	NoticeDTO read(int n_no);

	void upn_cnt(int n_no);
	
	int create(NoticeDTO dto);

	int update(NoticeDTO dto);
	
	int delete(int n_no);
}
