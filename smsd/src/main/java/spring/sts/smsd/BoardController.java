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

import spring.model.board.BoardDTO;
import spring.model.mapper.BoardMapper;
import spring.utility.smsd.Utility;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	
	//Logger
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@PostMapping("/board/create")
	public String create(BoardDTO dto, Model model, HttpServletRequest request) {
		
		String basePath = request.getRealPath("/storage");
		dto.setB_filename(Utility.saveFileSpring(dto.getB_filenameMF(), basePath));
		
		int flag = mapper.create(dto);
		if(flag==1) {
			model.addAttribute("str", "게시글 등록 성공");
			return "redirect:/board/list";
			/* return "redirect:/board/list"; */
		}else {
			model.addAttribute("str", "게시글 등록 실패");
			return "/board/preProc";
		}
	}
	
	@GetMapping("/board/create")
	public String create() {
		
		return "/board/create";
	}
	
	
	@RequestMapping("/board/list")
	public String list(HttpServletRequest request) {
		
		String word = Utility.checkNull(request.getParameter("word"));
		String col = Utility.checkNull(request.getParameter("col"));
		
		if(col.equals("total")) {
			word = "";
		}
		
		//페이징
		int nowPage = 1;
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 10;
		
		int sno = ((nowPage - 1) * recordPerPage ) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		
		List<BoardDTO> list = mapper.list(map);
		int total = mapper.total(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		/* request.setAttribute("rmapper", rmapper); */
		
		
		return "/board/list";
	}
	
	@GetMapping("/board/read")
	public String read(int b_no, Model model) {
		
		mapper.upViewcnt(b_no);
		BoardDTO dto = mapper.read(b_no);
		
		String content = dto.getB_content().replaceAll("\r\n", "<br>");
		dto.setB_content(content);
		model.addAttribute("dto", dto);
		
		
		return "/board/read";
	}
	
	
	@PostMapping("/board/update")
	public String update(BoardDTO dto, HttpServletRequest request, String oldfile) {
		
		String basePath = request.getRealPath("/storage");
		
		dto.setB_filename(Utility.saveFileSpring(dto.getB_filenameMF(), basePath));			
		
		int flag = mapper.update(dto);
		if(flag>0) {
			Utility.deleteFile(basePath, oldfile);
			return "redirect:/board/list";
		}else {
			return "/board/preProc";			
		}
		
	}
	
	
	@GetMapping("/board/update")
	public String update(int b_no, Model model) {
		
		BoardDTO dto = mapper.read(b_no);
		model.addAttribute("dto", dto);
		
		return "/board/update";
	}
	
	@PostMapping("/board/delete")
	public String delete(int b_no, String oldfile, HttpServletRequest request, Model model) {
		
		String basePath = request.getRealPath("/storage");
	
		int rflag = mapper.checkRefnum(b_no);
		int flag = 0;
		if(rflag>0) {
			model.addAttribute("str", "부모글입니다. 삭제할 수 없습니다.");
			return "/board/preProc";
		}else {
			flag = mapper.delete(b_no);
		}
		
		if(flag>0) {
			Utility.deleteFile(basePath, oldfile);
			return "redirect:/board/list";
		}else {
			model.addAttribute("str", "삭제 실패");
			return "/board/preProc";
		}
		
	}
	
	

}
