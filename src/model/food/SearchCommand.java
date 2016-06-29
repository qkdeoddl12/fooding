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
import model.food.FoodInfoDto;
import model.wish.wishDao;


public class SearchCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		String search=req.getParameter("foodShopName");
		String type=req.getParameter("searchType");
		System.out.println("서치커맨드");
		// 좋아요 표시하기 위해서
				HttpSession session = req.getSession();
				try{
					int userNumber = (Integer)session.getAttribute("userNumber");
					wishDao wishdao = new wishDao();
					HashMap<String, String> likeMap = wishdao.getWishInfo(userNumber);
					req.setAttribute("likeMap",  likeMap);		
				}catch(NullPointerException e){
					e.printStackTrace();
				}
		FoodInfoDao dao = new FoodInfoDao();
		ArrayList<FoodInfoDto> Boardlist = dao.searchBoardList(search,type);		
		req.setAttribute("Boardlist", Boardlist);
		req.setAttribute("searchtext", search);
		return "front?cmd=board";
	}

}
