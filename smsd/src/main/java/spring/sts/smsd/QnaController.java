package spring.sts.smsd;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.festival.QnaDTO;
import spring.model.mapper.QnaMapper;
import spring.model.mapper.QnaService;
import spring.utility.smsd.Utility;

@Controller
public class QnaController {
	
	@Autowired
	private QnaMapper mapper;
	
	@Autowired
	private QnaService service;
	
	private static final Logger Logger = LoggerFactory.getLogger(QnaController.class);

	@PostMapping("/qna/reply")
	public String reply(QnaDTO dto, Model model) {
		Map map = new HashMap();
		map.put("q_ref", dto.getQ_ref());
		map.put("q_ansnum", dto.getQ_ansnum());
		
		try {
			service.reply(dto);
			
			return "redirect:/qna/list";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("str", "답변 달기에 실패했습니다.");
			
			return "/qna/preProc";
		}		
	}
	
	@GetMapping("/qna/reply")
	public String reply(int q_no, Model model) {
		model.addAttribute("dto", mapper.reply_read(q_no));
		
		return "/qna/reply";
	}
	
	@PostMapping("/qna/delete")
	public String delete(int q_no, Model model, QnaDTO dto,
			HttpServletRequest request) {
		int flag = mapper.delete(q_no);
		
		if (flag == 1) {
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			
			return "redirect:/qna/list";
		}
		else {
			model.addAttribute("str", "삭제에 실패했습니다.");
			return "/qna/preProc";
		}
	}
	
	@GetMapping("/qna/delete")
	public String delete(int q_no, Model model) {
		int flag = mapper.checkRefnum(q_no);
		model.addAttribute("flag", flag);
		
		return "/qna/delete";
	}
	
	@PostMapping("/qna/update")
	public String update(QnaDTO dto, Model model, HttpServletRequest request) {
		Map map = new HashMap();
		map.put("q_no", dto.getQ_no());
		
		int flag = mapper.update(dto);
		
		if (flag == 1) {
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			return "redirect:/qna/list";
		}
		else {
			model.addAttribute("str", "QnA 수정에 실패했습니다.");
			return "/qna/preProc";
		}
	}
	
	@GetMapping("/qna/update")
	public String update(int q_no, Model model) {
		QnaDTO dto = mapper.read(q_no);
		model.addAttribute("dto", dto);
		
		return "/qna/update";
	}
	
	@PostMapping("/qna/create")
	public String create(QnaDTO dto, Model model) {
		System.out.println(dto.getM_ID());
		System.out.println(dto.getQ_title());
		System.out.println(dto.getQ_content());
		if (mapper.create(dto) == 1) {
			return "redirect:/qna/list";
		}
		else {
			model.addAttribute("str", "QnA 작성에 실패했습니다.");
			return "/qna/preProc";
		}		
	}
	
	@GetMapping("/qna/create")
	public String create() {
		return "/qna/create";
	}
	
	@GetMapping("/qna/read")
	public String read(int q_no, Model model, HttpServletRequest request,
			int nowPage, String col, String word) {
		
		mapper.upq_cnt(q_no);
		
		QnaDTO dto = mapper.read(q_no);
		
		List<QnaDTO> rlist = mapper.r_read(q_no);
		
		String q_content = dto.getQ_content().replaceAll("\r\n", "<br>");
		
		dto.setQ_content(q_content);
		
		model.addAttribute("dto", dto);  

		model.addAttribute("rlist", rlist);
		
		return "/qna/read";
	}
	
	@RequestMapping("/qna/list")
	public String list(HttpServletRequest request,HttpSession session, Model model) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if (col.equals("total")) {
			word = "";
		}
		
		//페이징 관련
		int nowPage = 1;
		if (request.getParameter("nowPage")!= null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int recordPerPage = 10; //한 페이지 당 보여줄 레코드 갯수
		
		// 디비에서 가져올 순번
		int sno = ((nowPage-1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);
		
		List<QnaDTO> list = mapper.list(map);
		
		// 리스트에서 자신이 쓴 글과 그 글에 대한 답변까지 읽을 수 있도록 함
		String ac = (String)session.getAttribute("id"); // 세션에 있는 id를 겟어트리뷰트로 ac 객체에 저장
		List ac2 = new ArrayList(); // 리스트 타입의 ac2객체를 ArrayList로 생성
		
		
		for(QnaDTO dto : list) { // 
			String tt = (String)dto.getM_ID(); // tt에 스트링 타입의 m_ID를 넣어준다.
				
			if(tt.equals(ac)) { // tt에 들어있는 m_ID가 ac에 들어있는 id와 같을 경우
				ac2.add(dto.getQ_no()); // dto에 있는 q_no를 얻어와 ac2에 넣어준다.
			}
		}
		// 여기까지
		
		int total = mapper.total(map);
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);

		request.setAttribute("ac", ac2); // ac2에 담긴 q_no를 밸류값으로 ac에 저장
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		return "/qna/list";
	}
}
