package model.comment;

public class CommentDto {
	private int commentNumber;
	private int appraisalNumber;
	private int userNumber;
	private String commentContent;
	public int getCommentNumber() {
		return commentNumber;
	}
	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}
	public int getAppraisalNumber() {
		return appraisalNumber;
	}
	public void setAppraisalNumber(int appraisalNumber) {
		this.appraisalNumber = appraisalNumber;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	
	
}
