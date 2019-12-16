package spring.sts.smsd;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.festival.AmountDTO;
import spring.model.festival.FestivalDTO;
import spring.model.festival.MemberDTO;
import spring.model.festival.OrderDTO;
import spring.model.mapper.OrderMapper;
import spring.utility.smsd.Utility;


@Controller
public class OrderController {

	@Autowired
	private OrderMapper mapper;
	private String m_money;
	
	
	@GetMapping("/f_register")
	public String f_register(HttpServletRequest requset) {
		
		return "/f_register";
	}
	@RequestMapping("/order/list")
	public String orderList(HttpServletRequest request, Model model) {

		String word = Utility.checkNull(request.getParameter("word"));
		String col = Utility.checkNull(request.getParameter("col"));

		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 10;

		int sno = ((nowPage - 1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;

		if (col.equals("total")) 
			word = "";

		Map map = new HashMap();

		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<OrderDTO> list = mapper.list(map);
		int sum = mapper.sum();	
		
		List<AmountDTO> data = mapper.month_sum();
		Map map2 = new HashMap();
		for(int i=0; i < data.size(); i++) {
			int year = data.get(i).getYear();
			int month = data.get(i).getMonth();
			int month_total = data.get(i).getmonth_total();
			
			map2.put("year", year);	
			map2.put("month", month);	
			map2.put("month_total", month_total);	
			
		}
		model.addAllAttributes(map2);
		
		int total = mapper.total(map);
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("sum", sum);
		request.setAttribute("data", data);
			
		return "/order/list";
	}
	@RequestMapping("/order/orderComf2")
	public String create(HttpServletRequest request, Model model, FestivalDTO fdto, MemberDTO mdto) {	
		String f_title[] = request.getParameterValues("f_title");
		String f_id[] = request.getParameterValues("f_id");
		String f_price[] = request.getParameterValues("f_price");
		String f_count[] = request.getParameterValues("f_count");
		String o_date[] = request.getParameterValues("o_date");
		String m_id = request.getParameter("m_id");
		String up_money = request.getParameter("up_money");
		
		Map map = new HashMap();
		map.put("m_id", m_id);
		map.put("up_money", up_money);
		
		int up = Integer.parseInt(up_money);
		
		List<MemberDTO> m_money = mapper.m_money(map);
		for(int i=0; i < m_money.size(); i++) {
			String money = m_money.get(i).getM_money();
			map.put("money", money);
			
			int m = Integer.parseInt(money);
			if(m < up) {
				model.addAttribute("str0" , "결제 실패.");
				model.addAttribute("str", "금액을 확인하세요.");
				return "/preProc";
			}
		}
		
							
		for(int i=0 ;i<f_id.length;i++) {
			OrderDTO dto = new OrderDTO();
			
			String title = f_title[i];
			int id = Integer.parseInt(f_id[i]);
			int price = Integer.parseInt(f_price[i]);
			int count = Integer.parseInt(f_count[i]);
			String date = o_date[i];
			String memberId = m_id;
			
			dto.setF_id(id);
			dto.setF_title(title);
			dto.setM_id(memberId);
			dto.setP_amount(count);
			dto.setP_total(price * count);
			dto.setO_date(date);
			
			int flag = mapper.create(dto);
			if(flag==0) {
				model.addAttribute("str", "결제실패");
				return "/preProc";
			}
		}
		mapper.updatemoney(map);
		mapper.updatemoney2(map);
		
		return "/order/orderComf";
	}
	
	
	@GetMapping("/orderComf")
	public String orderComf() {

		return "/order/orderComf";
	}

	@RequestMapping("/order/order")
	public String order(HttpServletRequest request) {
		List<FestivalDTO> orderList = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String time2 = format.format(date);
		
		Map map = new HashMap();
		String f_ids = request.getParameter("f_ids");
		String amounts = request.getParameter("amounts");
		System.out.println(f_ids);
		System.out.println(amounts);

		if (f_ids.endsWith(",")) {
			String spl_f_id[] = f_ids.split(",");
			for (int i = 0; i < spl_f_id.length; i++) {
				map.put("f_id" + i, Integer.parseInt(spl_f_id[i]));
			}
			map.put("f_id_cnt", spl_f_id.length);
		} else {
			map.put("f_id0", Integer.parseInt(f_ids.trim()));
			map.put("f_id_cnt", 1);
		}

		orderList = mapper.orderList(map);
		request.setAttribute("time2", time2);
		request.setAttribute("f_ids", f_ids);
		request.setAttribute("amounts", amounts);
		request.setAttribute("orderList", orderList);

		return "/order/order";
	}

}
