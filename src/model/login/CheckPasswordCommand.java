package model.login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;
import model.food.FoodInfoDao;
import model.food.FoodInfoDto;
import model.wish.wishDao;

public class CheckPasswordCommand implements Command{
	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		LoginDao dao = new LoginDao();
		HttpSession session = req.getSession();
		String userid = (String)session.getAttribute("userId");
		String password = req.getParameter("password");
		int userNumber = (Integer)session.getAttribute("userNumber");
		boolean check = dao.checkPwd(userid, password);
		if(check){
			LoginDto dto = dao.getUser(userNumber);
			req.setAttribute("dto", dto);
			return "mypage/mypage.jsp";
		}
		
		return "mypage/mypage_check.jsp";
	}

	
}
