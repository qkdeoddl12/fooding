package model.comment;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.login.LoginDao;

public class CommentServlet extends HttpServlet{

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
		
		
		String result = "[";
		int apprNumber = Integer.parseInt(req.getParameter("apprNumber"));
		
		//댓글번호/사용자번호/내용
		
		PrintWriter out = resp.getWriter();
		CommentDao dao = new CommentDao();
		ArrayList<CommentDto> list = dao.selectCommentList(apprNumber);
		LoginDao loginDao = new LoginDao();
		
		for(int i=0; i<list.size(); i++){
			CommentDto dto = list.get(i);
			
			result += "{\"commentNumber\":\"" + dto.getCommentNumber() 
					+ "\",\"userNumber\":\"" + dto.getUserNumber()
					+ "\",\"userId\":\"" + loginDao.getUserId(dto.getUserNumber())
					+ "\",\"commentContent\":\"" + dto.getCommentContent() + "\"}"; 
			if(i != list.size()-1){
				result += ",";
			}
		}
		result += "]";
		
	
		out.println(result);
	}
	
}
