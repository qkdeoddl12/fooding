package model.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Command;
import model.comment.CommentDao;
import model.food.FoodInfoDao;
import model.food.FoodInfoDto;

public class ReviewAllListCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		
		AppraisalDao dao = new AppraisalDao();
		ArrayList<AppraisalDto> apprList = dao.selectApprAllList();
		req.setAttribute("apprList", apprList);
		
		FoodInfoDao foodDao = new FoodInfoDao();
		ArrayList<FoodInfoDto> foodList =  foodDao.selectBoardList();
		req.setAttribute("foodList", foodList);
		return "review.jsp";
	}
	
	

}
