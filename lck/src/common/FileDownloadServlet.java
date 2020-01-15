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
        String of = request.getParameter("of"); //?몄퐫???쒕쾭 湲곕낯媛?("iso-8859-1")
        
        System.out.println("filename="+filename);
        System.out.println("uploadedFilneName="+of);
        
        if(filename==null||filename.trim().equals("")){
            return;
        }
        
        //?낅줈???붾젆?좊━???덈?寃쎈줈 ?산린
        String uploadPath = null;
        HttpSession ses = request.getSession();
        ServletContext ctx = ses.getServletContext();
        uploadPath = ctx.getRealPath("upload");
        
        //uploadPath = getServletContext().getRealPath("upload");
        //uploadPath = request.getServletContext().getRealPath("upload");
        
        //?낅줈??寃쎈줈? ?뚯씪?대쫫??媛吏怨?File?몄뒪?댁뒪 ?앹꽦
        File downloadFile = new File(uploadPath+"/"+filename);
        
        String userAgent = request.getHeader("User-Agent");
        //System.out.println(userAgent);
        
        //boolean ie = userAgent.indexOf("MSIE") > -1;
        //boolean ie = userAgent.indexOf("Trident") > -1; // IE11 臾몄옄??源⑥쭚 諛⑹?
        //李멸퀬 : http://javaking75.blog.me/220073352593
        boolean ie = (userAgent.indexOf("MSIE") > -1) || (userAgent.indexOf("Trident") > -1); 
        if (ie) of = URLEncoder.encode(of, "iso-8859-1").replaceAll("\\+", "%20");

        //?밸툕?쇱슦?媛 ?뚯씪???ㅼ슫濡쒕뱶 諛쏅줈濡??섎젮硫??ㅼ쓬怨?媛숈씠 而⑦뀒痢좏??낆???
        response.setContentType("application/octet-stream");
        //response.setContentType("application/download; charset=utf-8");         
        response.setContentLength((int)downloadFile.length());//肄섑뀗???ш린 吏??
        //Content-Disposition?ㅻ뜑瑜??댁슜?댁꽌 ?꾩넚?섎뒗 ?뚯씪???대쫫??紐낆떆
        response.setHeader("Content-Disposition", "attachment; filename=\""+ of +"\"");
        //?꾩넚?섎뒗 ?곗씠?곗쓽 ?몄퐫?⑹씠 諛붿씠?덈━ ??낆씠?쇰뒗寃껋쓣 紐낆떆
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