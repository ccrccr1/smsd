package spring.sts.smsd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.model.festival.CntDTO;
import spring.model.festival.MemberDTO;
import spring.model.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper mapper;

	
	@Inject
	JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	   // mailSending 코드
    @PostMapping( value = "/member/auth.do" )
    public ModelAndView mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "koijb007@gamil.com";
        String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
        mv.setViewName("/member/emailinjeung");     //뷰의이름
        mv.addObject("dice", dice);
        mv.addObject("tomail", tomail);
        
        System.out.println("mv : "+mv);

        response_email.setContentType("text/html; charset=UTF-8");
        PrintWriter out_email = response_email.getWriter();
        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
        out_email.flush();
        
        
        return mv;
        
    }


    @RequestMapping("/member/email")
    public String email() {
    	return "member/email";
    }
@RequestMapping("/member/emailinjeung")
public String email2() {
	return "/member/emailinjeung";
}
//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
//틀리면 다시 원래 페이지로 돌아오는 메소드
@PostMapping(value = "/member/join_injeung{dice}")
public ModelAndView join_injeung(String email_injeung,String tomail, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {

    
    System.out.println(email_injeung);
    
    System.out.print("마지막 : email_injeung : "+email_injeung);
    
    System.out.print("마지막 : dice : "+dice);
    
    
    //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
     
    ModelAndView mv = new ModelAndView();
    
    mv.setViewName("/member/create");
    
    mv.addObject("e_mail",email_injeung);
    
    if (email_injeung.equals(dice+",")) {
        
        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
        
        
        
        mv.setViewName("/member/create");
        
        mv.addObject("e_mail",email_injeung);
        
        //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
        //한번더 입력할 필요가 없게 한다.
        
        response_equals.setContentType("text/html; charset=UTF-8");
        PrintWriter out_equals = response_equals.getWriter();
        out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입 페이지로 이동 합니다.');</script>");
        mv.addObject("tomail", tomail);
        out_equals.flush();

        return mv;
        
        
    }else if (email_injeung != dice) {
        
        
        ModelAndView mv2 = new ModelAndView(); 
        
        mv2.setViewName("/member/emailinjeung");
        
        response_equals.setContentType("text/html; charset=UTF-8");
        PrintWriter out_equals = response_equals.getWriter();
        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.');</script>");
        out_equals.flush();
        

        return mv2;
        
    }    

    return mv;
    
}

	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
		
	}
	
	
	@RequestMapping("/member/iwrite")
	public String iwrite(String m_id,HttpServletRequest request) {
		
		List<CntDTO> list = mapper.iwritecnt(m_id);
		List<CntDTO> list2 = mapper.iwritecontent(m_id);
		
		
		Iterator<CntDTO> iter = list2.iterator();
		
		
		request.setAttribute("cnt", list);
		request.setAttribute("title", list2);
		
		return "/member/iwrite";
	}
	
	
	@PostMapping("/member/login")
	public String login(@RequestParam Map<String, String> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		System.out.println("id:" +map.get("m_id"));
		System.out.println("passwd:" +map.get("m_passwd"));
		int flag = mapper.loginCheck(map);
		
		if (flag == 1) {
			String grade = mapper.getGrade(map.get("m_id"));
			session.setAttribute("id", map.get("m_id"));
			session.setAttribute("grade", grade);

			Cookie cookie = null;

			String c_id = request.getParameter("c_id");

			if (c_id != null) {
				cookie = new Cookie("c_id", "Y");
				cookie.setMaxAge(120);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", map.get("m_id"));
				cookie.setMaxAge(120);
				response.addCookie(cookie);
			} else {
				cookie = new Cookie("c_id", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			return "redirect:/";
		} else {
			request.setAttribute("id", map.get("m_id"));
			return "/preProc2";
		}

	}

	@GetMapping("/member/login")
	public String login(HttpServletRequest request) {
		String c_id = "";
		String c_id_val = "";

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue();
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue();
				}
			}
		}
		return "/member/login";

	}

	@PostMapping("/member/createproc")
	public String create(MemberDTO dto, Model model, HttpServletRequest request) {

		int iflag = mapper.idcheck(dto.getM_id());
		int eflag = mapper.emailcheck(dto.getM_email());
		if (iflag == 1) {

			request.setAttribute("id", dto.getM_id());
			request.setAttribute("email", dto.getM_email());
			return "/member/preProc";

		} else if (eflag == 1) {
			request.setAttribute("id", dto.getM_id());
			request.setAttribute("email", dto.getM_email());
			return "/member/preProc";
		} else if (iflag == 0 && eflag == 0) {
			int flag = mapper.create(dto);
			if (flag == 1) {
				return "redirect:/";
			} else {
				request.setAttribute("id", dto.getM_id());
				request.setAttribute("email", dto.getM_email());
				return "/member/preProc";
			}
		} else {
			request.setAttribute("id", dto.getM_id());
			request.setAttribute("email", dto.getM_email());
			return "/preProc";
		}

	}

	@PostMapping("/member/create")
	public String create() {

		return "/member/create";
	}
	
	@GetMapping("/member/delete")
	public String delete(String id) {
		int flag = mapper.delete(id);
		
		if(flag==1) {
			
			return "redirect:/";
		}else {
			return "/preProc";
		}
	}

	@ResponseBody
	@GetMapping(value = "/member/idcheck", produces = "text/plain;charset=utf-8")
	public String idcheck(String id) {

		int flag = mapper.idcheck(id);
		String str = "";
		if (flag == 1) {
			str = id + " 중복된 아이디 입니다.";
		} else {
			str = id + " 사용하셔도 좋습니다.";
		}

		return str;

	}

	@ResponseBody
	@GetMapping(value = "/member/emailcheck", produces = "text/plain;charset=utf-8")
	public String emailcheck(String email) {
		int flag = mapper.emailcheck(email);

		String str = "";
		if (flag == 1) {
			str = email + " 중복된 이메일 입니다..";
		} else {
			str = email + " 사용하셔도 좋습니다.";
		}

		return str;
	}

	@GetMapping("/member/agree")
	public String agree() {

		return "/member/agree";
	}

	@RequestMapping("/member/mypage")
	public String mypage(String id,Model model) {
		
		MemberDTO dto = mapper.read(id);

		dto.setM_phone1(dto.getM_phone().substring(0,3));
		dto.setM_phone2(dto.getM_phone().substring(3,7));
		dto.setM_phone3(dto.getM_phone().substring(7,11));

		dto.setM_birth1(dto.getM_birth().substring(0,4));
		dto.setM_birth2(dto.getM_birth().substring(4,6));
		dto.setM_birth3(dto.getM_birth().substring(6,8));
		
		model.addAttribute("dto",dto);
		
		
		return "/member/mypage";
	}
	
	@PostMapping("/member/updatemypage")
	public String updatemypage(HttpServletRequest request,MemberDTO dto,HttpSession session) {
			
			dto.setM_id((String)session.getAttribute("id"));
			int flag = mapper.update(dto);
			if (flag == 1) {
				return "redirect:/member/mypage?id="+dto.getM_id();
			} else {

				return "/preProc3";
			}
	 
		
	}
	
	@GetMapping("/member/updatemypage")
	public String updatemypage(String id,Model model) {
		
		MemberDTO dto = mapper.read(id);
		
		dto.setM_phone1(dto.getM_phone().substring(0,3));
		dto.setM_phone2(dto.getM_phone().substring(3,7));
		dto.setM_phone3(dto.getM_phone().substring(7,11));

		dto.setM_birth1(dto.getM_birth().substring(0,4));
		dto.setM_birth2(dto.getM_birth().substring(4,6));
		dto.setM_birth3(dto.getM_birth().substring(6,8));
		
		model.addAttribute("dto",dto);
		
		return "/member/updatemypage";
	}
	
	@PostMapping("/member/updatemoney")
	public String updatemypage(Map map,String m_id,String m_updatemoney,HttpSession session) {
		
		System.out.println(m_id);
		System.out.println(m_updatemoney);
		map.put("m_updatemoney", m_updatemoney);
		map.put("m_id", m_id);
	
		int flag = mapper.updatemoney(map);
		if(flag==1) {	
		return "redirect:/member/mypage?id="+m_id;
		}else {
		return "/preProc";
		}
	}
	
	@PostMapping("/member/updatepasswd")
	public String updatepasswd(HttpSession session, String m_passwd,String m_updatepasswd) {
		String m_id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("m_id", m_id);
		map.put("m_passwd",m_passwd);
		Map map2 = new HashMap();
		map2.put("m_id", m_id);
		map2.put("m_updatepasswd", m_updatepasswd);
		int flag = mapper.passcheck(map);
		if (flag == 1) {
			int flag2 = mapper.updatePw(map2);
			if(flag2==1) {
				session.invalidate();
				return "redirect:/";
			}
			else {
				return "/preProc4";
			}
		}else {
			return "/preProc4";
		}
		
		
	}
	
	@GetMapping("/preProc")
	public String preProc() {
		return "/preProc";
	}
	
	@PostMapping("/member/findid")
	public String findid(String m_name,String m_email,Model model) {
		Map map = new HashMap();
		System.out.println(m_name +"\n"+ m_email);
		map.put("m_name", m_name);
		map.put("m_email", m_email);
		
		String  id = mapper.findID(map);
		
		System.out.println(id);
		
		model.addAttribute("name",m_name);
		model.addAttribute("id",id);
		
		return "/member/findidproc";
	}
	
	@PostMapping("/member/findpw")
	public String findpw(String m_id,String m_email,Model model) {
		Map map = new HashMap();
		System.out.println(m_id +"\n"+ m_email);
		map.put("m_id", m_id);
		map.put("m_email", m_email);
		
		String  passwd = mapper.findPW(map);
		
		System.out.println(passwd);
		
		model.addAttribute("id",m_id);
		model.addAttribute("passwd",passwd);
		
		return "/member/findpwproc";
	}
	
	
	@GetMapping("/member/findpw")
	public String findpw() {
		
		return "/member/findpw";
	}
	
	@GetMapping("/member/findid")
	public String findid() {
		
		return "/member/findid";
	}
}
