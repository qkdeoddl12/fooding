package model.wanted;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;



import model.Command;

public class WantedWriteCommand implements Command{ 

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {		
		WantedDao dao = new WantedDao();
		WantedDto dto = new WantedDto();
		
		String title= req.getParameter("title");
		String content= req.getParameter("content");
			try{
		HttpSession session = req.getSession();
		int userNumber = (Integer)session.getAttribute("userNumber");
		System.out.println(userNumber);
		dto.setWantedTitle(title);
		dto.setWantedContent(content);
		dto.setUserNumber(userNumber);		
		dto.setWantedGroupDepth(0);
		
		if(req.getParameter("re").equals("")){ // 답글이 아니면
			dto.setWantedGroupNumber(dao.getMaxwantedNumber());			
		}else{
			dto.setWantedGroupNumber(Integer.parseInt(req.getParameter("re")));		
			dto.setWantedGroupDepth(1);

		}
			}catch(Exception e){
				
			}

		dao.insert(dto);
			
	    return "wanted?cmd=wanted";
	}
	

}
