package spring.model.mapper;

import java.util.List;
import java.util.Map;

import spring.model.festival.AmountDTO;
import spring.model.festival.FestivalDTO;
import spring.model.festival.MemberDTO;
import spring.model.festival.OrderDTO;

public interface OrderMapper {

	List<OrderDTO> list(Map map);
	List<OrderDTO> list2(Map map);
	int total(Map map);
	List<FestivalDTO> orderList(Map map);
	int create(OrderDTO dto);
	int sum();
	List<AmountDTO> month_sum();
	void updatemoney(Map map);
	List<MemberDTO> m_money(Map map);
	void updatemoney2(Map map);
}
