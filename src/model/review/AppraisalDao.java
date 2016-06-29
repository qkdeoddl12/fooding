package model.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Db.DBConnecter;
import model.login.LoginDao;

public class AppraisalDao {
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DBConnecter pool = null;
	
	public AppraisalDao(){	
		try {
			pool = DBConnecter.getInstance();
			con = pool.getConnection();
			
		} catch (Exception e) {		
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<AppraisalDto> selectApprAllList(){	
		ArrayList<AppraisalDto> list = new ArrayList<AppraisalDto>();		
		try {
			String sql = "select app.appraisalnumber, app.foodnumber, app.usernumber, app.appraisalstar, "
					+ "app.appraisalreply, app.appraisalimg, "
					+ "(select count(*) from CommentInfo where AppraisalNumber=app.appraisalnumber) commentCount "
					+ "from appraisalinfo app order by app.appraisalnumber desc";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
		
			while(rs.next()){			
				AppraisalDto dto = new AppraisalDto();
				dto.setAppraisalNumber(rs.getInt("AppraisalNumber"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));
				dto.setUserNumber(rs.getInt("UserNumber"));
				dto.setAppraisalStar(rs.getFloat("AppraisalStar"));
				dto.setAppraisalReply(rs.getString("AppraisalReply"));
				dto.setAppraisalImg(rs.getString("AppraisalImg"));						
				dto.setCommentCount(rs.getInt("commentCount"));
				dto.setUserId(new LoginDao().getUserId(dto.getUserNumber()));
				list.add(dto);			
				
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
	}
	
	public ArrayList<AppraisalDto> selectApprOneList(String foodNumber){	
		ArrayList<AppraisalDto> list = new ArrayList<AppraisalDto>();		
		try {
			String sql = "select app.appraisalnumber, app.foodnumber, app.usernumber, app.appraisalstar, "
					+ "app.appraisalreply, app.appraisalimg, "
					+ "(select count(*) from CommentInfo where AppraisalNumber=app.appraisalnumber) commentCount "
					+ "from appraisalinfo app where app.FoodNumber=? order by app.appraisalnumber desc";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, foodNumber);
			rs = stmt.executeQuery();
		
			while(rs.next()){			
				AppraisalDto dto = new AppraisalDto();
				dto.setAppraisalNumber(rs.getInt("AppraisalNumber"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));
				dto.setUserNumber(rs.getInt("UserNumber"));
				dto.setAppraisalStar(rs.getFloat("AppraisalStar"));
				dto.setAppraisalReply(rs.getString("AppraisalReply"));
				dto.setAppraisalImg(rs.getString("AppraisalImg"));						
				dto.setCommentCount(rs.getInt("commentCount"));	
				dto.setUserId(new LoginDao().getUserId(dto.getUserNumber()));
				list.add(dto);			
				
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
	}
	
	
	public ArrayList<AppraisalDto> selectAppr(String foodNumber){		
		ArrayList<AppraisalDto> list = new ArrayList<AppraisalDto>();
		
		try {
			String sql = "select app.appraisalnumber, app.foodnumber, app.usernumber, app.appraisalstar, app.appraisalreply, app.appraisalimg, "
					+ "(select count(*) from CommentInfo where AppraisalNumber=app.appraisalnumber) as commentCount "
					+ "from AppraisalInfo app where foodNumber=? order by app.appraisalnumber desc";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, foodNumber);
			rs = stmt.executeQuery();
		
			while(rs.next()){							
				AppraisalDto dto = new AppraisalDto();
				dto.setAppraisalNumber(rs.getInt("AppraisalNumber"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));
				dto.setUserNumber(rs.getInt("UserNumber"));
				dto.setAppraisalStar(rs.getFloat("AppraisalStar"));
				dto.setAppraisalReply(rs.getString("AppraisalReply"));
				dto.setAppraisalImg(rs.getString("appraisalImg"));			
				dto.setCommentCount(rs.getInt("commentCount"));	
				dto.setUserId(new LoginDao().getUserId(dto.getUserNumber()));
				list.add(dto);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
	}
	
	public void writeAppr(AppraisalDto dto, String userId){
		try {
			String sql = "insert into AppraisalInfo(FoodNumber, UserNumber, AppraisalStar, AppraisalReply, AppraisalImg)"
					+ " values(?,(select UserNumber from UserInfo where UserId=?),?,?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, dto.getFoodNumber());
			// stmt.setInt(2, dto.getUserNumber()); // 세션에서 바꾸기
			
			stmt.setString(2, userId);
			stmt.setFloat(3, dto.getAppraisalStar());
			stmt.setString(4, dto.getAppraisalReply());
			stmt.setString(5, dto.getAppraisalImg());		
			stmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt);
		}
	}
	
	public float getAvgStar(int foodNumber){
		float avgStar = 0;
		try {
			String sql = "select foodnumber, avg(AppraisalStar) from appraisalinfo where foodnumber=? group by foodnumber";
			stmt = con.prepareStatement(sql);			
			stmt.setInt(1, foodNumber);
			rs = stmt.executeQuery();
			if(rs.next()){
				avgStar = rs.getFloat(2);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return avgStar;
	}
	
	public ArrayList<AppraisalDto> getMyAppr(int userNumber){
		ArrayList<AppraisalDto> list = new ArrayList<AppraisalDto>();		
		try {
			String sql = "select app.appraisalnumber, app.foodnumber, app.usernumber, app.appraisalstar, "
					+ "app.appraisalreply, app.appraisalimg, "
					+ "(select count(*) from CommentInfo where AppraisalNumber=app.appraisalnumber) commentCount "
					+ "from appraisalinfo app where userNumber=? order by app.appraisalnumber desc";
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, userNumber);
			rs = stmt.executeQuery();
		
			while(rs.next()){			
				AppraisalDto dto = new AppraisalDto();
				dto.setAppraisalNumber(rs.getInt("AppraisalNumber"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));
				dto.setUserNumber(rs.getInt("UserNumber"));
				dto.setAppraisalStar(rs.getFloat("AppraisalStar"));
				dto.setAppraisalReply(rs.getString("AppraisalReply"));
				dto.setAppraisalImg(rs.getString("AppraisalImg"));						
				dto.setCommentCount(rs.getInt("commentCount"));	
				dto.setUserId(new LoginDao().getUserId(dto.getUserNumber()));
				list.add(dto);			
				
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
	}
	
	
}
