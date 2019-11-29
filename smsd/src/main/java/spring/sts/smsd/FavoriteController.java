package spring.sts.smsd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.mapper.FavoriteMapper;
import spring.model.smsd.FavoriteDTO;
import spring.utility.smsd.Utility;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteMapper mapper;
	
	@PostMapping("/favorite/delete")
	public String favorite_delete(HttpServletRequest request,Model model,HttpSession session) {
		String f_ids = request.getParameter("f_ids");
		String m_id = (String)session.getAttribute("id");
		System.out.println(f_ids);
		System.out.println(m_id);
		
		String spl_f_id [] = f_ids.split(",");
		
		Map map = new HashMap();
		
		for(int i=0; i < spl_f_id.length;i++) {			
			map.put("f_id", Integer.parseInt(spl_f_id[i]));
			map.put("m_id", m_id);			
			mapper.delete(map);
			map.clear();
		}
		model.addAttribute("m_id", m_id);
		return "redirect:/favorite";
	}
	
	
	@PostMapping("/favorite")
	public String amount_update(HttpServletRequest request, HttpSession session) {
		
		int amount = Integer.parseInt(request.getParameter("amount"));
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		
		String m_id = (String)session.getAttribute("id");
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		System.out.println("amount: "+amount);
		System.out.println("f_id: "+f_id);
		System.out.println("m_id: "+m_id);
		
		
		int recordPerPage = 5; // 한 페이지당 보여줄 레코드 갯수

		// DB에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("m_id", m_id);
		map.put("f_id", f_id);
		map.put("amount", amount);
		
		
		
		mapper.amount_update(map);
		
		List<FavoriteDTO> list = mapper.list(map);
		int total = mapper.total(map);
		

		String paging = Utility.paging(total, nowPage, recordPerPage);

		request.setAttribute("paging", paging);
		request.setAttribute("list", list);		
		request.setAttribute("nowPage", nowPage);	
		
		return "/favorite";
	}
	
	@GetMapping("/favorite")
	public String list(HttpServletRequest request, HttpSession session) {
			
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 5; // 한 페이지당 보여줄 레코드 갯수

		// DB에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("m_id", session.getAttribute("id"));
						

		List<FavoriteDTO> list = mapper.list(map);
		int total = mapper.total(map);

		String paging = Utility.paging(total, nowPage, recordPerPage);

		request.setAttribute("paging", paging);
		request.setAttribute("list", list);		
		request.setAttribute("nowPage", nowPage);		

		return "/favorite";
	}
}
