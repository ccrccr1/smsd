package spring.model.mapper;

import java.util.List;

import spring.model.festival.ReviewDTO;

public interface ReviewMapper {
	
	List<ReviewDTO> list(int f_id);
	int total(int f_id);
	int create(ReviewDTO dto);
	int update(ReviewDTO dto);
	int delete(int r_no);
	int rdelete(int f_no);
	
}
