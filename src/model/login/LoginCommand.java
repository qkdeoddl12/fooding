package model.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class LoginCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		LoginDto dto = new LoginDto();
		dto.setUserId(req.getParameter("userid"));
		System.out.println("4 : " + req.getParameter("userid"));

		if ((boolean) req.getAttribute("re") == true) {
			HttpSession session = req.getSession();
			session.setAttribute("emaillogin", dto);
			Object re = req.getAttribute("re");
			
			session.setAttribute("userId", req.getParameter("userid"));
			LoginDao dao = new LoginDao();
			int userNumber = dao.getUserNumber(req.getParameter("userid"));
			session.setAttribute("userNumber", userNumber);
			
			int userAuthority = dao.getUserAtho(userNumber);
			session.setAttribute("userAuthority", userAuthority);
			
		}

		return "index.jsp";

	}
}
