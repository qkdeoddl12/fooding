package model.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Db.DBConnecter;
import model.review.AppraisalDto;

public class ImageDao {
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DBConnecter pool = null;
	
	public ImageDao(){	
		try {
			pool = DBConnecter.getInstance();
			con = pool.getConnection();
			
		} catch (Exception e) {		
			e.printStackTrace();
		}
	}
	
	
	public int getImageCount(int foodNumber){	
		int count = 0;
		try {
			String sql = "select count(imageNumber) from imageInfo where foodNumber=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, foodNumber);
			rs = stmt.executeQuery();
		
			while(rs.next()){			
				/*ImageDto dto = new ImageDto();
				dto.setImageNumber(rs.getInt("ImageNumber"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));
				dto.setImageSrc(rs.getString("ImageSrc"));		*/	
				count = rs.getInt(0);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<ImageDto> getImage(int foodNumber){
		ArrayList<ImageDto> list = new ArrayList<>();
		try {
			String sql = "select * from imageInfo where foodNumber=?";
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, foodNumber);
			rs = stmt.executeQuery();
		
			while(rs.next()){		
				ImageDto dto = new ImageDto();
				dto.setImageNumber(rs.getInt("ImageNumber"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));
				dto.setImageSrc(rs.getString("ImageSrc"));			
				list.add(dto);
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
		
	}
	
	public void writeImage(String src){
		try {// insert into ImageInfo(FoodNumber, ImageSrc) values((select max(foodNumber) from foodinfo), 'аж╪р');
			String sql = "insert into ImageInfo(FoodNumber, ImageSrc) values(((select max(foodNumber) from foodinfo)+1), ?)";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, src);
			stmt.executeUpdate();
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
	}
}
