package spring.sts.smsd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.model.festival.BoardReplyDTO;
import spring.model.mapper.BoardReplyMapper;
import spring.utility.smsd.Utility;

@RestController  /* retrun data */
public class BoardReplyController {
	
	private static final Logger log = LoggerFactory.getLogger(BoardReplyController.class);
	
	@Autowired
	private BoardReplyMapper brmapper;
	
	
	@GetMapping("/board/reply/list/{b_no}/{sno}/{eno}")
	public ResponseEntity<List<BoardReplyDTO>> getList(@PathVariable("b_no") int b_no, 
			@PathVariable("sno") int sno, @PathVariable("eno") int eno) {
		
		Map map = new HashMap();
		map.put("b_no", b_no);
		map.put("sno", sno);
		map.put("eno", eno);
		
		return new ResponseEntity<List<BoardReplyDTO>>(brmapper.list(map), HttpStatus.OK);
	}
	
	@GetMapping(value="/board/reply/page" , produces="application/text;charset=UTF-8")
	public ResponseEntity<String> getPage(@RequestParam("nPage") int nPage, @RequestParam("nowPage") int nowPage,
			@RequestParam("b_no") int b_no, @RequestParam("col") String col, @RequestParam("word") String word){
		
		int total = brmapper.total(b_no);
		String url = "read";
		int recordPerPage = 3;
		
		String paging = Utility.replypaging(total, nowPage, recordPerPage, col, word, url, nPage, b_no);
		
		return new ResponseEntity<String>(paging, HttpStatus.OK);		
	}
	
	
	@PostMapping("/board/reply/create")
	public ResponseEntity<String> create(@RequestBody BoardReplyDTO dto){
	
		dto.setBr_content(dto.getBr_content().replaceAll("\n\r", "<br>"));
		int flag = brmapper.create(dto);
		log.info("reply insert flag : " + flag);
		
		
		return flag == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/board/reply/{br_no}")
	public ResponseEntity<BoardReplyDTO> get(@PathVariable("br_no") int br_no){
		log.info("get : " + br_no);
		return new ResponseEntity<BoardReplyDTO>(brmapper.read(br_no), HttpStatus.OK);
		
	}
	
	@PutMapping("/board/reply/{br_no}")
	public ResponseEntity<String> modify(@RequestBody BoardReplyDTO dto, @PathVariable("br_no") int br_no){
		log.info("br_no : " + br_no);
		log.info("modify : " + dto);
		
		return brmapper.update(dto) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@DeleteMapping(value="/board/reply/{br_no}/{b_no}/{nPage}", produces="application/json;charset=UTF-8")
	public ResponseEntity<Map> remove(@PathVariable("br_no") int br_no, @PathVariable("b_no") int b_no, @PathVariable("nPage") int nPage){
		log.info("remove : " + br_no);
		int total = brmapper.total(b_no);
		int totalPage = (int)(Math.ceil((double)total/3));
		int cnt = brmapper.delete(br_no);
		
		ResponseEntity<Map> entity = null;
		if(cnt==1) {
			if(nPage != 1 && nPage == totalPage && total%3==1 ) nPage = nPage-1;
			Map map = new HashMap();
			map.put("msg", "sucess");
			map.put("nPage", nPage);
			entity = new ResponseEntity<Map>(map, HttpStatus.OK);
		}else {
			entity = new ResponseEntity<Map>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
}
