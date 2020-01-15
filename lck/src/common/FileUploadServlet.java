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
 * 브라우저로부터 전달받은 파일을 저장. 요청정보 및 파일정보를 JSON형태로 응답.
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 // 실제로 서버에 저장되는 path
	    String path = request.getSession().getServletContext().getRealPath("uploadedProfile");
	    //PrintWriter out = response.getWriter();
	    //System.out.println("절대 경로 : " + path + "<br/>");
	    
	    int size = 1024 * 1024 * 100; // 파일 사이즈 설정 : 100M
	    String fileName = "";    // 업로드한 파일 이름
	    String originalFileName = "";    //  서버에 중복된 파일 이름이 존재할 경우 처리하기 위해
	    
	    // cos.jar라이브러리 클래스를 가지고 실제 파일을 업로드하는 과정
	    try{
	    	//uploadedProfile 폴더가 없으면 생성하도록 한다.
	    	File Folder = new File(path);
	    	if (!Folder.exists()) {
	    		try{
	    		    Folder.mkdir(); //폴더 생성합니다.
	    		    //System.out.println("폴더가 생성되었습니다.");
	    	        } 
	    	        catch(Exception e){
	    		    e.getStackTrace();
	    		}        
	             }else {
	    		//System.out.println("이미 폴더가 생성되어 있습니다.");
	    	}
	    	
	        // DefaultFileRenamePolicy 처리는 중복된 이름이 존재할 경우 처리할 때
	        // request, 파일저장경로, 용량, 인코딩타입, 중복파일명에 대한 정책
	        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
	        // 전송한 전체 파일이름들을 가져온다.
	        Enumeration files = multi.getFileNames();
	        String str = (String)files.nextElement();
	        System.out.println(str);
	        //파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다.
	        // 이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다. (중복 처리)
	        fileName = multi.getFilesystemName(str);
	        //실제 파일 이름을 가져온다.
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