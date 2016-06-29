package model.login;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;

public class LogindelCommand implements Command{

   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {    
       	 HttpSession session = req.getSession();
          session.removeAttribute("emaillogin");
          session.invalidate();
        	    
         return "index.jsp";
            
      }
   }
   
   