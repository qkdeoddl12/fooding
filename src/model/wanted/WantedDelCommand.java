package model.wanted;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;



import model.Command;

public class WantedDelCommand implements Command{ 

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {

		System.out.println("원티드커멘트");
		
		WantedDao dao = new WantedDao();
		WantedDto dto = new WantedDto();
		ArrayList<WantedDto> list = new ArrayList<WantedDto>();		
		int wantedNumber = Integer.parseInt(req.getParameter("wantedNumber"));
		dao.delete(wantedNumber);
		
	    return "wanted?cmd=wanted";
	  
	}
	

}
