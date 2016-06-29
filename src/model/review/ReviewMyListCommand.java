package model.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;
import model.comment.CommentDao;
import model.food.FoodInfoDao;
import model.food.FoodInfoDto;

public class ReviewMyListCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
	
		AppraisalDao dao = new AppraisalDao();
		HttpSession session = req.getSession();
		int userNumber = (Integer)session.getAttribute("userNumber");
		
		ArrayList<AppraisalDto> apprList = dao.getMyAppr(userNumber);
		req.setAttribute("apprList", apprList);
		
		FoodInfoDao foodDao = new FoodInfoDao();
		ArrayList<FoodInfoDto> foodList =  foodDao.selectBoardList();
		req.setAttribute("foodList", foodList);
		
		return "mypage/myreview.jsp";
	}
	
	

}
