package comment;

import java.sql.Date;

public class CommentVO {
	//this column is applied as autoIncrement property
	//private int commentNum;
	
	private int commentPost; // post id for identifying nested comment
	private String CommentId; // comment writer id
	private Date CommentDate; // register date
	private int CommentParent; // parent comment
	private String commentContent; // comment content
	
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
		return "{commentPost:\"" + commentPost + "\""+ ", CommentId:\"" + CommentId + "\""+ ", CommentDate:\"" + CommentDate
				+ "\""+", CommentParent:\"" + CommentParent + "\""+ ", commentContent:\"" + commentContent + "\"}";
	}
	
	
	
}
