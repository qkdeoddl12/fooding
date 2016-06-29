package model.review;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import model.Command;
import model.comment.CommentDao;

public class ReviewOneListCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String foodNumber = req.getParameter("foodNumber");
		AppraisalDao dao = new AppraisalDao();
		ArrayList<AppraisalDto> apprList = dao.selectApprOneList(foodNumber);
		req.setAttribute("apprList", apprList);
		
		return "review.jsp";
	}
	
	

}
