package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.festival.FestivalDTO;

public interface FestivalMapper {
	int enrollFestivalDetail(FestivalDTO dto);
	int enrollFestivalImage(FestivalDTO dto);
	int enrollFestival(FestivalDTO dto);
	int optimize();
	void upViewCnt(int id);
	List<FestivalDTO> topFestivalList(Map map);
	List<FestivalDTO> recentFestivalList(Map map);
	List<FestivalDTO> searchFestivalList(Map map);
	List<Integer> allFestivalId();
	List<FestivalDTO> readFestival(int id);
}
