package model.wish;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class WishWriteServlet  extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain"); 
		
		int foodNumber = Integer.parseInt(req.getParameter("foodNumber"));
		int userNumber = Integer.parseInt(req.getParameter("userNumber"));
		wishDao dao = new wishDao();
		boolean check = dao.wishWrite(foodNumber, userNumber);
		PrintWriter out = resp.getWriter();
		System.out.println("test dddd ¿ßΩ√∑÷¿Ã∆Æº≠∫Ì∏¥");
		out.print(check);
	}
	
}
