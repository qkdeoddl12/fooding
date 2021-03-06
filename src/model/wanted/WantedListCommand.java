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
		int totalRecord = 0; //穿端 越税姐呪研 亜閃身
		   int numPerpage = 10;//廃凪戚走雁 姿形霜 越税 姐呪
		   int pagePerBlock = 5; //凪戚走 戚疑(鷺薫舘是 : 戚穿 10凪戚走, 陥製 10凪戚走 戚訓縦生稽)
		   //食奄辞澗 3凪戚走研 馬蟹稽
		   int totalPage = 0; //穿端 護 凪戚走劃
		   int totalBlock = 0;
		   int nowPage = 0;//薄仙 凪戚走税 是帖
		   int nowBlock = 0;
		   int beginPerPage = 1; //凪戚走税 獣拙腰硲(1採斗5, 6採斗10...-)%>
		ArrayList<WantedDto> list = new ArrayList<WantedDto>();
		list = dao.selectList();
		System.out.println("けじしけじしけしけし");
		totalRecord = list.size();
		
	     totalPage = ((int) Math.ceil((double) totalRecord / numPerpage));
         
         if(req.getParameter("nowPage")!=null)
            nowPage=Integer.parseInt(req.getParameter("nowPage"));
        
         if(req.getParameter("nowBlock")!=null)
            nowBlock=Integer.parseInt(req.getParameter("nowBlock"));
         
         totalBlock=((int) Math.ceil((double) totalPage / pagePerBlock));
         
         beginPerPage=nowPage*numPerpage;//薄仙 凪戚走 * 唖 凪戚走税 姐呪;
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
