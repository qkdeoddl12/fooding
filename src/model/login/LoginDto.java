package model.login;

public class LoginDto {
	
	private String userEmail;
	private String userPassword;
	private int userNumber;
	private String userId;
	private boolean userAuthority;
	private	String userName;
	private String userBirthDaty;
	private String userAddr;
	private String userPhoneNumber;
	
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public boolean isUserAuthority() {
		return userAuthority;
	}
	public void setUserAuthority(boolean userAuthority) {
		this.userAuthority = userAuthority;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserBirthDaty() {
		return userBirthDaty;
	}
	public void setUserBirthDaty(String userBirthDaty) {
		this.userBirthDaty = userBirthDaty;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}
	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

}
