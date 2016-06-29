package model.wanted;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;



import model.Command;

public class WantedListCommand implements Command{ 

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {		
		WantedDao dao = new WantedDao();
		WantedDto dto = new WantedDto();
		int totalRecord = 0; //전체 글의갯수를 가져옴
		   int numPerpage = 10;//한페이지당 뿌려질 글의 갯수
		   int pagePerBlock = 5; //페이지 이동(블럭단위 : 이전 10페이지, 다음 10페이지 이런식으로)
		   //여기서는 3페이지를 하나로
		   int totalPage = 0; //전체 몇 페이지냐
		   int totalBlock = 0;
		   int nowPage = 0;//현재 페이지의 위치
		   int nowBlock = 0;
		   int beginPerPage = 1; //페이지의 시작번호(1부터5, 6부터10...-)%>
		ArrayList<WantedDto> list = new ArrayList<WantedDto>();
		list = dao.selectList();
		System.out.println("ㅁㅈㅇㅁㅈㅇㅁㅇㅁㅇ");
		totalRecord = list.size();
		
	     totalPage = ((int) Math.ceil((double) totalRecord / numPerpage));
         
         if(req.getParameter("nowPage")!=null)
            nowPage=Integer.parseInt(req.getParameter("nowPage"));
        
         if(req.getParameter("nowBlock")!=null)
            nowBlock=Integer.parseInt(req.getParameter("nowBlock"));
         
         totalBlock=((int) Math.ceil((double) totalPage / pagePerBlock));
         
         beginPerPage=nowPage*numPerpage;//현재 페이지 * 각 페이지의 갯수;
         System.out.println("totalRecord "+ totalRecord);	
         System.out.println("totalPage "+ totalPage );	
         System.out.println("nowPage "+nowPage);	
         System.out.println("nowBlock"+ nowBlock);	
         System.out.println("totalBlock "+ totalBlock);	
         System.out.println("beginPerPage "+ beginPerPage);	
 		
 		
 		
		req.setAttribute("wanted", list);	
		req.setAttribute("totalRecord", totalRecord);	
		req.setAttribute("totalPage", totalPage );	
		req.setAttribute("nowPage", nowPage);	
		req.setAttribute("nowBlock", nowBlock);	
		req.setAttribute("totalBlock", totalBlock);	
		req.setAttribute("beginPerPage", beginPerPage);	
        return "front?cmd=wanted";		
	}
	

}
