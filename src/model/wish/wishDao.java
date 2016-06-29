package model.wish;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import Db.DBConnecter;

public class wishDao {

	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DBConnecter pool = null;

	public wishDao() {
		try {
			pool = DBConnecter.getInstance();
			con = pool.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<wishDto> wishmain(String id) {
	
		ArrayList<wishDto> list = new ArrayList<wishDto>();

		try {

			String sql = "select b.BasketNumber, f.FoodStoreName, f.foodNumber from BaskeInfo b "
					+ "inner join userinfo u on u.userNumber=b.userNumber "
					+ "inner join foodinfo f on f.foodNumber=b.foodNumber where u.userId=" + "'" + id + "'";


			// 로그인 id에 usernumber를 뺀다음에 그 number의 가게명을 빼야함

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				wishDto wish = new wishDto();

				wish.setWishNumber(rs.getInt("b.BasketNumber"));
				wish.setWishName(rs.getString("f.FoodStoreName"));
				wish.setFoodNumber(rs.getInt("f.foodNumber"));
				
				list.add(wish);
			}
		} catch (Exception sqex) {
			System.out.println("SQLException: " + sqex.getMessage());
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		

		return list;
	}
	

	public boolean getWish(int foodNumber, int userNumber){
		boolean check = false;
		try {
			String sql = "select * from baskeinfo where foodNumber=? and userNumber=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, foodNumber);
			stmt.setInt(2, userNumber);
			rs = stmt.executeQuery();
			if(rs.next()){
				check = true;
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
		return check;
	}
	
	public boolean wishWrite(int foodNumber, int userNumber){
		boolean check = true;
		String sql = "insert into baskeinfo(userNumber, foodNumber) values(?, ?)";
		if(getWish(foodNumber, userNumber)){ // 이미 좋아요 했으면 취소! 
			sql = "delete from baskeinfo where usernumber=? and foodnumber=?";
			check = false;
		}
		try {			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, userNumber);
			stmt.setInt(2, foodNumber);
			stmt.executeUpdate();			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
		return check;
	}
	
	public HashMap<String, String> getWishInfo(int userNumber){
		HashMap<String, String> map = new HashMap<String, String>();
		try {
			String sql = "select * from baskeinfo where userNumber=?";
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, userNumber);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				map.put(rs.getString("FoodNumber"), "image/heartcheck.jpg");
			
			}		
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, stmt);
		}
		return map;
	}

}
