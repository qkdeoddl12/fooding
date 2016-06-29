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


public class MyBookmarkCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
req.setCharacterEncoding("utf-8");
		
		FoodInfoDao dao = new FoodInfoDao();
		int user=0;
		try{
		user=Integer.parseInt(req.getParameter("user"));
		System.out.println("¿©±â´Â my user"+user);
		}catch(Exception e){
			System.out.println("error : "+e);
		}
		ArrayList<FoodInfoDto> Booklist = dao.selectBookingList(user);	
		req.setAttribute("Booklist", Booklist);
		return "front?cmd=mybookmark";
		
	}

}
