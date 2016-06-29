package model.wish;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;
import model.login.LoginDto;

public class WishCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
			System.out.println("À§½ÃÄ¿¸àµå");
			
			wishDao dao = new wishDao();
			LoginDto logdto = new LoginDto();
			wishDto dto = new wishDto();
			ArrayList<wishDto> list = new ArrayList<wishDto>();
		  
			HttpSession session = req.getSession();
			logdto  = (LoginDto)session.getAttribute("emaillogin");
			
			String loginId = logdto.getUserId();

			list = dao.wishmain(loginId);
			
			req.setAttribute("foodstore",list);	
	        return "wish_main.jsp";
	}
	

}
