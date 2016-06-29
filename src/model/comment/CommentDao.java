package model.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import Db.DBConnecter;

public class CommentDao {
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DBConnecter pool = null;
	
	public CommentDao(){	
		try {
			pool = DBConnecter.getInstance();
			con = pool.getConnection();
			
		} catch (Exception e) {		
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<CommentDto> selectCommentList(int apprNumber){	
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();		
		try {
			String sql = "select * from CommentInfo where AppraisalNumber=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, apprNumber);
			rs = stmt.executeQuery();
			while(rs.next()){			
				CommentDto dto = new CommentDto();
				dto.setCommentNumber(rs.getInt("CommentNumber"));				
				dto.setAppraisalNumber(rs.getInt("AppraisalNumber"));
				dto.setUserNumber(rs.getInt("UserNumber"));
				dto.setCommentContent(rs.getString("CommentContent"));						
				list.add(dto);			
				
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt, rs);
		}
		return list;
	}
	
	public void writeComment(CommentDto dto){		
		try {
			String sql = "insert into commentinfo(CommentNumber, AppraisalNumber, UserNumber, CommentContent) "
					+ " values(?,?, ?, ?)";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, dto.getCommentNumber());
			stmt.setInt(2, dto.getAppraisalNumber());
			stmt.setInt(3, dto.getUserNumber()); // 세션에서 바꾸기
			stmt.setString(4, dto.getCommentContent());
			stmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
	}
	
	public void deleteComment(int commentNumber){
		try {
			String sql = "delete from commentinfo where commentnumber=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, commentNumber);
			stmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
	}
}
