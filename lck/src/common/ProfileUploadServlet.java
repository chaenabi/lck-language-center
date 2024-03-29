﻿package common;

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

import user.UserVO;

@WebServlet("/ProfileUploadServlet")
public class ProfileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// .getRealPath("") 시 실제로 서버에 저장되는 path, 현재 프로젝트명의 폴더명까지만 가지고 온다
		//(예시: rootpath.../.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/lck)
		String AbsolutePath = request.getSession().getServletContext().getRealPath("profiles");
		// 실제로 서버에 저장되는 path
		//System.out.println("절대 경로: " + AbsolutePath);

	    int size = 1024 * 1024 * 100; // 파일 크기 제한. 100Mb
	    String fileName = "";    // 업로드한 파일 이름
	    String originalFileName = "";    //  서버에 중복된 파일 이름이 존재할 경우 처리하기 위해
	    
	    // cos.jar라이브러리 클래스를 가지고 실제 파일을 업로드하는 과정

	    try{
	    	// profiles 폴더가 존재하지 않으면 생성한다.
	    	File folder = new File(AbsolutePath);
	    	
	    	if (!folder.exists()) {
	    		try{
	    			folder.mkdir(); //폴더 생성.
	    		    //System.out.println("폴더가 만들어졌습니다.");
	    	        } 
	    	        catch(Exception e){
	    		    e.getStackTrace();
	    		}        
	             }else {
	    		//System.out.println("이미 폴더가 존재합니다.");
	    	}
	    	
	    	// DefaultFileRenamePolicy 처리는 중복된 이름이 존재할 경우 처리할 때
	        // request, 파일저장경로, 용량, 인코딩타입, 중복파일명에 대한 정책
	       
	        MultipartRequest multi = new MultipartRequest(request, AbsolutePath, size, "UTF-8", new DefaultFileRenamePolicy());
	       // System.out.print("업로딩한 파일의 이름: ");
	        String profile_name = (String) multi.getParameter("profile_thumnail_filename");
	    	//System.out.println(profile_name);
	       String substringFileName = "C:\\fakepath\\" + profile_name;
	        String result = substringFileName.substring(substringFileName.lastIndexOf("\\")+1);
	        
	        //순수한 파일 이름
	       // System.out.print("순수한 파일 이름: ");
	        //System.out.println(result);
	        
	        //파일 경로를 저장한다.
	        UserVO uvo = UserVO.getInstance();
	        uvo.setIdentityPhoto("/profiles/"+result);
	        
	     // 전송한 전체 파일이름들을 가져온다.
	        Enumeration files = multi.getFileNames();
	        String str = (String)files.nextElement();

	        //파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다.
	        // 이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다. (중복 처리)
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