package model.food;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import model.Command;
import model.wish.wishDao;

public class SearchBoardCommand implements Command {

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		System.out.println("서ㅂ치벋,커맨드");

		String[] time = req.getParameterValues("foodtime");
		int sum = 0;
		String[] typelist = { "1", "", "", "" };
		String[] type = req.getParameterValues("foodtype");
		String search = req.getParameter("searchtext_hidden");
		String searchType = req.getParameter("searchType_hidden");
		System.out.println(search + "검색어");

		int slider_start = Integer.parseInt(req.getParameter("slider_start"));
		int slider_end = Integer.parseInt(req.getParameter("slider_end"));

		if (time != null) {
			for (String s : time) {

				sum += (Integer.parseInt(s));
			}

		}
		System.out.println(sum);
		try {
			System.out.println(type.length);
			if (type.length != 0) {
				int result = typelist.length - type.length;
				if (result == 3) {
					typelist[0] = type[0];

				} else if (type != null) {
					for (int i = 0; i < type.length; i++) {

						typelist[i] = type[i];

					}

				} else {
					System.out.println("null입니다");
				}
				for (String s : typelist) {
					System.out.println(s + "타입");
				}
			}
		} catch (Exception e) {
			System.out.println("error : " + e);
		}
		// 좋아요 표시하기 위해서
				HttpSession session = req.getSession();
				try{
					int userNumber = (Integer)session.getAttribute("userNumber");
					wishDao wishdao = new wishDao();
					HashMap<String, String> likeMap = wishdao.getWishInfo(userNumber);
					req.setAttribute("likeMap",  likeMap);		
					System.out.println("좋아용 ㅌ리아 "  + likeMap.size());
				}catch(NullPointerException e){
					e.printStackTrace();
				}
		FoodInfoDao dao = new FoodInfoDao();
		ArrayList<FoodInfoDto> Boardlist = dao.checkBoardList(sum, typelist, slider_start, slider_end, searchType, search);
		req.setAttribute("Boardlist", Boardlist);
		req.setAttribute("searchtext", search);
		req.setAttribute("searchType", searchType);
		req.setAttribute("slider_start", slider_start);
		req.setAttribute("slider_end", slider_end);
		req.setAttribute("typelist", typelist);
		req.setAttribute("time", time);

		return "front?cmd=board";
	}

}
