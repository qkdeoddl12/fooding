package model.review;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.Command;
import model.food.FoodInfoDao;
import model.food.FoodInfoDto;

public class ReviewOneWriteCommand implements Command{

	@Override
	public Object processCommand(HttpServletRequest req, HttpServletResponse resp) throws SerialException, IOException {
		req.setCharacterEncoding("utf-8");
		String savePath = req.getSession().getServletContext().getRealPath("/upload_review");			
	    File f = new File(savePath);
        if (!f.exists()) { // 폴더가 존재하지 않으면 폴더 생성           
            f.mkdirs();
        }
		MultipartRequest multi=new MultipartRequest(req, savePath, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
		 	
		AppraisalDto dto = new AppraisalDto();		
		// dto.setUserNumber(); // 세션에서
		dto.setFoodNumber(Integer.parseInt(multi.getParameter("foodNumber")));
		dto.setAppraisalStar(Float.parseFloat(multi.getParameter("starrate")));
		dto.setAppraisalReply(multi.getParameter("content"));
		
		String names = "";
		Enumeration enumer = multi.getFileNames(); 
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			names += multi.getFilesystemName(name) + ";"; // 여러개 사진 ;로 구분
			
		}
		dto.setAppraisalImg(names);	
		
		
		
		HttpSession session = req.getSession();
		AppraisalDao dao = new AppraisalDao();
		dao.writeAppr(dto, (String)session.getAttribute("userId"));		
		
		FoodInfoDao foodDao = new FoodInfoDao();
		ArrayList<FoodInfoDto> foodList =  foodDao.selectBoardList();
		req.setAttribute("foodList", foodList);
		
		String foodNumber = multi.getParameter("foodNumber");
		return "review?cmd=board_content&foodNumber=" + foodNumber;
	}

}
