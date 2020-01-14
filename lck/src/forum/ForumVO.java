package forum;

import java.sql.Date;

public class ForumVO {
	//this column is applied as autoIncrement property
	//private int forumNum;
	
	private String postId; // 작성자(관리자) 아이디
	private String postSubject; //게시물 제목
	private String postContent; //게시물 내용
	private String postFile; //첨부파일명
	private int SawCount; //조회수
	private Date postDate; //게시날짜
	
//	public int getForumNum() {
//		return forumNum;
//	}
//
//	public void setForumNum(int forumNum) {
//		this.forumNum = forumNum;
//	}

	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getPostSubject() {
		return postSubject;
	}
	public void setPostSubject(String postSubject) {
		this.postSubject = postSubject;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostFile() {
		return postFile;
	}
	public void setPostFile(String postFile) {
		this.postFile = postFile;
	}
	public int getSawCount() {
		return SawCount;
	}
	public void setSawCount(int sawCount) {
		SawCount = sawCount;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	@Override
	public String toString() {
		return "ForumVO [postId=" + postId + ", postSubject=" + postSubject + ", postContent=" + postContent
				+ ", postFile=" + postFile + ", SawCount=" + SawCount + ", postDate=" + postDate + ", getPostId()="
				+ getPostId() + ", getPostSubject()=" + getPostSubject() + ", getPostContent()=" + getPostContent()
				+ ", getPostFile()=" + getPostFile() + ", getSawCount()=" + getSawCount() + ", getPostDate()="
				+ getPostDate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	} 
	

	
	
	
	
}
