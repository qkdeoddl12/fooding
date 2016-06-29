package model.food;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Db.DBConnecter;
import model.image.ImageDao;
import model.review.AppraisalDao;

public class FoodInfoDao {
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	DBConnecter pool = null;

	public FoodInfoDao() {
		try {
			pool = DBConnecter.getInstance();
			con = pool.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<FoodInfoDto> selectBoardList() {
		ArrayList<FoodInfoDto> list = new ArrayList<FoodInfoDto>();
		try {
			String sql = "select * from FoodInfo order by foodNumber desc";

			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				FoodInfoDto dto = new FoodInfoDto();
				dto.setFoodmenu(rs.getString("FoodMenu"));
				dto.setFoodPhoneNumber(rs.getString("FoodPhoneNumber"));
				dto.setFoodAddr(rs.getString("FoodAddr"));

				dto.setFoodType(rs.getString("FoodType"));
				dto.setFoodTime(rs.getInt("FoodTime"));
				dto.setfoodMenuPrice(rs.getInt("FoodMenuPrice"));

				dto.setFoodStoreName(rs.getString("FoodStoreName"));
				dto.setFoodContent(rs.getString("FoodContent"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));

				ImageDao dao = new ImageDao();
				dto.setFoodImg(dao.getImage(dto.getFoodNumber()));
				
				dto.setFoodStar(new AppraisalDao().getAvgStar(dto.getFoodNumber()));
				dto.setFoodServicePWTGBAD(rs.getString("FoodServicePWTGBAD"));

				dto.setFoodClickNumber(rs.getInt("FoodClickNumber"));
				dto.setFoodAddrX(rs.getString("FoodAddrX"));
				dto.setFoodAddrY(rs.getString("FoodAddrY"));

				list.add(dto);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
	}
	public ArrayList<FoodInfoDto> selectBookingList(int num) {
		ArrayList<FoodInfoDto> list = new ArrayList<FoodInfoDto>();
		try {
			String sql = "select * from bookingInfo where usernumber="+num;
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				FoodInfoDto dto = new FoodInfoDto();
				dto.setBookingNum(rs.getInt("bookingNum"));
				dto.setBookingName(rs.getString("bookingName"));
				dto.setBookingPhone(rs.getString("bookingPhone"));
				dto.setBookingTime(rs.getString("bookingTime"));
				dto.setBookingDemand(rs.getString("bookingDemand"));
				dto.setBookingGroup(rs.getInt("bookingGroup"));
				dto.setFoodStoreName(rs.getString("foodStoreName"));
				dto.setFoodNumber(rs.getInt("foodNumber"));
				dto.setBookingApprove(rs.getString("bookingApprove"));
				System.out.println(rs.getString("bookingApprove"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
	}
	public FoodInfoDto selectBoard(String foodNumber) {
		FoodInfoDto dto = new FoodInfoDto();
		try {
			String sql = "select * from FoodInfo where foodNumber=?";

			stmt = con.prepareStatement(sql);
			stmt.setString(1, foodNumber);
			rs = stmt.executeQuery();

			while (rs.next()) {

				dto.setFoodmenu(rs.getString("FoodMenu"));
				dto.setFoodPhoneNumber(rs.getString("FoodPhoneNumber"));
				dto.setFoodAddr(rs.getString("FoodAddr"));

				dto.setFoodType(rs.getString("FoodType"));
				dto.setFoodTime(rs.getInt("FoodTime"));
				dto.setfoodMenuPrice(rs.getInt("FoodMenuPrice"));

				dto.setFoodStoreName(rs.getString("FoodStoreName"));
				dto.setFoodContent(rs.getString("FoodContent"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));

				ImageDao dao = new ImageDao();
				dto.setFoodImg(dao.getImage(dto.getFoodNumber()));
				dto.setFoodStar(new AppraisalDao().getAvgStar(dto.getFoodNumber()));
				dto.setFoodServicePWTGBAD(rs.getString("FoodServicePWTGBAD"));

				dto.setFoodClickNumber(rs.getInt("FoodClickNumber"));
				dto.setFoodAddrX(rs.getString("FoodAddrX"));
				dto.setFoodAddrY(rs.getString("FoodAddrY"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return dto;
	}

	public void writeBoard(FoodInfoDto dto) {
		try {
			String sql = "insert into FoodInfo(FoodStoreName, FoodType, FoodTime, FoodPhoneNumber, FoodAddr,"
					+ " FoodMenuPrice, FoodServicePWTGBAD, FoodMenu, FoodContent, FoodAddrX, FoodAddrY) "
					+ " values(?,?,?,?,?, ?,?,?,?, ?,?)";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getFoodStoreName());
			stmt.setString(2, dto.getFoodType());
			stmt.setInt(3, dto.getFoodTime());
			stmt.setString(4, dto.getFoodPhoneNumber());
			stmt.setString(5, dto.getFoodAddr());

			stmt.setInt(6, dto.getfoodMenuPrice());
			stmt.setString(7, dto.getFoodServicePWTGBAD());
			stmt.setString(8, dto.getFoodmenu());
			stmt.setString(9, dto.getFoodContent());
			
			stmt.setString(10, dto.getFoodAddrX());
			stmt.setString(11, dto.getFoodAddrY());

			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
	}

	public FoodInfoDto selectName(int num) {
		FoodInfoDto dto = new FoodInfoDto();
		try {
			String sql = "select FoodStoreName from FoodInfo where foodNumber=" + num;
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {

				dto.setFoodStoreName(rs.getString("FoodStoreName"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return dto;
	}

	public void writeBooking(FoodInfoDto list) {

		try {
			System.out.println(list.getBookingGroup()+"인원수");
			String sql = "insert into bookingInfo(bookingnum,bookingname,bookingphone,bookingtime,bookinggroup,bookingdemand,bookingapprove,foodnumber,foodstorename,usernumber) "
					+ "values(bookingNum,?,?,?,?,?,0,?,?,?)";
			System.out.println(sql);
			stmt = con.prepareStatement(sql);

			stmt.setString(1, list.getBookingName());
			stmt.setString(2, list.getBookingPhone());
			stmt.setString(3, list.getBookingTime());
			stmt.setInt(4, list.getBookingGroup());
			stmt.setString(5, list.getBookingDemand());
			stmt.setInt(6, list.getFoodNumber());
			stmt.setString(7, list.getFoodStoreName());
			stmt.setInt(8, list.getUserNum());
			

			stmt.executeUpdate();
			rs = stmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
	}

	public void deleteBooking(int num) {

		try {
			System.out.println(num);
			String sql = "delete from bookinginfo where bookingNum=" + num;
			stmt = con.prepareStatement(sql);

			System.out.println(sql);

			stmt.executeUpdate();
			// rs = stmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
	}

	public void approveBooking(int num) {

		try {
			System.out.println(num);
			String sql = "update bookinginfo set bookingApprove=1 where bookingNum=" + num;
			stmt = con.prepareStatement(sql);

			System.out.println(sql);

			stmt.executeUpdate();
			// rs = stmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
	}

	public ArrayList<FoodInfoDto> selectBookingList() {
		ArrayList<FoodInfoDto> list = new ArrayList<FoodInfoDto>();
		try {
			String sql = "select * from bookingInfo";
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				FoodInfoDto dto = new FoodInfoDto();
				dto.setBookingNum(rs.getInt("bookingNum"));
				dto.setBookingName(rs.getString("bookingName"));
				dto.setBookingPhone(rs.getString("bookingPhone"));
				dto.setBookingTime(rs.getString("bookingTime"));
				dto.setBookingDemand(rs.getString("bookingDemand"));
				dto.setFoodStoreName(rs.getString("foodStoreName"));
				dto.setBookingGroup(rs.getInt("bookingGroup"));
				dto.setFoodNumber(rs.getInt("foodNumber"));
				dto.setBookingApprove(rs.getString("bookingApprove"));
				System.out.println(rs.getString("bookingApprove"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
	}

	public ArrayList<FoodInfoDto> searchBoardList(String search,String type) {
		ArrayList<FoodInfoDto> list = new ArrayList<FoodInfoDto>();

		try {
			String sql = null;
			if(search.isEmpty()){
				sql = "select * from Foodinfo";
			
			}else if(type.equals("매장명")){
			sql = "select * from foodInfo where FoodStoreName like '%" + search + "%'";
			}else if(type.equals("지역명")){
				sql = "select * from foodInfo where FoodAddr like '%" + search + "%'";
			}
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				FoodInfoDto dto = new FoodInfoDto();
				dto.setFoodmenu(rs.getString("FoodMenu"));
				dto.setFoodPhoneNumber(rs.getString("FoodPhoneNumber"));
				dto.setFoodAddr(rs.getString("FoodAddr"));

				dto.setFoodType(rs.getString("FoodType"));
				dto.setFoodTime(rs.getInt("FoodTime"));
				dto.setfoodMenuPrice(rs.getInt("FoodMenuPrice"));

				dto.setFoodStoreName(rs.getString("FoodStoreName"));
				dto.setFoodContent(rs.getString("FoodContent"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));

				ImageDao dao = new ImageDao();
				dto.setFoodImg(dao.getImage(dto.getFoodNumber()));
				dto.setFoodStar(new AppraisalDao().getAvgStar(dto.getFoodNumber()));
				dto.setFoodServicePWTGBAD(rs.getString("FoodServicePWTGBAD"));

				dto.setFoodClickNumber(rs.getInt("FoodClickNumber"));
				dto.setFoodAddrX(rs.getString("FoodAddrX"));
				dto.setFoodAddrY(rs.getString("FoodAddrY"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,stmt,rs);
		}
		return list;
	}

	public ArrayList<FoodInfoDto> checkBoardList(int check, String[] type, int slider_start, int slider_end, String searchType,String search) {
		ArrayList<FoodInfoDto> list = new ArrayList<FoodInfoDto>();
		String[] typelist = type;
		try {
			String checkSql = check + "";
			System.out.println("check : " + check);
			if(check == 1 || check == 2){
				checkSql = check + " or foodtime = 3 ";
			}
			System.out.println("type length :" + type.length);
			// System.out.println(type.length+"dao"+type[0]+","+type[1]+","+type[2]+","+type[3]);
			String sql = null;

			System.out.println("select * from foodInfo where Foodtime=" + checkSql + " and foodtype in ('" + type[0]
					+ "','" + type[1] + "','" + type[2] + "','" + type[3] + "') and " + searchType + " like '%"+search+"%'");

			if (check == 0 && type[0].equals("1")) {
				sql = "select * from Foodinfo where " + searchType + " like '%"+search+"%' and foodMenuPrice between " + slider_start + " and " + slider_end;
			} else if (type[0].equals("1")) {
				sql = "select * from foodInfo where Foodtime=" + checkSql + " and " + searchType + " like '%"+search+"%' and foodMenuPrice between " + slider_start + " and " + slider_end;
			} else if (check == 0) {
				sql = "select * from foodInfo where foodtype in ('" + type[0] + "','" + type[1] + "','" + type[2]
						+ "','" + type[3] + "') and  " + searchType + "  like '%"+search+"%' and foodMenuPrice between " + slider_start + " and " + slider_end;

			} else {
				// sql = "select * from foodInfo where Foodtime="+check;
				sql = "select * from foodInfo where Foodtime=" + checkSql + " and foodtype in ('" + type[0] + "','"
						+ type[1] + "','" + type[2] + "','" + type[3] + "') and  " + searchType + " like '%"+search+"%' and foodMenuPrice between " + slider_start + " and " + slider_end;// select
																				// *
																				// from
																				// foodInfo
																				// where
																				// Foodtime=1
																				// and
																				// foodtype
																				// in
																				// ('중식','한식','','')
			}
			System.out.println(sql);
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();

			while (rs.next()) {
				FoodInfoDto dto = new FoodInfoDto();
				dto.setFoodmenu(rs.getString("FoodMenu"));
				dto.setFoodPhoneNumber(rs.getString("FoodPhoneNumber"));
				dto.setFoodAddr(rs.getString("FoodAddr"));

				dto.setFoodType(rs.getString("FoodType"));
				dto.setFoodTime(rs.getInt("FoodTime"));
				dto.setfoodMenuPrice(rs.getInt("FoodMenuPrice"));

				dto.setFoodStoreName(rs.getString("FoodStoreName"));
				dto.setFoodContent(rs.getString("FoodContent"));
				dto.setFoodNumber(rs.getInt("FoodNumber"));

				ImageDao dao = new ImageDao();
				dto.setFoodImg(dao.getImage(dto.getFoodNumber()));
				dto.setFoodStar(new AppraisalDao().getAvgStar(dto.getFoodNumber()));
				dto.setFoodServicePWTGBAD(rs.getString("FoodServicePWTGBAD"));

				dto.setFoodClickNumber(rs.getInt("FoodClickNumber"));
				dto.setFoodAddrX(rs.getString("FoodAddrX"));
				dto.setFoodAddrY(rs.getString("FoodAddrY"));

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
