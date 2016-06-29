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

import model.Command;
import model.FactoryCommand;
import model.login.LoginDao;
import model.login.LoginDto;
import model.wish.wishDao;
import model.wish.wishDto;

public class LoginController  extends HttpServlet {

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
		boolean re = false;

		if (req.getParameter("cmd").equals("login")) {
			LoginDao dao = new LoginDao();
			LoginDto dto = new LoginDto();
			ArrayList<LoginDto> list = new ArrayList<LoginDto>();

			String userid = req.getParameter("userid");
			String userpassword = req.getParameter("userpassword");

			dto.setUserId(userid);
			dto.setUserPassword(userpassword);

			list.add(dto);

			// 아래는 처리 과정(로그인)
			re = dao.writeBoard(list);
			// dao에서 DB처리
			req.setAttribute("re", re);

		}

		else if (req.getParameter("cmd").equals("register")) {
			LoginDao dao = new LoginDao();
			LoginDto dto = new LoginDto();
			ArrayList<LoginDto> list = new ArrayList<LoginDto>();

			String userid = req.getParameter("userid");
			String userpassword = req.getParameter("userpassword");

			String username = req.getParameter("username");
			String userbir = req.getParameter("year") +"-"+req.getParameter("month")+"-"+req.getParameter("day");
			String useraddr = req.getParameter("useraddr");
			String userphone = req.getParameter("tel1") + req.getParameter("tel2") + req.getParameter("tel3");
			String useremail = req.getParameter("useremail");

			System.out.println("회원가입이다 뭐");
			dto.setUserId(userid);
			dto.setUserPassword(userpassword);
			dto.setUserName(username);
			dto.setUserBirthDaty(userbir);
			dto.setUserAddr(useraddr);
			dto.setUserPhoneNumber(userphone);
			dto.setUserEmail(useremail);

			list.add(dto);

			// dao에서 DB처리
			req.setAttribute("re", re);

			// 아래는 처리과정(회원가입)
			dao.userRegister(list);

		} else if (req.getParameter("cmd").equals("wishmain")) {
			System.out.println("test");
			
			wishDao dao = new wishDao();
			LoginDto logdto = new LoginDto();
			ArrayList<wishDto> list = new ArrayList<wishDto>();
			
			HttpSession session = req.getSession();
			logdto  = (LoginDto)session.getAttribute("emaillogin");
			System.out.println(logdto.getUserId());
			
			String loginId = logdto.getUserId();
			
			list = dao.wishmain(loginId);


		} else if (req.getParameter("cmd").equals("deletelogin")) {
			System.out.println("일단");
		}
		
		Command command = null;
		FactoryCommand factory = FactoryCommand.getInstance();
		command = factory.createCommand(cmd);
		try {
			url = (String) command.processCommand(req, resp);
		} catch (SerialException e) {
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req, resp);
	}

}
