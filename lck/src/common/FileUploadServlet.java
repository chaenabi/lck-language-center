package common;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;

/**
 * �������κ��� ���޹��� ������ ����.
 * ��û���� �� ���������� JSON���·� ����.
 */
@WebServlet("/FileUploadServlet") 
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
 
        //����������Ÿ���� JSON���·� ���� 
        //TODO: Iframe�� ���� JSON������ ����� ������ �ٿ�ε� â�� �ߴ� ����. 
        //response.setContentType("application/json; charset=UTF-8"); 
        //response.setContentType("text/plain; charset=UTF-8");
        
        //Iframe ������ε� ���ε����� ���� ������ Ÿ���� application/json�� ��� 
        //������ �ʴ� �ٿ�ε� ��ȭ���ڸ� �����ֽ��ϴ�.
        //�׷��� Content-type �� text/plain or text/html �����̾���մϴ�. 
        //����: http://javaking75.blog.me/220073311435
        
        //System.out.println(request.getHeader("accept"));
        if (request.getHeader("accept").indexOf("application/json") != -1) {
            response.setContentType("application/json; charset=UTF-8");
        } else {
            // IE workaround
            response.setContentType("text/plain; charset=UTF-8");
        }        
        
        PrintWriter out = response.getWriter();
        
        RequestFile model = new RequestFile();
        
        try {
            //��ũ���� ���� ��� ���
            String contextRootPath = this.getServletContext().getRealPath("/");
            
            //1. �޸𸮳� ���Ϸ� ���ε� ���� �����ϴ� FileItem�� Factory����
            DiskFileItemFactory diskFactory = new DiskFileItemFactory(); 
            //�ӽ� ��������
            diskFactory.setRepository(new File(contextRootPath + "/WEB-INF/temp"));
            
            //2. ���ε� ��û�� ó���ϴ� ServletFileUpload ����
            ServletFileUpload upload = new ServletFileUpload(diskFactory); 
            upload.setSizeMax(100 * 1024 * 1024); //100MB : ��ü �ִ� ���ε� ���� ũ��
            //upload.setFileSizeMax(100 * 1024 * 1024); //100MB : �����ϳ��� �ִ� ���ε� ���� ũ��
            
            //3. ���ε� ��û �Ľ��ؼ� FileItem ��� ����
            @SuppressWarnings("unchecked")
            List<FileItem> items = upload.parseRequest(request); 
            
            for(FileItem item : items) {
                
                //5. FileItem�� ���Է� �׸����� ���ο� ���� �˸��� ó��
                if (item.isFormField()) { //������ �ƴѰ��                    
                    processFormField(model, item);                            
                } else { //������ ���
                    if(item.getSize()!=0) { //���ε�� ������ ������쿡�� ó��
                        processUploadFile(model, item, contextRootPath);    
                    }                                                        
                }            
            }
         
            
            //�� ��ü(VO,DTO)�� JSON���·� ���ڿ��� ��ȯ�ϱ� ���� Gson��ü ����.
            Gson gson = new Gson();
            String outString = gson.toJson(model);
            //System.out.println(outString);
            out.print(outString);    
            System.out.println(contextRootPath);
            System.out.println(model);
            
            
        } catch(Exception e) {    
            
            e.printStackTrace();
            
            out.print("{\"result\":\"500\"");
            out.print(",\"msg\":\""+e.getMessage());            
            out.print("\"}");                
        }
    }

    //���� ��� ó��
    private void processUploadFile(
            RequestFile model, FileItem item, String contextRootPath) throws Exception {
        
        String name = item.getFieldName(); //�ʵ� �̸� ���
        String fileName = item.getName(); //���ϸ� ���
        String contentType = item.getContentType(); //������ Ÿ�� ���
        long fileSize = item.getSize(); //������ ũ�� ���
        
        //���ε� ���ϸ��� ����ð����� ������ ����
        //String uploadedFileName = System.currentTimeMillis() 
        //                             +fileName.substring(fileName.lastIndexOf("."));
        String uploadedFileName = System.currentTimeMillis() 
                + UUID.randomUUID().toString() +fileName.substring(fileName.lastIndexOf("."));;
        //������ �����η� ���� ��ü ����
        File uploadedFile = new File(contextRootPath + "/upload/" + uploadedFileName); 
        item.write(uploadedFile); //���� ����
                        
        FileInfoModel fileInfoModel = new FileInfoModel(name, fileName, 
                                                       uploadedFileName, fileSize, contentType);
         
        if("photo".equals(name)) {
            List<FileInfoModel> photoList = model.getPhoto();
            if(photoList == null ) photoList = new ArrayList<FileInfoModel>();
            photoList.add(fileInfoModel);
            model.setPhoto(photoList);
        } else if("file".equals(name)) {
            model.setFile(fileInfoModel);
        }    
        item.delete(); //���ϰ� ���õ� �ڿ��� �����Ѵ�.
    }
    
    //�Ϲ� ��� ó��
    private void processFormField(RequestFile model, FileItem item) throws Exception{
        String name = item.getFieldName();
        String value = item.getString("UTF-8");
        
        //��û�Ķ������ �̸��� ���� ����ü(RequestFile)�� �� �Ҵ�.
        if("title".equals(name)) {
            model.setTitle(value);
        } else if("description".equals(name)) {
            model.setDescription(value);
        }
    }
    
    
}