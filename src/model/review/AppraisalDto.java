package model.review;

public class AppraisalDto {
	private int appraisalNumber;
	private int foodNumber;
	private int userNumber;
	private String userId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	private float appraisalStar;
	private String appraisalReply;
	private String appraisalImg;
	private int commentCount;
	
	
	public int getAppraisalNumber() {
		return appraisalNumber;
	}
	public void setAppraisalNumber(int appraisalNumber) {
		this.appraisalNumber = appraisalNumber;
	}
	public int getFoodNumber() {
		return foodNumber;
	}
	public void setFoodNumber(int foodNumber) {
		this.foodNumber = foodNumber;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public float getAppraisalStar() {
		return appraisalStar;
	}
	public void setAppraisalStar(float appraisalStar) {
		this.appraisalStar = appraisalStar;
	}
	public String getAppraisalReply() {
		return appraisalReply;
	}
	public void setAppraisalReply(String appraisalReply) {
		this.appraisalReply = appraisalReply;
	}
	public String getAppraisalImg() {
		return appraisalImg;
	}
	public void setAppraisalImg(String appraisalImg) {
		this.appraisalImg = appraisalImg;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	
}
