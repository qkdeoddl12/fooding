package model.wanted;

public class WantedDto {
	
	/*
	 * create table wantedInfo(
	wantedNumber int(11) NOT NULL AUTO_INCREMENT,
	userNumber int(11) DEFAULT NULL,
	wantedTitle varchar(45),
	wantedContent varchar(6000) DEFAULT NULL,
	wantedHit int(11) DEFAULT 0,
	wantedTime datetime DEFAULT CURRENT_TIMESTAMP,
	wantedGroupNumber  int(11),
	wantedGroupDepth int(11) DEFAULT 0,
	 PRIMARY KEY (wantedNumber),
 KEY `UserNumber` (`UserNumber`),
  CONSTRAINT `wantedInfo_ibfk_1` FOREIGN KEY (`UserNumber`) REFERENCES `userinfo` (`UserNumber`)
);
	 * 
	 */
	
	private int wantedNumber;
	private int userNumber;
	private String wantedTitle;
	private String wantedContent;
	private int wantedHit;
	private String wantedTime;
	private int wantedGroupNumber;
	private int wantedGroupDepth;
	private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getWantedNumber() {
		return wantedNumber;
	}
	public void setWantedNumber(int wantedNumber) {
		this.wantedNumber = wantedNumber;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public String getWantedTitle() {
		return wantedTitle;
	}
	public void setWantedTitle(String wantedTitle) {
		this.wantedTitle = wantedTitle;
	}
	public String getWantedContent() {
		return wantedContent;
	}
	public void setWantedContent(String wantedContent) {
		this.wantedContent = wantedContent;
	}
	public int getWantedHit() {
		return wantedHit;
	}
	public void setWantedHit(int wantedHit) {
		this.wantedHit = wantedHit;
	}
	public String getWantedTime() {
		return wantedTime;
	}
	public void setWantedTime(String wantedTime) {
		this.wantedTime = wantedTime;
	}
	public int getWantedGroupNumber() {
		return wantedGroupNumber;
	}
	public void setWantedGroupNumber(int wantedGroupNumber) {
		this.wantedGroupNumber = wantedGroupNumber;
	}
	public int getWantedGroupDepth() {
		return wantedGroupDepth;
	}
	public void setWantedGroupDepth(int wantedGroupDepth) {
		this.wantedGroupDepth = wantedGroupDepth;
	}
	
	

		
}
