package model.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class LoginSearchCommand implements Command{

   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
      req.setCharacterEncoding("utf-8");
       req.setCharacterEncoding("UTF-8"); 
       
       System.out.println("��ġĿ���");
       LoginDao dao = new LoginDao();
      
      
      String userid=req.getParameter("userid");
      String username=req.getParameter("username2");
      System.out.println(userid);
      

      if((username== null) && (userid==null)){ //�׳� �̵�
         System.out.println("�� ���̴�");
           return "./login/search.jsp";
      }
      else if(userid==""){// �Ƶ�ã�� �̵�
         System.out.println("�Ƶ� ã���ž�");
         String username2=req.getParameter("username2");
         String tel=req.getParameter("tel1")+req.getParameter("tel2")+req.getParameter("tel3");
         String bar=req.getParameter("year")+"-"+req.getParameter("month")+"-"+req.getParameter("day");
         System.out.println(username2+tel+bar);
         
         ArrayList<LoginDto> list = dao.search(username2,tel,bar);
         
         
         req.setAttribute("idsearch", list);
         
          return "./login/search.jsp";
      }
      else if(userid !=""){//���ã�� �̵�
         System.out.println("��� ã���ž�");
         
         String bar=req.getParameter("year1")+"-"+req.getParameter("month1")+"-"+req.getParameter("day1");
         String username1=req.getParameter("username1");
         System.out.println(username1+bar+userid);
         
         ArrayList<LoginDto> list = dao.searchpass(userid,bar,username1);
         
         req.setAttribute("passsearch", list);
          return "./login/search.jsp";   
      }
      return null;
   }
   
}