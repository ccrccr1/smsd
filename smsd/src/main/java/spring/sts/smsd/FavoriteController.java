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

import spring.model.festival.FavoriteDTO;
import spring.model.mapper.FavoriteMapper;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteMapper mapper;
	
	@GetMapping("/favorite/create")
	public String favorite_create(HttpSession session, HttpServletRequest request,Model model) {
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		String m_id = (String)session.getAttribute("id");
		
		Map map = new HashMap();
		map.put("f_id", f_id);
		map.put("m_id", m_id);
		
		if(mapper.duplicate(map)>0) {
			model.addAttribute("str", "이미 추가된 축제입니다.");
			return "redirect:/preProc";
		} else {
			mapper.create(map);
			model.addAttribute("str", "즐겨찾기에 추가 되었습니다.");
			return "redirect:/preProc";
		}	
	}
	
	@PostMapping("/favorite/delete")
	public String favorite_delete(HttpServletRequest request,HttpSession session) {
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
		return "redirect:/favorite";
	}
	
	
	@PostMapping("/favorite")
	public String amount_update(HttpServletRequest request, HttpSession session) {
		
		int amount = Integer.parseInt(request.getParameter("amount"));
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		
		String m_id = (String)session.getAttribute("id");
		

		System.out.println("amount: "+amount);
		System.out.println("f_id: "+f_id);
		System.out.println("m_id: "+m_id);	
	

		Map map = new HashMap();		
	
		map.put("m_id", m_id);
		map.put("f_id", f_id);
		map.put("amount", amount);		
		mapper.amount_update(map);
		
		List<FavoriteDTO> list = mapper.list(map);		
		
		request.setAttribute("list", list);		
	
		
		return "/favorite";
	}
	
	@GetMapping("/favorite")
	public String list(HttpServletRequest request, HttpSession session) {
		
		Map map = new HashMap();		
		
		map.put("m_id", session.getAttribute("id"));					

		List<FavoriteDTO> list = mapper.list(map);
		
		request.setAttribute("list", list);		
		return "/favorite";
	}
}
