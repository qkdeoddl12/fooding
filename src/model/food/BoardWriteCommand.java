package model.food;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.Command;
import model.image.ImageDao;
import model.image.ImageDto;

public class BoardWriteCommand implements Command{

   /*
    *    FoodMenu   varchar(5000),
   FoodImg      blob,
   FoodStar   float,
   FoodServicePWTGBAD   varchar(50),

   FoodClickNumber   int 
    * 
    */
   @Override
   public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
      String savePath = req.getSession().getServletContext().getRealPath("/upload");         
       File f = new File(savePath);
        if (!f.exists()) { // ������ �������� ������ ���� ����           
            f.mkdirs();
        }
      MultipartRequest multi=new MultipartRequest(req, savePath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
      
       
      FoodInfoDto dto = new FoodInfoDto();      
      dto.setFoodStoreName(multi.getParameter("name"));   
      dto.setFoodType(multi.getParameter("type"));
      
      String[] time = multi.getParameterValues("time");
      if(time.length == 2)
         dto.setFoodTime(3); // ����, ���� üũ(����, ����:3)
      else{
         if(time[0].equals("����")){
            dto.setFoodTime(1); // ���ɸ� üũ(����:1)
         }else{
            dto.setFoodTime(2); // ���Ḹ üũ(����:2)
         }
      }   
      
      dto.setFoodPhoneNumber(multi.getParameter("tel1")+"-"+multi.getParameter("tel2")+"-"+multi.getParameter("tel3"));
      dto.setFoodAddr(multi.getParameter("address"));            
      dto.setfoodMenuPrice(Integer.parseInt(multi.getParameter("won")));
      
      String service = (multi.getParameter("park")!=null)?"1":"0";
      service += (multi.getParameter("wifi")!=null)?"1":"0";
      service += (multi.getParameter("toilet")!=null)?"1":"0";
      service += (multi.getParameter("group")!=null)?"1":"0";
      service += (multi.getParameter("book")!=null)?"1":"0";
      service += (multi.getParameter("athome")!=null)?"1":"0";
      service += (multi.getParameter("drive")!=null)?"1":"0";

      dto.setFoodServicePWTGBAD(service);
      
      Enumeration enumer = multi.getFileNames(); 
      while(enumer.hasMoreElements()){
         String name = (String)enumer.nextElement();         
         //System.out.println("���� ���ϸ� : " + multi.getFilesystemName(name) + "<br>"); // �ش� ������ �����ϴ� ���� ���� �̸� ����(�̸��� �ٲ� ���� ���ϸ�)      
         //System.out.println("���� Ÿ�� : " + multi.getContentType(name) + "<br>"); // ������ Ÿ��         
         /*File file = multi.getFile(name);         
         System.out.println("���ϰ��2 : " + file.getAbsolutePath());
         System.out.println("boardwritecommand.jara : " + multi.getFilesystemName(name));
         System.out.println(req.getPathInfo() + " pathinfo");
         System.out.println(req.getContextPath() + "contextpath");*/
         ImageDao dao = new ImageDao();         
         dao.writeImage(multi.getFilesystemName(name));         
         // dto.setFoodImg(multi.getFilesystemName(name));
         
      }
      
      dto.setFoodmenu(multi.getParameter("memu"));
      dto.setFoodContent(multi.getParameter("memo"));
      dto.setFoodAddrX(multi.getParameter("x"));
      dto.setFoodAddrY(multi.getParameter("y"));
      
      FoodInfoDao dao = new FoodInfoDao();
      dao.writeBoard(dto);
      System.out.println("����");

      return "food?cmd=board";

   }
   
}