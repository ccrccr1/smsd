package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.smsd.FavoriteDTO;

public interface FavoriteMapper {

	List<FavoriteDTO> list(Map map);

	int total(Map map);
	
	void amount_update(Map map);
	
	int delete(Map map);

}
