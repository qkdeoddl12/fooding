package model.wanted;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;



import model.Command;

public class WantedWriteViewCommand implements Command{ 

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		if(req.getParameter("re") != null){
			req.setAttribute("re", Integer.parseInt(req.getParameter("re")));
			
		}		
		 return "./wanted/wanted_insert.jsp";		
	}
	

}
