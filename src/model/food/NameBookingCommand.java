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


public class NameBookingCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		int num=0;
		String user=null;
		try{
		num=Integer.parseInt(req.getParameter("foodNumber"));
		user=req.getParameter("user");
		System.out.println("user : "+user );
		}catch(Exception e){
			System.out.println("error : "+e);
		}
		FoodInfoDao dao = new FoodInfoDao();
		req.setAttribute("name", dao.selectName(num));
		return "front?cmd=booking1&user="+user;
	}

}
