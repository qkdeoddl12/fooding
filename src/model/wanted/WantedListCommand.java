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
		int totalRecord = 0; //��ü ���ǰ����� ������
		   int numPerpage = 10;//���������� �ѷ��� ���� ����
		   int pagePerBlock = 5; //������ �̵�(������ : ���� 10������, ���� 10������ �̷�������)
		   //���⼭�� 3�������� �ϳ���
		   int totalPage = 0; //��ü �� ��������
		   int totalBlock = 0;
		   int nowPage = 0;//���� �������� ��ġ
		   int nowBlock = 0;
		   int beginPerPage = 1; //�������� ���۹�ȣ(1����5, 6����10...-)%>
		ArrayList<WantedDto> list = new ArrayList<WantedDto>();
		list = dao.selectList();
		System.out.println("��������������������");
		totalRecord = list.size();
		
	     totalPage = ((int) Math.ceil((double) totalRecord / numPerpage));
         
         if(req.getParameter("nowPage")!=null)
            nowPage=Integer.parseInt(req.getParameter("nowPage"));
        
         if(req.getParameter("nowBlock")!=null)
            nowBlock=Integer.parseInt(req.getParameter("nowBlock"));
         
         totalBlock=((int) Math.ceil((double) totalPage / pagePerBlock));
         
         beginPerPage=nowPage*numPerpage;//���� ������ * �� �������� ����;
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
