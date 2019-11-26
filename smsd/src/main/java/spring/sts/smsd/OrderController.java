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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.mapper.OrderMapper;
import spring.model.order.FestivalDTO;
import spring.model.order.OrderDTO;
import spring.utility.smsd.Utility;

@Controller
public class OrderController {

	@Autowired
	private OrderMapper mapper;
	
	@RequestMapping("/list")
	public String orderList(HttpServletRequest request) {

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

		int total = mapper.total(map);
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
				
		return "/list";
	}
	@RequestMapping("/orderComf2")
	public String create(HttpServletRequest request, Model model, FestivalDTO fdto) {
//		url += "?m_id=" + "user4";
//		url += "&f_title=${dto.f_title}";
//		url += "&f_id=${dto.f_id}";
//		url += "&($('#cnt_'+${dto.f_id}).val())";
//		url += "&o_date=${time1}";
		
		String f_title[] = request.getParameterValues("f_title");
		String f_id[] = request.getParameterValues("f_id");
		String f_price[] = request.getParameterValues("f_price");
		String f_count[] = request.getParameterValues("f_count");
		String o_date[] = request.getParameterValues("o_date");
		String m_id = request.getParameter("m_id");
		
		for(int i=0;i<f_id.length;i++) {
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
		return "/orderComf";
	}
	
	
	@GetMapping("/orderComf")
	public String orderComf() {

		return "/orderComf";
	}

	@RequestMapping("/order")
	public String order(HttpServletRequest request) {
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
		
		Date time = new Date();
				
		String time2 = format.format(time);
				
		
		Map map = new HashMap();
		
		List<FestivalDTO> orderList = mapper.orderList(map);
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("time2", time2);
		
		return "/order";
	}

}
