package comment;

import java.sql.Date;

public class CommentVO {
	//this column is applied as autoIncrement property
	//private int commentNum;
	
	private int commentPost; // °Ô½Ã¹° ¹øÈ£(´ñ±Û ½Äº°)
	private String CommentId; // ´ñ±ÛÀÚ ¾ÆÀÌµð
	private Date CommentDate; // ´ñ±Ûµî·Ï³¯Â¥
	private int CommentParent; // ºÎ¸ð´ñ±Û
	private String commentContent; //´ñ±Û³»¿ë
	
//	public int getCommentNum() {
//		return commentNum;
//	}
//	public void setCommentNum(int commentNum) {
//		this.commentNum = commentNum;
//	}
	
	public int getCommentPost() {
		return commentPost;
	}
	public void setCommentPost(int commentPost) {
		this.commentPost = commentPost;
	}
	public String getCommentId() {
		return CommentId;
	}
	public void setCommentId(String commentId) {
		CommentId = commentId;
	}
	public Date getCommentDate() {
		return CommentDate;
	}
	public void setCommentDate(Date commentDate) {
		CommentDate = commentDate;
	}
	public int getCommentParent() {
		return CommentParent;
	}
	public void setCommentParent(int commentParent) {
		CommentParent = commentParent;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	@Override
	public String toString() {
		return "CommentVO [commentPost=" + commentPost + ", CommentId=" + CommentId + ", CommentDate=" + CommentDate
				+ ", CommentParent=" + CommentParent + ", commentContent=" + commentContent + "]";
	}
	
	
	
}
