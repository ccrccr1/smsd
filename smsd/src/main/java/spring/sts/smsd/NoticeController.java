package spring.sts.smsd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.mapper.NoticeMapper;
import spring.model.festival.NoticeDTO;
import spring.utility.smsd.Utility;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeMapper mapper;
	
	private static final Logger Logger = LoggerFactory.getLogger(NoticeController.class);
	
	@PostMapping("/notice/delete")
	public String delete(int n_no, HttpServletRequest request,
			Model model, NoticeDTO dto) {
		int flag = mapper.delete(n_no);
		
		if (flag == 1) {
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
			return "redirect:/notice/list";
		}
		else {
			model.addAttribute("str", "글 삭제에 실패했습니다.");
			return "/notice/preProc";
		}
		
	}
	
	@GetMapping("/notice/delete")
	public String delete() {

		return "/notice/delete";
	}
	
	@PostMapping("/notice/update")
	public String update(HttpServletRequest request, NoticeDTO dto,
			Model model) {
		Map map = new HashMap();
		map.put("n_no", dto.getN_no());
		
		int flag = mapper.update(dto);

		if (flag == 1) {
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/notice/list";
		}
		else {
			model.addAttribute("str", "수정에 실패했습니다.");
			return "/notice/preProc";
		}
		
	}
	
	@GetMapping("/notice/update")
	public String update(int n_no, Model model) {
		NoticeDTO dto = mapper.read(n_no);
		model.addAttribute("dto", dto);
		
		return "/notice/update";
	}
	
	@PostMapping("/notice/create")
	public String create(NoticeDTO dto, Model model) {
		if(mapper.create(dto) == 1) {
			return "redirect:/notice/list";			
		}
		else {
			model.addAttribute("str", "공지사항 등록에 실패했습니다.");
			return "/notice/preProc";
		}
		
	}
	
	@GetMapping("/notice/create")
	public String create() {
		return "/notice/create";
	}
	
	@GetMapping("/notice/read")
	public String read(int n_no, Model model) {
		
		mapper.upn_cnt(n_no);
		
		NoticeDTO dto = mapper.read(n_no);
		
		String n_content = dto.getN_content().replaceAll("\r\n", "<br>");
		
		dto.setN_content(n_content);
		
		model.addAttribute("dto", dto);
		
		return "/notice/read";
	}
	
	@RequestMapping("/notice/list")
	public String list(HttpServletRequest request) {
		
		Logger.info("list()가 호출되었습니다.");
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		
		if (col.equals("total")) {
			word = "";
		}
		
		// 페이징
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int recordPerPage = 10; // 한 페이지 당 보여줄 레코드 갯수
		
		// 디비에서 가져올 순번
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<NoticeDTO> list = mapper.list(map);
		
		int total = mapper.total(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/notice/list";
	}

}
