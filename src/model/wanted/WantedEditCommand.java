package model.wanted;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;



import model.Command;

public class WantedEditCommand implements Command{ 

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {		
		WantedDao dao = new WantedDao();		
		WantedDto dto = new WantedDto();
		
		int wantedNumber = Integer.parseInt(req.getParameter("wantedNumber"));
		dto.setWantedTitle(req.getParameter("title"));
		dto.setWantedContent(req.getParameter("content"));
		dto.setWantedNumber(wantedNumber);
		
		dao.update(dto);
		
	    return "wanted?cmd=wantedread&wantedNumber="+wantedNumber;		
	}
	

}
