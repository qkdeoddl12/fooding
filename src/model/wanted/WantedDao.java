package model.wanted;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Db.DBConnecter;
import model.login.LoginDao;
import model.review.AppraisalDto;

public class WantedDao {
	
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DBConnecter pool = null;

	public WantedDao() {
		try {
			pool = DBConnecter.getInstance();
			con = pool.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<WantedDto> selectList(){
		ArrayList<WantedDto> list = new ArrayList<WantedDto>();		
		try {
			String sql = "select * from wantedInfo order by wantedGroupNumber desc, wantedGroupDepth";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
		
			while(rs.next()){			
				WantedDto dto = new WantedDto();
				dto.setUserNumber(rs.getInt("userNumber"));
				dto.setWantedContent(rs.getString("wantedContent"));
				dto.setWantedGroupDepth(rs.getInt("wantedGroupDepth"));
				dto.setWantedGroupNumber(rs.getInt("wantedGroupNumber"));
				dto.setWantedHit(rs.getInt("wantedHit"));
				dto.setWantedNumber(rs.getInt("wantedNumber"));
				dto.setWantedTime(rs.getString("wantedTime"));
				dto.setWantedTitle(rs.getString("wantedTitle"));							
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
	
	public WantedDto selectOne(int wantedNumber){
		WantedDto dto = new WantedDto();
		try {
			String sql = "select * from wantedInfo where wantedNumber=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, wantedNumber);
			rs = stmt.executeQuery();
		
			if(rs.next()){			
				dto.setUserNumber(rs.getInt("userNumber"));
				dto.setWantedContent(rs.getString("wantedContent"));
				dto.setWantedGroupDepth(rs.getInt("wantedGroupDepth"));
				dto.setWantedGroupNumber(rs.getInt("wantedGroupNumber"));
				dto.setWantedHit(rs.getInt("wantedHit"));
				dto.setWantedNumber(rs.getInt("wantedNumber"));
				dto.setWantedTime(rs.getString("wantedTime"));
				dto.setWantedTitle(rs.getString("wantedTitle"));			
				dto.setUserId(new LoginDao().getUserId(dto.getUserNumber()));

			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return dto;
	}
	
	public void delete(int wantedNumber){
		try {
			String sql = "delete from wantedInfo where wantedNumber=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, wantedNumber);
			stmt.executeUpdate();		
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt);
		}
	}
	
	public void insert(WantedDto dto){ // Ãß°¡
		try {
			String sql = "insert into wantedInfo(userNumber, wantedTitle, wantedContent, wantedGroupNumber, wantedGroupDepth) "
					+ "values(?, ?, ?, ?, ?)";
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, dto.getUserNumber());
			stmt.setString(2, dto.getWantedTitle());
			stmt.setString(3, dto.getWantedContent());
			stmt.setInt(4, dto.getWantedGroupNumber());
			stmt.setInt(5, dto.getWantedGroupDepth());
			stmt.executeUpdate();		
			
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt);
		}
	}
	
	public void update(WantedDto dto){
		try {
			String sql = "update wantedInfo set wantedTitle=?, wantedContent=? where wantedNumber=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getWantedTitle());
			stmt.setString(2, dto.getWantedContent());
			stmt.setInt(3, dto.getWantedNumber());
			stmt.executeUpdate();		
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt);
		}
	}
	
	
	public int getMaxwantedNumber(){
		int max = 0;
		try {
			String sql = "select max(wantedNumber)+1 from wantedInfo";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()){
				max = rs.getInt(1);
			}
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt);
		}
		return max;
	}
	
	public int getTotal(){
		int totalRecord = 0;
		try {
			String sql = "select count(wantedNumber) from wantedInfo";
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			if(rs.next()){
				totalRecord = rs.getInt(1);
			}
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt);
		}
		return totalRecord;
	}

	
	
}
