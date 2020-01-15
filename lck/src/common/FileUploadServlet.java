package common;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * 釉뚮씪?곗?濡쒕????꾨떖諛쏆? ?뚯씪????? ?붿껌?뺣낫 諛??뚯씪?뺣낫瑜?JSON?뺥깭濡??묐떟.
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 // ?ㅼ젣濡??쒕쾭????λ릺??path
	    String path = request.getSession().getServletContext().getRealPath("uploadedProfile");
	    //PrintWriter out = response.getWriter();
	    //System.out.println("?덈? 寃쎈줈 : " + path + "<br/>");
	    
	    int size = 1024 * 1024 * 100; // ?뚯씪 ?ъ씠利??ㅼ젙 : 100M
	    String fileName = "";    // ?낅줈?쒗븳 ?뚯씪 ?대쫫
	    String originalFileName = "";    //  ?쒕쾭??以묐났???뚯씪 ?대쫫??議댁옱??寃쎌슦 泥섎━?섍린 ?꾪빐
	    
	    // cos.jar?쇱씠釉뚮윭由??대옒?ㅻ? 媛吏怨??ㅼ젣 ?뚯씪???낅줈?쒗븯??怨쇱젙
	    try{
	    	//uploadedProfile ?대뜑媛 ?놁쑝硫??앹꽦?섎룄濡??쒕떎.
	    	File Folder = new File(path);
	    	if (!Folder.exists()) {
	    		try{
	    		    Folder.mkdir(); //?대뜑 ?앹꽦?⑸땲??
	    		    //System.out.println("?대뜑媛 ?앹꽦?섏뿀?듬땲??");
	    	        } 
	    	        catch(Exception e){
	    		    e.getStackTrace();
	    		}        
	             }else {
	    		//System.out.println("?대? ?대뜑媛 ?앹꽦?섏뼱 ?덉뒿?덈떎.");
	    	}
	    	
	        // DefaultFileRenamePolicy 泥섎━??以묐났???대쫫??議댁옱??寃쎌슦 泥섎━????
	        // request, ?뚯씪??κ꼍濡? ?⑸웾, ?몄퐫?⑺??? 以묐났?뚯씪紐낆뿉 ????뺤콉
	        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
	        // ?꾩넚???꾩껜 ?뚯씪?대쫫?ㅼ쓣 媛?몄삩??
	        Enumeration files = multi.getFileNames();
	        String str = (String)files.nextElement();
	        System.out.println(str);
	        //?뚯씪紐?以묐났??諛쒖깮?덉쓣 ???뺤콉???섑빐 ?ㅼ뿉 1,2,3 泥섎읆 ?レ옄媛 遺숈뼱 怨좎쑀 ?뚯씪紐낆쓣 ?앹꽦?쒕떎.
	        // ?대븣 ?앹꽦???대쫫??FilesystemName?대씪怨??섏뿬 洹??대쫫 ?뺣낫瑜?媛?몄삩?? (以묐났 泥섎━)
	        fileName = multi.getFilesystemName(str);
	        //?ㅼ젣 ?뚯씪 ?대쫫??媛?몄삩??
	        originalFileName = multi.getOriginalFileName(str);
	        
	    }catch(Exception e){
	        e.printStackTrace();
	    }


	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}