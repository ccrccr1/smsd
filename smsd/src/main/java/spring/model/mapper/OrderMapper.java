package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.order.FestivalDTO;
import spring.model.order.OrderDTO;

public interface OrderMapper {

	List<OrderDTO> list(Map map);
	int total(Map map);
	List<FestivalDTO> orderList(Map map);
	int create(OrderDTO dto);
	
}
