package model.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.comment.CommentDao;
import model.comment.CommentDto;

public class DuplicacateServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain"); 	
		
		String checkid = req.getParameter("id");
		LoginDao dao = new LoginDao();
		
		String result = "불가능";	
		int check = dao.getUserNumber(checkid);
		
		if(check == 0){
			result = "가능";
		}
		PrintWriter out = resp.getWriter();
		System.out.println("여기서는 ? " + result);
		out.print(result);
	}
	
}
