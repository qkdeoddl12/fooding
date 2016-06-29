package model.food;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;


public class BookingCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		FoodInfoDto booking=new FoodInfoDto();
		FoodInfoDao dao=new FoodInfoDao();
		int foodNumber=Integer.parseInt(req.getParameter("foodNumber"));
		String foodStoreName=req.getParameter("foodStoreName");
		String bookingName=req.getParameter("bookingName");
		String bookingPhone=req.getParameter("bookingPhone");
		String bookingTime=req.getParameter("bookingTime");
		String bookingDemand=req.getParameter("bookingDemand");
		int bookingGroup=Integer.parseInt(req.getParameter("bookingGroup"));
		int user=Integer.parseInt(req.getParameter("user"));
		
		System.out.println(foodNumber+","+foodStoreName+"매장이릅입니다");
		System.out.println("user "+user);
		
		booking.setFoodNumber(foodNumber);
		booking.setFoodStoreName(foodStoreName);
		booking.setBookingName(bookingName);
		booking.setBookingPhone(bookingPhone);
		booking.setBookingTime(bookingTime);
		booking.setBookingDemand(bookingDemand);
		booking.setBookingGroup(bookingGroup);
		booking.setUserNum(user);
		
		dao.writeBooking(booking);
	
		return "food?cmd=mybookmark&usernum="+user;
	}

}
