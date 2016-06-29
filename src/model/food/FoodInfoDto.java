package model.food;

import java.sql.Blob;
import java.util.ArrayList;

import model.image.ImageDto;

public class FoodInfoDto {	
	private String foodmenu;
	private String foodPhoneNumber;
	private String foodAddr;
	
	private String foodType;
	private int foodTime;
	private int foodMenuPrice;
	
	
	private String foodStoreName;
	private String foodContent;
	private int foodNumber;
	
	private ArrayList<ImageDto> foodImg;
	private Float foodStar;
	private String foodServicePWTGBAD;
	
	private int foodClickNumber;
	private int BookingNum;
	private String BookingName;
	private String BookingPhone;
	private String BookingTime;
	private String BookingDemand;
	private String BookingApprove;
	private int BookingGroup;
	
	private int userNum;
	private String foodAddrX;
	private String foodAddrY;
	
	
	
	public String getFoodAddrX() {
		return foodAddrX;
	}
	public void setFoodAddrX(String foodAddrX) {
		this.foodAddrX = foodAddrX;
	}
	public String getFoodAddrY() {
		return foodAddrY;
	}
	public void setFoodAddrY(String foodAddrY) {
		this.foodAddrY = foodAddrY;
	}
	public int getFoodMenuPrice() {
		return foodMenuPrice;
	}
	public void setFoodMenuPrice(int foodMenuPrice) {
		this.foodMenuPrice = foodMenuPrice;
	}
	public int getBookingNum() {
		return BookingNum;
	}
	public void setBookingNum(int bookingNum) {
		BookingNum = bookingNum;
	}
	public String getBookingName() {
		return BookingName;
	}
	public void setBookingName(String bookingName) {
		BookingName = bookingName;
	}
	public String getBookingPhone() {
		return BookingPhone;
	}
	public void setBookingPhone(String bookingPhone) {
		BookingPhone = bookingPhone;
	}
	public String getBookingTime() {
		return BookingTime;
	}
	public void setBookingTime(String bookingTime) {
		BookingTime = bookingTime;
	}
	public String getBookingDemand() {
		return BookingDemand;
	}
	public void setBookingDemand(String bookingDemand) {
		BookingDemand = bookingDemand;
	}
	public String getBookingApprove() {
		return BookingApprove;
	}
	public void setBookingApprove(String bookingApprove) {
		BookingApprove = bookingApprove;
	}
	public String getFoodmenu() {
		return foodmenu;
	}
	public void setFoodmenu(String foodmenu) {
		this.foodmenu = foodmenu;
	}
	public String getFoodPhoneNumber() {
		return foodPhoneNumber;
	}
	public void setFoodPhoneNumber(String foodPhoneNumber) {
		this.foodPhoneNumber = foodPhoneNumber;
	}
	public String getFoodAddr() {
		return foodAddr;
	}
	public void setFoodAddr(String foodAddr) {
		this.foodAddr = foodAddr;
	}
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	public int getFoodTime() {
		return foodTime;
	}
	public void setFoodTime(int foodTime) {
		this.foodTime = foodTime;
	}
	public int getfoodMenuPrice() {
		return foodMenuPrice;
	}
	public void setfoodMenuPrice(int foodMenuPrice) {
		this.foodMenuPrice = foodMenuPrice;
	}
	public String getFoodStoreName() {
		return foodStoreName;
	}
	public void setFoodStoreName(String foodStoreName) {
		this.foodStoreName = foodStoreName;
	}
	public String getFoodContent() {
		return foodContent;
	}
	public void setFoodContent(String foodContent) {
		this.foodContent = foodContent;
	}
	public int getFoodNumber() {
		return foodNumber;
	}
	public void setFoodNumber(int foodNumber) {
		this.foodNumber = foodNumber;
	}
	public ArrayList<ImageDto> getFoodImg() {
		return foodImg;
	}
	public void setFoodImg(ArrayList<ImageDto> foodImg) {
		this.foodImg = foodImg;
	}
	public Float getFoodStar() {
		return foodStar;
	}
	public void setFoodStar(Float foodStar) {
		this.foodStar = foodStar;
	}
	public String getFoodServicePWTGBAD() {
		return foodServicePWTGBAD;
	}
	public void setFoodServicePWTGBAD(String foodServicePWTGBAD) {
		this.foodServicePWTGBAD = foodServicePWTGBAD;
	}
	public int getFoodClickNumber() {
		return foodClickNumber;
	}
	public void setFoodClickNumber(int foodClickNumber) {
		this.foodClickNumber = foodClickNumber;
	}
	public int getBookingGroup() {
		return BookingGroup;
	}
	public void setBookingGroup(int bookingGroup) {
		BookingGroup = bookingGroup;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	
	
	
}
