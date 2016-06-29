package model.food;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;
import model.wish.wishDao;


public class BoardCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		System.out.println("����Ŀ�ǵ�");
		FoodInfoDao dao = new FoodInfoDao();
		ArrayList<FoodInfoDto> Boardlist = dao.selectBoardList();	
		
		// ���ƿ� ǥ���ϱ� ���ؼ�
		HttpSession session = req.getSession();
		try{
			int userNumber = (Integer)session.getAttribute("userNumber");
			wishDao wishdao = new wishDao();
			HashMap<String, String> likeMap = wishdao.getWishInfo(userNumber);
			req.setAttribute("likeMap",  likeMap);		
			System.out.println("���ƿ� ������ "  + likeMap.size());
		}catch(NullPointerException e){
			e.printStackTrace();
		}
		req.setAttribute("Boardlist", Boardlist);
		
		
		return "front?cmd=board";
	}

}
