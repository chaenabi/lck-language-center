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
 * �������κ��� ���޹��� ������ ����. ��û���� �� ���������� JSON���·� ����.
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 // ������ ������ ����Ǵ� path
	    String path = request.getSession().getServletContext().getRealPath("uploadedProfile");
	    //PrintWriter out = response.getWriter();
	    //System.out.println("���� ��� : " + path + "<br/>");
	    
	    int size = 1024 * 1024 * 100; // ���� ������ ���� : 100M
	    String fileName = "";    // ���ε��� ���� �̸�
	    String originalFileName = "";    //  ������ �ߺ��� ���� �̸��� ������ ��� ó���ϱ� ����
	    
	    // cos.jar���̺귯�� Ŭ������ ������ ���� ������ ���ε��ϴ� ����
	    try{
	    	//uploadedProfile ������ ������ �����ϵ��� �Ѵ�.
	    	File Folder = new File(path);
	    	if (!Folder.exists()) {
	    		try{
	    		    Folder.mkdir(); //���� �����մϴ�.
	    		    //System.out.println("������ �����Ǿ����ϴ�.");
	    	        } 
	    	        catch(Exception e){
	    		    e.getStackTrace();
	    		}        
	             }else {
	    		//System.out.println("�̹� ������ �����Ǿ� �ֽ��ϴ�.");
	    	}
	    	
	        // DefaultFileRenamePolicy ó���� �ߺ��� �̸��� ������ ��� ó���� ��
	        // request, ����������, �뷮, ���ڵ�Ÿ��, �ߺ����ϸ� ���� ��å
	        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
	        // ������ ��ü �����̸����� �����´�.
	        Enumeration files = multi.getFileNames();
	        String str = (String)files.nextElement();
	        System.out.println(str);
	        //���ϸ� �ߺ��� �߻����� �� ��å�� ���� �ڿ� 1,2,3 ó�� ���ڰ� �پ� ���� ���ϸ��� �����Ѵ�.
	        // �̶� ������ �̸��� FilesystemName�̶�� �Ͽ� �� �̸� ������ �����´�. (�ߺ� ó��)
	        fileName = multi.getFilesystemName(str);
	        //���� ���� �̸��� �����´�.
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