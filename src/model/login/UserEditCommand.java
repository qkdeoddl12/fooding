package model.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;
public class UserEditCommand  implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		int userNumber = (Integer)session.getAttribute("userNumber");
		
		LoginDao dao = new LoginDao();
		LoginDto dto = new LoginDto();
		dto.setUserPassword(req.getParameter("userpassword"));
		dto.setUserName(req.getParameter("username"));
		dto.setUserBirthDaty(req.getParameter("year") + "-" + req.getParameter("month")  + "-" + req.getParameter("day"));
		
		dto.setUserAddr(req.getParameter("useraddr"));
		dto.setUserPhoneNumber(req.getParameter("tel1") + req.getParameter("tel2") + req.getParameter("tel3"));
		dto.setUserEmail(req.getParameter("useremail"));		
		dto.setUserNumber(userNumber);		
		
		dao.editUser(dto);
		
		return "index.jsp";
		
	}
	
	

}
