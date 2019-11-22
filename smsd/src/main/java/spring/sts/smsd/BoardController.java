package spring.sts.smsd;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
			return "/board/preProc";
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

}
