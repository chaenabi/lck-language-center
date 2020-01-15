package common;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FileDownServlet
 */
@WebServlet("/FileDownload")
public class FileDownloadServlet extends HttpServlet{

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, UnsupportedEncodingException {
        
        String filename = request.getParameter("f");        
        //String filename = new String(fname.getBytes("iso-8859-1"),"UTF-8");
        String of = request.getParameter("of"); //���ڵ� ���� �⺻�� ("iso-8859-1")
        
        System.out.println("filename="+filename);
        System.out.println("uploadedFilneName="+of);
        
        if(filename==null||filename.trim().equals("")){
            return;
        }
        
        //���ε� ���丮�� ������ ���
        String uploadPath = null;
        HttpSession ses = request.getSession();
        ServletContext ctx = ses.getServletContext();
        uploadPath = ctx.getRealPath("upload");
        
        //uploadPath = getServletContext().getRealPath("upload");
        //uploadPath = request.getServletContext().getRealPath("upload");
        
        //���ε� ��ο� �����̸��� ������ File�ν��Ͻ� ����
        File downloadFile = new File(uploadPath+"/"+filename);
        
        String userAgent = request.getHeader("User-Agent");
        //System.out.println(userAgent);
        
        //boolean ie = userAgent.indexOf("MSIE") > -1;
        //boolean ie = userAgent.indexOf("Trident") > -1; // IE11 ���ڿ� ���� ����
        //���� : http://javaking75.blog.me/220073352593
        boolean ie = (userAgent.indexOf("MSIE") > -1) || (userAgent.indexOf("Trident") > -1); 
        if (ie) of = URLEncoder.encode(of, "iso-8859-1").replaceAll("\\+", "%20");

        //���������� ������ �ٿ�ε� �޷η� �Ϸ��� ������ ���� ������Ÿ������
        response.setContentType("application/octet-stream");
        //response.setContentType("application/download; charset=utf-8");         
        response.setContentLength((int)downloadFile.length());//����Ʈ ũ�� ����
        //Content-Disposition����� �̿��ؼ� ���۵Ǵ� ������ �̸��� ���
        response.setHeader("Content-Disposition", "attachment; filename=\""+ of +"\"");
        //���۵Ǵ� �������� ���ڵ��� ���̳ʸ� Ÿ���̶�°��� ���
        response.setHeader("Content-Transfer-Encoding","binary");
        response.setHeader("Pragma",  "no-cache;");
        response.setHeader("Expires", "-1;");
        
        
        BufferedOutputStream bos=null;
        BufferedInputStream bis =null;        
        try {
            bos = new BufferedOutputStream(response.getOutputStream());
            bis = new BufferedInputStream(new FileInputStream(downloadFile));
            
            byte[] buffer = new byte[1024];
            int len = -1;
            while((len=bis.read(buffer)) != -1) {
                bos.write(buffer,0,len);            
            }
            //bos.flush();
            
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            
            if( bis!=null)
                try { bis.close(); } catch (IOException e) {}                
            if( bos!= null)
                try { bos.close(); } catch (IOException e) {}                    
        }            
    }
}