package model.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommentWriteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain"); 
		// resp.setHeader("Cache-Control", "no-cache");
		
		String commentContent = req.getParameter("commentContent");
		
		int apprNumber = Integer.parseInt(req.getParameter("apprNumber"));
		
		HttpSession session = req.getSession();
		
		CommentDto dto = new CommentDto();
		dto.setAppraisalNumber(apprNumber);
		dto.setCommentContent(commentContent);
		dto.setUserNumber((Integer)session.getAttribute("userNumber"));
		CommentDao dao = new CommentDao();
		dao.writeComment(dto);
		
		
	}
	
}