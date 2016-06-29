package model.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import Db.DBConnecter;
import model.wish.wishDto;

public class LoginDao {

   Connection con = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   DBConnecter pool = null;

   public LoginDao() {
      try {
         pool = DBConnecter.getInstance();
         con = pool.getConnection();

      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   public boolean writeBoard(ArrayList<LoginDto> list) {
      boolean re = false;

      try {
         String sql = "select * from userInfo where UserId=" + "'" + list.get(0).getUserId() + "' and UserPassword="
               + "'" + list.get(0).getUserPassword() + "'";
         stmt = con.prepareStatement(sql);
         rs = stmt.executeQuery();
         System.out.println("3: " + sql);

         if (rs.next() == false) {
            System.out.println("실패");
            re = false;
         } else {
            System.out.println("성공");
            re = true;
         }

      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con,stmt,rs);
      }
      return re;
   }

   public void userRegister(ArrayList<LoginDto> list) {
      try {
         String sql = "insert into UserInfo(UserId, UserPassword, UserAuthority, UserName, UserBirthDaty, UserAddr, UserPhoneNumber,UserEmail) values(?,?,1,?,?,?,?,?)";

         stmt = con.prepareStatement(sql);
         System.out.println("회원가입: " + sql);
         
         stmt.setString(1, list.get(0).getUserId());
         stmt.setString(2, list.get(0).getUserPassword());
         stmt.setString(3, list.get(0).getUserName());
         stmt.setString(4, list.get(0).getUserBirthDaty());
         stmt.setString(5, list.get(0).getUserAddr());
         stmt.setString(6, list.get(0).getUserPhoneNumber());
         stmt.setString(7, list.get(0).getUserEmail());

         stmt.executeUpdate();

         System.out.println("실행: ");

      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con,stmt,rs);
      }

   }

   
   public String getUserId(int userNumber){
      String userid = null;
      try {
         String sql = "select userId from userInfo where userNumber=?";
      
         stmt = con.prepareStatement(sql);         
         stmt.setInt(1, userNumber);
           rs = stmt.executeQuery();
           if(rs.next()){
              userid = rs.getString("userId");              
           }
      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con,stmt,rs);
      }
      
      return userid;
   }
   
   public int getUserNumber(String userId){
      int userNumber = 0;
      try {
         String sql = "select userNumber from userInfo where userId=?";
      
         stmt = con.prepareStatement(sql);         
         stmt.setString(1, userId);
           rs = stmt.executeQuery();
           if(rs.next()){
              userNumber = rs.getInt("userNumber");              
           }
      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con,stmt,rs);
      }
      System.out.println("체크할떄 : " + userNumber);
      return userNumber;
   }
   
   public boolean checkPwd(String userid, String password){
      boolean check = false;
      try {
         String sql = "select * from userInfo where userId=? and userPassword=?";
      
         stmt = con.prepareStatement(sql);         
         stmt.setString(1, userid);
         stmt.setString(2, password);
           rs = stmt.executeQuery();
           if(rs.next()){
              check = true;              
           }
      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con,stmt,rs);
      }
      return check;
   }
   
   public LoginDto getUser(int userNumber){
      LoginDto dto = new LoginDto();
      try {
         String sql = "select * from userInfo where userNumber=?";
      
         stmt = con.prepareStatement(sql);         
         stmt.setInt(1, userNumber);
           rs = stmt.executeQuery();
           
           if(rs.next()){
              dto.setUserAddr(rs.getString("useraddr"));
              dto.setUserAuthority(rs.getBoolean("userauthority"));
              dto.setUserBirthDaty(rs.getString("userbirthdaty"));
              dto.setUserEmail(rs.getString("useremail"));
              dto.setUserId(rs.getString("userid"));
              dto.setUserName(rs.getString("username"));
              dto.setUserNumber(userNumber);
              dto.setUserPassword(rs.getString("userpassword"));
              dto.setUserPhoneNumber(rs.getString("userphoneNumber"));
           } 
      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con,stmt,rs);
      }
      return dto;
   }
   
   public int getUserAtho(int userNumber){
	      int authority = 0;
	      try {
	         String sql = "select userAuthority from userInfo where userNumber=?";
	      
	         stmt = con.prepareStatement(sql);         
	         stmt.setInt(1, userNumber);
	           rs = stmt.executeQuery();
	           
	           if(rs.next()){
	        	   authority = rs.getInt("userAuthority");
	           } 
	      } catch (Exception sqex) {
	         System.out.println("SQLException: " + sqex.getMessage());
	      }finally{
	         pool.freeConnection(con,stmt,rs);
	      }
	      return authority;
	   }
   
   public void editUser(LoginDto dto){
      try {
         String sql = "update userinfo set  UserPassword=?, UserName=?, UserBirthDaty=?, "
               + "UserAddr=?, UserPhoneNumber=?, UserEmail=? "
               + "where UserNumber=?";
      
         stmt = con.prepareStatement(sql);         
         stmt.setString(1, dto.getUserPassword());
         stmt.setString(2, dto.getUserName());
         stmt.setString(3, dto.getUserBirthDaty());
         stmt.setString(4, dto.getUserAddr());
         stmt.setString(5, dto.getUserPhoneNumber());
         stmt.setString(6, dto.getUserEmail());
         stmt.setInt(7, dto.getUserNumber());
           stmt.executeUpdate();           
         
      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con, stmt);
      }      
   }
   
   public ArrayList<LoginDto> search(String username, String tel, String bar){
      ArrayList<LoginDto> list = new ArrayList<LoginDto>();
      
      try {      
         LoginDto dto = new LoginDto();
         String sql = "select UserId from userinfo where username=? and UserBirthDaty=? and UserPhoneNumber=?";
      
         stmt = con.prepareStatement(sql);         
         stmt.setString(1,username);
         stmt.setString(2,bar);
         stmt.setString(3,tel);
           rs = stmt.executeQuery();
           
           System.out.println(sql);
           
           
           while (rs.next()) {
            System.out.println("안에는 들어와?");
            dto.setUserId(rs.getString("userid"));
            list.add(dto);
           }
           
           //System.out.println(" 7: " + list + list.get(0).getUserId());
           
   
      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con, stmt);
      }
      return list;
   }
   
   
   public ArrayList<LoginDto> searchpass(String  userid, String tel, String username){
      ArrayList<LoginDto> list = new ArrayList<LoginDto>();
      try {      
         System.out.println("여기는 오냐22");
         LoginDto dto = new LoginDto();
         String sql = "select UserPassword,UserId from userinfo where userid=? and UserBirthDaty=? and UserName=?";
      
         System.out.println(userid+tel+username);
         stmt = con.prepareStatement(sql);         
         stmt.setString(1,userid);
         stmt.setString(2,tel);
         stmt.setString(3,username);
           rs = stmt.executeQuery();
           
           System.out.println(sql);
           
           while(rs.next()){
           dto.setUserPassword(rs.getString("userpassword"));
           list.add(dto);     
           System.out.println(" 7: " + list+ list.get(0).getUserPassword());
           }
           


                       
      } catch (Exception sqex) {
         System.out.println("SQLException: " + sqex.getMessage());
      }finally{
         pool.freeConnection(con, stmt);
      }
      return list;
   }
   
   

}