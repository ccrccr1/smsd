package spring.utility.smsd;

import java.io.File; 
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.web.multipart.MultipartFile;

import spring.model.mapper.BoardReplyMapper;


public class Utility {
	
//	public static int rcount(int bbsno,ReplyMapper rmapper) {
//		return rmapper.rcount(bbsno);
//	}
	public static int rcount(int b_no, BoardReplyMapper brmapper) {
		return brmapper.rcount(b_no);
	}
	
	public static String replypaging(int total, int nowPage, int recordPerPage, String col, String word, String url,
			 int nPage, int b_no) {
			    int pagePerBlock = 5; // 블럭당 페이지 수 
			    int totalPage = (int)(Math.ceil((double)total/recordPerPage)); // 전체 페이지  
			    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
			    int nowGrp = (int)(Math.ceil((double)nPage/pagePerBlock));    // 현재 그룹 
			    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
			    int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
			     
			    StringBuffer str = new StringBuffer(); 
			    str.append("<div style='text-align:center'>"); 
			    str.append("<ul class='pagination'> ");
			    int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
			    
			    if (nowGrp >= 2){ 
			      str.append("<li><a href='"+url+"?col="+col+"&word="+word+"&nowPage="+nowPage+"&b_no="+b_no+"&nPage="+_nowPage+"'>이전</A></li>"); 
			    } 
			  
			    for(int i=startPage; i<=endPage; i++){ 
			      if (i > totalPage){ 
			        break; 
			      } 
			  
			      if (nPage == i){ 
			        str.append("<li class='active'><a href=#>"+i+"</a></li>"); 
			      }else{ 
			        str.append("<li><a href='"+url+"?col="+col+"&word="+word+"&nowPage="+nowPage+"&b_no="+b_no+"&nPage="+i+"'>"+i+"</A></li>");   
			      } 
			    } 
			       
			    _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
			    if (nowGrp < totalGrp){ 
			      str.append("<li><A href='"+url+"?col="+col+"&word="+word+"&nowPage="+nowPage+"&b_no="+b_no+"&nPage="+_nowPage+"'>다음</A></li>"); 
			    } 
			    str.append("</ul>"); 
			    str.append("</div>"); 
			     
			   return str.toString(); 
			  
	} 
	
	
	public static String formatDate(String sdate) {	
		String result = "";
		StringTokenizer s_token = new StringTokenizer(sdate,"/");
		String[] s_dateList = new String[3];
		for(int i=0; i < s_dateList.length; i++) {
			s_dateList[i] = (String)s_token.nextElement();
		}
		s_dateList[2] = s_dateList[2].substring(2);
		for(int i=2; i > 0; i--) {
			result = s_dateList[i];
		}
		return result;
	}
	
	public static String saveFileSpring(MultipartFile multipartFile, String basePath) { 
        // input form's parameter name 
        String fileName = ""; 
        // original file name 
        String originalFileName = multipartFile.getOriginalFilename(); 
        // file content type 
        String contentType = multipartFile.getContentType(); 
        // file size 
        long fileSize = multipartFile.getSize(); 
         
        System.out.println("fileSize: " + fileSize); 
        System.out.println("originalFileName: " + originalFileName); 
         
        InputStream inputStream = null; 
        OutputStream outputStream = null; 
 
        try { 
            if( fileSize > 0 ) { // 파일이 존재한다면 
                // 인풋 스트림을 얻는다. 
                inputStream = multipartFile.getInputStream(); 
 
                File oldfile = new File(basePath, originalFileName); 
             
                if ( oldfile.exists()){ 
                    for(int k=0; true; k++){ 
                        //파일명 중복을 피하기 위한 일련 번호를 생성하여 
                        //파일명으로 조합 
                        oldfile = new File(basePath,"("+k+")"+originalFileName); 
                     
                        //조합된 파일명이 존재하지 않는다면, 일련번호가 
                        //붙은 파일명 다시 생성 
                        if(!oldfile.exists()){ //존재하지 않는 경우 
                            fileName = "("+k+")"+originalFileName; 
                            break; 
                        } 
                    } 
                }else{ 
                    fileName = originalFileName; 
                } 
                //make server full path to save 
                String serverFullPath = basePath + "\\" + fileName; 
                 
                System.out.println("fileName: " + fileName); 
                System.out.println("serverFullPath: " + serverFullPath); 
                 
                outputStream = new FileOutputStream( serverFullPath ); 
  
                // 버퍼를 만든다. 
                int readBytes = 0; 
                byte[] buffer = new byte[8192]; 
 
                while((readBytes = inputStream.read(buffer, 0, 8192)) != -1 ) { 
                    outputStream.write( buffer, 0, readBytes ); 
                } 
                outputStream.close(); 
                inputStream.close(); 
                         
            } 
 
        } catch(Exception e) { 
            e.printStackTrace();   
        }finally{ 
             
        } 
         
        return fileName; 
    } 
	
	public static String getCodeValue(String code){
		String value = null;
		Hashtable codes = new Hashtable();
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구전문직");
		codes.put("A04", "각종학교학생");
		codes.put("A05", "일반자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "기타");
		 
		value = (String)codes.get(code);
		 
		return value;
		}
	
	public static String checkNull(String str) {
		if(str == null) {
			str= "";
			
		}
		
		return str;
	}

		 public static List<String> getDay(){
			 List<String> list = new ArrayList<String>();
			 
			 SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			 Calendar cal = Calendar.getInstance();
			 
			 for(int i = 0;i<3;i++) {
			 list.add(sd.format(cal.getTime()));
			 cal.add(Calendar.DATE, -1);
			 }
			 return list;
		 }
		 
		 public static boolean compareDay(String wdate) {
			 boolean flag = false;
			 List<String> list = getDay();
			 if(wdate.equals(list.get(0))
					 || wdate.equals(list.get(1))
					 || wdate.equals(list.get(2))) {
				 flag = true;
			 }
					 
			 
			 
			 return flag;
		 }
		  /** 
		  *  
		  * @param totalRecord ��ü ���ڵ�� 
		  * @param nowPage     ���� ������ 
		  * @param recordPerPage �������� ���ڵ� ��  
		  * @param col �˻� �÷�  
		  * @param word �˻���
		  * @return ����¡ ���� ���ڿ�
		  */ 
		public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
		   int pagePerBlock = 5; // ���� ������ �� 
		   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // ��ü ������  
		   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// ��ü �׷� 
		   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // ���� �׷� 
		   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // Ư�� �׷��� ������ ��� ����  
		   int endPage = (nowGrp * pagePerBlock);             // Ư�� �׷��� ������ ��� ����   
		    
		   StringBuffer str = new StringBuffer(); 
		   str.append("<div style='text-align:center'>"); 
		   str.append("<ul class='pagination'> ");
		   int _nowPage = (nowGrp-1) * pagePerBlock; // 10�� ���� �������� �̵� 
		   if (nowGrp >= 2){ 
		     str.append("<li><a href='./list?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></li>"); 
		   } 
		 
		   for(int i=startPage; i<=endPage; i++){ 
		     if (i > totalPage){ 
		       break; 
		     } 
		 
		     if (nowPage == i){ 
		       str.append("<li class='active'><a href=#>"+i+"</a></li>"); 
		     }else{ 
		       str.append("<li><a href='./list.do?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></li>");   
		     } 
		   } 
		       
		   _nowPage = (nowGrp * pagePerBlock)+1; // 10�� ���� �������� �̵� 
		   if (nowGrp < totalGrp){ 
		     str.append("<li><A href='./list.do?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A></li>"); 
		   } 
		   str.append("</ul>"); 
		   str.append("</div>"); 
		    
		   return str.toString(); 
		}
		
		/* 후기 페이징 */
		public static String reviewpaging(int totalRecord, int nowPage, int recordPerPage, int id){ 
			   int pagePerBlock = 5; // ���� ������ �� 
			   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // ��ü ������  
			   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// ��ü �׷� 
			   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // ���� �׷� 
			   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // Ư�� �׷��� ������ ��� ����  
			   int endPage = (nowGrp * pagePerBlock);             // Ư�� �׷��� ������ ��� ����   
			    
			   StringBuffer str = new StringBuffer(); 
			   str.append("<div style='text-align:center'>"); 
			   str.append("<ul class='pagination'> ");
			   int _nowPage = (nowGrp-1) * pagePerBlock; // 10�� ���� �������� �̵� 
			   if (nowGrp >= 2){ 
			     str.append("<li><a href='./read?id="+id+"&nowPage="+_nowPage+"'>이전</A></li>"); 
			   } 
			 
			   for(int i=startPage; i<=endPage; i++){ 
			     if (i > totalPage){ 
			       break; 
			     } 
			 
			     if (nowPage == i){ 
			       str.append("<li class='active'><a href=# >"+i+"</a></li>"); 
			     }else{ 
			       str.append("<li><a href='./read.do?id="+id+"&nowPage="+i+"'>"+i+"</A></li>");   
			     } 
			   } 
			       
			   _nowPage = (nowGrp * pagePerBlock)+1; // 10�� ���� �������� �̵� 
			   if (nowGrp < totalGrp){ 
			     str.append("<li><A href='./read.do?id="+id+"&nowPage="+_nowPage+"'>다음</A></li>"); 
			   } 
			   str.append("</ul>"); 
			   str.append("</div>"); 
			    
			   return str.toString(); 
			}
		
		/**
		 * 댓글(리뷰)용 paging
		 * @param total
		 * @param nowPage
		 * @param recordPerPage
		 * @param col
		 * @param word
		 * @param url
		 * @param nPage
		 * @param bbsno
		 * @return
		 */
		 public static String rpaging(int total, int nowPage, int recordPerPage, String col, String word, String url,
				 int nPage, int bbsno) {
				    int pagePerBlock = 5; // 블럭당 페이지 수 
				    int totalPage = (int)(Math.ceil((double)total/recordPerPage)); // 전체 페이지  
				    int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
				    int nowGrp = (int)(Math.ceil((double)nPage/pagePerBlock));    // 현재 그룹 
				    int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
				    int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
				     
				    StringBuffer str = new StringBuffer(); 
				    str.append("<div style='text-align:center'>"); 
				    str.append("<ul class='pagination'> ");
				    int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
				    
				    if (nowGrp >= 2){ 
				      str.append("<li><a href='"+url+"?col="+col+"&word="+word+"&nowPage="+nowPage+"&bbsno="+bbsno+"&nPage="+_nowPage+"'>이전</A></li>"); 
				    } 
				  
				    for(int i=startPage; i<=endPage; i++){ 
				      if (i > totalPage){ 
				        break; 
				      } 
				  
				      if (nPage == i){ 
				        str.append("<li class='active'><a href=#>"+i+"</a></li>"); 
				      }else{ 
				        str.append("<li><a href='"+url+"?col="+col+"&word="+word+"&nowPage="+nowPage+"&bbsno="+bbsno+"&nPage="+i+"'>"+i+"</A></li>");   
				      } 
				    } 
				       
				    _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
				    if (nowGrp < totalGrp){ 
				      str.append("<li><A href='"+url+"?col="+col+"&word="+word+"&nowPage="+nowPage+"&bbsno="+bbsno+"&nPage="+_nowPage+"'>다음</A></li>"); 
				    } 
				    str.append("</ul>"); 
				    str.append("</div>"); 
				     
				   return str.toString(); 
				  
				    } 
		
		public static void deleteFile(String basePath, String oldfile) {
			// TODO Auto-generated method stub
			if(oldfile != null && !oldfile.equals("")) {
			File file = new File(basePath,oldfile);
			if(file.exists()) {
				file.delete();
			}
			}
		}

}
