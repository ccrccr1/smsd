package spring.sts.smsd;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SmartEditorRestController {
   @PostMapping("/smartEditor/fileUpload")
   public void photo(HttpServletRequest request,HttpServletResponse response) {

      String sFileInfo = "";
      String filename = request.getHeader("file-name");
      String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
      filename_ext = filename_ext.toLowerCase();
      String dftFilePath = request.getSession().getServletContext().getRealPath("/");

      String filePath = dftFilePath+"upload"+File.separator;
      File file = new File(filePath);
      if(!file.exists()) {
         file.mkdirs();
      }
      String realFileNm = "";
      SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
      String today = formatter.format(new java.util.Date());
      realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
      String rlFileNm = filePath + realFileNm;

      
      InputStream is;
      try {
         is = request.getInputStream();

         OutputStream os = new FileOutputStream(rlFileNm);
         int numRead;
         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
         while((numRead = is.read(b,0,b.length)) != -1) {
            os.write(b,0,numRead);
         }
         if(is != null) {
            is.close();
         }
         os.flush();
         os.close();
         
         sFileInfo += "&bNewLine=true";
         sFileInfo += "&sFileName="+filename;
         sFileInfo += "&sFileURL="+request.getContextPath()+"/upload/"+realFileNm;
         PrintWriter print = response.getWriter();
         print.print(sFileInfo);
         print.flush();
         print.close();
      }
      catch (IOException e) {
         System.out.println("오류 발생 :"+ e);
         e.printStackTrace();
      }
   
   }
}