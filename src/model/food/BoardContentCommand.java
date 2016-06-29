package model.food;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;
import model.review.AppraisalDao;
import model.review.AppraisalDto;

public class BoardContentCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
			
		FoodInfoDao dao = new FoodInfoDao();
		FoodInfoDto foodInfo = dao.selectBoard(req.getParameter("foodNumber"));
		
		AppraisalDao appDao = new AppraisalDao();
		ArrayList<AppraisalDto> apprList = appDao.selectAppr(req.getParameter("foodNumber"));
		
		req.setAttribute("foodInfo", foodInfo);
		req.setAttribute("apprList", apprList);
	
		return "board_content.jsp";
	}

}
