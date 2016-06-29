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
       
       System.out.println("서치커멘드");
       LoginDao dao = new LoginDao();
      
      
      String userid=req.getParameter("userid");
      String username=req.getParameter("username2");
      System.out.println(userid);
      

      if((username== null) && (userid==null)){ //그냥 이동
         System.out.println("다 널이다");
           return "./login/search.jsp";
      }
      else if(userid==""){// 아디찾기 이동
         System.out.println("아디 찾을거야");
         String username2=req.getParameter("username2");
         String tel=req.getParameter("tel1")+req.getParameter("tel2")+req.getParameter("tel3");
         String bar=req.getParameter("year")+"-"+req.getParameter("month")+"-"+req.getParameter("day");
         System.out.println(username2+tel+bar);
         
         ArrayList<LoginDto> list = dao.search(username2,tel,bar);
         
         
         req.setAttribute("idsearch", list);
         
          return "./login/search.jsp";
      }
      else if(userid !=""){//비번찾기 이동
         System.out.println("비번 찾을거야");
         
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