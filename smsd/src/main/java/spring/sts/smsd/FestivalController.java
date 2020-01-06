package spring.sts.smsd;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import spring.model.festival.FestivalDTO;
import spring.model.festival.ReviewDTO;
import spring.model.mapper.FestivalMapper;
import spring.model.mapper.ReviewMapper;
import spring.utility.smsd.Utility;

@Controller
public class FestivalController {

	@Autowired
	private FestivalMapper mapper;
	@Autowired
	private ReviewMapper rmapper;
	
	@GetMapping("/festival/read")
	public String read(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		mapper.upViewCnt(id);
		List<FestivalDTO> imageList = mapper.readFestival(id);
		FestivalDTO read = imageList.get(0);
		
		request.setAttribute("list", imageList);
		request.setAttribute("read", read);
		
		//review paging
		
		int nowPage = 1;
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 3;
		
		int sno = ((nowPage - 1) * recordPerPage ) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("f_id", id);

		List<ReviewDTO> rlist = rmapper.list(map);
		int cnt = rmapper.total(id);
		
		String paging = Utility.reviewpaging(cnt, nowPage, recordPerPage, id);
		
		request.setAttribute("paging", paging);
		request.setAttribute("cnt", cnt);
		request.setAttribute("f_id", id);
		request.setAttribute("rlist", rlist);
		
		
		return "/festival/read";
	}
	
	
	@GetMapping("/festival/list")
	public String list(HttpServletRequest request) {
		
		// home -> main 시 필요한 parameter
		String season = request.getParameter("season");
		
		// 검색용 Parameter
		String price = request.getParameter("price");
		String search_sdate = request.getParameter("sdate");
		String search_edate = request.getParameter("edate");
		String area = request.getParameter("area");
		boolean isSearch = false;
		
		
		// 검색 결과를 받아오는 코드
		Map searchMap = new HashMap();
		List<FestivalDTO> searchList = new ArrayList();
		if(price != null) {
			search_sdate = Utility.formatDate(search_sdate);
			search_edate = Utility.formatDate(search_edate);
			searchMap.put("price", price);
			searchMap.put("sdate", search_sdate);
			searchMap.put("edate", search_edate);
			searchMap.put("area", area);
			searchList = mapper.searchFestivalList(searchMap);
			isSearch = true;
		}
		
		
		String sdate = "";
		String edate = "";
		
		Calendar calendar = new GregorianCalendar(Locale.KOREA);
		int nMonth = 0;
		int nYear;
		
		nYear = calendar.get(Calendar.YEAR);
		
//		nYear = Integer.parseInt(String.valueOf(nYear).substring(2));
		nYear = 19;
		
		
		
		if(season == null || season.equals("")) {
			nMonth = calendar.get(Calendar.MONTH) + 1;
		} else {
			switch(season) {
			case "winter":
				nMonth = 1;
				break;
			case "spring":
				nMonth = 3;
				break;
			case "summer":
				nMonth = 6;
				break;
			case "autumn":
				nMonth = 9;
				break;
			}
		}
		
		switch(nMonth) {
		case 1:case 2:case 11:case 12:
			season = "winter";
			sdate = nYear+"1101";
			edate = ++nYear+"0228";
			break;
		case 3:case 4:case 5:
			season = "spring";
			sdate = nYear+"0301";
			edate = nYear+"0531";
			break;
		case 6:case 7:case 8:
			season = "summer";
			sdate = nYear+"0601";
			edate = nYear+"0831";
			break;
		case 9:case 10:
			season = "autumn";
			sdate = nYear+"0901";
			edate = nYear+"1031";
			break;
		}			

		Map map = new HashMap();
		map.put("season", season);
		map.put("sdate", sdate);
		map.put("edate", edate);
		List<FestivalDTO> topList = mapper.topFestivalList(map);
		if(topList.size() != 0) {
			Iterator<FestivalDTO> topIter = topList.iterator();			
			request.setAttribute("best", topIter.next());
		} else {
			FestivalDTO nullDto = new FestivalDTO();
			request.setAttribute("best", nullDto);			
		}

		List<FestivalDTO> recentList = mapper.recentFestivalList(map);
		
		boolean isNull = true;
		if(recentList.size() != 0) {
			isNull = false;
		}
		
		request.setAttribute("isNull", isNull);
		request.setAttribute("isSearch", isSearch);
		request.setAttribute("topList", topList);
		request.setAttribute("recentList", recentList);
		request.setAttribute("searchList", searchList);
		
		
		return "/festival/list";
	}
}
