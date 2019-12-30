package spring.model.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.model.festival.FestivalDTO;

@Service
public class FestivalService {
	
	@Autowired
	private FestivalMapper mapper;
	
	public void create(FestivalDTO dto)throws Exception{
		mapper.enrollFestival(dto);
	}
}
