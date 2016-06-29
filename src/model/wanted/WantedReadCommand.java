package model.wanted;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;



import model.Command;

public class WantedReadCommand implements Command{ 

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		int wantedNumber = Integer.parseInt(req.getParameter("wantedNumber"));
		
		WantedDao dao = new WantedDao();
		WantedDto dto = new WantedDto();
		dto = dao.selectOne(wantedNumber);
			
		req.setAttribute("dto", dto);	
	     return "./wanted/wanted_read.jsp"; 
	
	}
	

}
