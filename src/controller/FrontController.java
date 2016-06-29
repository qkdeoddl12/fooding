package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.login.LoginDao;
import model.login.LoginDto;
import model.wish.wishDao;
import model.wish.wishDto;
import model.Command;
import model.FactoryCommand;
import model.food.FoodInfoDao;

public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String cmd = req.getParameter("cmd");

		String url = "";

		if(cmd.equals("board")){
			url="Board.jsp";		
		}else if(cmd.equals("booking")){
			url="bookmark.jsp";
		}else if(cmd.equals("bookmark")){
			url="bookmark.jsp";
		}else if(cmd.equals("mybookmark")){
			url="mybookmark.jsp";
		}
		else if(cmd.equals("booking1")){
			url="booking.jsp";
		}
		else if(cmd.equals("wanted")){
			url="./wanted/wanted_list.jsp";
		}
		
		RequestDispatcher view=req.getRequestDispatcher(url);
		view.forward(req, resp);
	}
}
