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

import spring.model.festival.BoardDTO;
import spring.model.festival.BoardService;
import spring.model.festival.ReviewDTO;
import spring.model.mapper.BoardMapper;
import spring.model.mapper.BoardReplyMapper;
import spring.model.mapper.ReviewMapper;
import spring.utility.smsd.Utility;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardReplyMapper brmapper;
	@Autowired
	private ReviewMapper rmapper;
	  
	@Autowired 
	private BoardService service;
	 
	@GetMapping("/review")
	public String review(HttpServletRequest request) {
		
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		List<ReviewDTO> list = rmapper.list(f_id);
		
		int cnt = rmapper.total(f_id);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("f_id", f_id);
		request.setAttribute("list", list);
		return "/review";
	}
	@GetMapping("/review/delete")
	public String deleteR(int r_no, String oldfile, HttpServletRequest request, Model model) {
				
		rmapper.delete(r_no);
		String basePath = request.getRealPath("/storage");
		Utility.deleteFile(basePath, oldfile);
		
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		model.addAttribute("f_id", f_id);
		System.out.println("f_idaaaaa");

		return "redirect:/review";
	}
	@PostMapping("/review/create")
	public String create(HttpServletRequest request, HttpSession session, ReviewDTO dto, Model model) {
		
		int r_star = Integer.parseInt(request.getParameter("r_star"));
		int f_id = Integer.parseInt(request.getParameter("f_id"));
		
		dto.setR_star(r_star);
		dto.setM_id((String) session.getAttribute("id"));
		dto.setF_id(f_id);
		
		String basePath = request.getRealPath("/storage");
		if(dto.getR_fileMF().getSize()>0 ) {
			dto.setR_file(Utility.saveFileSpring(dto.getR_fileMF(), basePath));
		}

		rmapper.create(dto);
		model.addAttribute("f_id", f_id);
		
		return "redirect:/review";
	}
	@PostMapping("/review/update")
	public String update(HttpServletRequest request, HttpSession session, ReviewDTO dto, String u_oldfile, Model model, String f_id) {
		
		dto.setR_title(request.getParameter("u_title"));
		dto.setR_content(request.getParameter("u_content"));
		dto.setR_no(Integer.parseInt(request.getParameter("r_no")));
		
		int r_star = Integer.parseInt(request.getParameter("u_star"));
		dto.setR_star(r_star);
		
		
		String basePath = request.getRealPath("/storage");
		if(dto.getR_fileMF().getSize()>0 ) {
			dto.setR_file(Utility.saveFileSpring(dto.getR_fileMF(), basePath));
			Utility.deleteFile(basePath, u_oldfile);
		}

		if(rmapper.update(dto)>0) {
			System.out.println("성공");
		}else{
			System.out.println("실패");
		};

		model.addAttribute("f_id", f_id);		
		System.out.println("f_id>>>>>>>" + f_id);
		
		return "redirect:/review";
	}
	

	@PostMapping("/board/create")
	public String create(BoardDTO dto, Model model, HttpServletRequest request) {
		
		String basePath = request.getRealPath("/storage");
		if(dto.getB_filenameMF().getSize()>0) {
			dto.setB_filename(Utility.saveFileSpring(dto.getB_filenameMF(), basePath));			
		}
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
	public String create(Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		model.addAttribute("m_id", id);
		
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
		request.setAttribute("brmapper", brmapper);
		
		
		return "/board/list";
	}
	
	@GetMapping("/board/read")
	public String read(int b_no, Model model, HttpServletRequest request, int nowPage, String col, String word) {
		
		mapper.upViewcnt(b_no);
		BoardDTO dto = mapper.read(b_no);
		
		String content = dto.getB_content().replaceAll("\r\n", "<br>");
		dto.setB_content(content);
		
		model.addAttribute("dto", dto);
		
		//ajax댓글
		int nPage = 1;
		if(request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3;
		int sno =((nPage-1)*recordPerPage) + 1;
		int eno = nPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("b_no", b_no);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		map.put("word", word);
		
		model.addAllAttributes(map);
		
		return "/board/read";
	}
	
	
	@PostMapping("/board/update")
	public String update(BoardDTO dto, HttpServletRequest request, String oldfile, Model model, int nowPage, String col, String word) {
		
		String basePath = request.getRealPath("/storage");
		
		dto.setB_filename(Utility.saveFileSpring(dto.getB_filenameMF(), basePath));			
		
		int flag = mapper.update(dto);
		if(flag>0) {
			Utility.deleteFile(basePath, oldfile);
			Map map = new HashMap();
			map.put("nowPage", nowPage);
			map.put("col", col);
			map.put("word", word);
			model.addAllAttributes(map);
			return "redirect:/board/list";
		}else {
			model.addAttribute("str", "게시글 수정 실패");
			return "/board/preProc";			
		}
		
	}
	
	
	@GetMapping("/board/update")
	public String update(int b_no, Model model) {
		
		BoardDTO dto = mapper.read(b_no);
		model.addAttribute("dto", dto);
		
		return "/board/update";
	}
	
	@GetMapping("/board/delete")
	public String delete(int b_no, String oldfile, HttpServletRequest request, Model model) {
		
		System.out.println("b_no : " + b_no +", oldfile : " + oldfile);
		
		String basePath = request.getRealPath("/storage");
	
		int rflag = mapper.checkRefnum(b_no);
		if(rflag>0) {
			model.addAttribute("str", "부모글입니다. 삭제할 수 없습니다.");
			return "/board/preProc";
		}else {
			try {
				service.delete(b_no);
				Utility.deleteFile(basePath, oldfile);							
				model.addAttribute("col", request.getParameter("col"));
				model.addAttribute("word", request.getParameter("word"));
				model.addAttribute("nowPage", request.getParameter("nowPage"));
				return "redirect:/board/list";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				model.addAttribute("str", "게시글 삭제 실패");
				return "/board/preProc";
			}
		}
		
	}
	
	@PostMapping("/board/reply")
	public String reply(BoardDTO dto, Model model, HttpServletRequest request) {
		
		String basePath = request.getRealPath("/storage");
		if(dto.getB_filenameMF().getSize()>0) {
			dto.setB_filename(Utility.saveFileSpring(dto.getB_filenameMF(), basePath));			
		}
		
		/*
		 * Map map = new HashMap(); map.put("b_ref", dto.getB_ref());
		 * map.put("b_ansnum",dto.getB_ansnum());
		 */
		
		try {
			service.reply(dto);
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));

			return "redirect:/board/list";
			
		}catch(Exception e) {
			e.printStackTrace();
			
			model.addAttribute("str", "답변 등록 실패");
			return "/board/preProc";	
		}
	}
	
	@GetMapping("/board/reply")
	public String reply(int b_no, Model model) {
		
		BoardDTO dto = mapper.reply_read(b_no);
		model.addAttribute("dto", dto );
		return "/board/reply";
	}
	
	

}
