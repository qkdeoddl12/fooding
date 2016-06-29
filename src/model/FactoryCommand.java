package model;

import javax.sql.rowset.serial.SerialException;

import model.comment.CommentServlet;
import model.food.ApproveBookmarkCommand;
import model.food.BoardCommand;
import model.food.BoardContentCommand;
import model.food.BoardWriteCommand;
import model.food.BookingCommand;
import model.food.BookmarkCommand;
import model.food.DeleteBookmarkCommand;
import model.food.MyBookmarkCommand;
import model.food.NameBookingCommand;
import model.food.SearchBoardCommand;
import model.food.SearchCommand;
import model.login.CheckPasswordCommand;
import model.login.LoginCommand;
import model.login.LoginSearchCommand;
import model.login.LogindelCommand;
import model.login.RegisterCommand;
import model.login.UserEditCommand;
import model.review.ReviewOneListCommand;
import model.review.ReviewListWriteCommand;
import model.review.ReviewMyListCommand;
import model.review.ReviewAllListCommand;
import model.review.ReviewOneWriteCommand;
import model.wanted.WantedDelCommand;
import model.wanted.WantedEditCommand;
import model.wanted.WantedEditViewCommand;
import model.wanted.WantedListCommand;
import model.wanted.WantedReadCommand;
import model.wanted.WantedWriteCommand;
import model.wanted.WantedWriteViewCommand;
import model.wish.WishCommand;

public class FactoryCommand {
	private FactoryCommand(){}
	private static FactoryCommand instance = new FactoryCommand();
	
	public static FactoryCommand getInstance(){
		return instance;
	}
	
	public Command createCommand(String cmd){
		if(cmd.equals("board")){
			return new BoardCommand();
		}else if(cmd.equals("board_content")){
			return new BoardContentCommand();
		}else if(cmd.equals("board_write")){
			return new BoardWriteCommand();
		}else if(cmd.equals("login")){ 
		      return new LoginCommand();
		}
		
		else if(cmd.equals("review")){ // 전체 리뷰 리스트
			return new ReviewAllListCommand();
		}else if(cmd.equals("review_appr")){ // 하나의 리뷰 리스트
			return new ReviewOneListCommand();
		}else if(cmd.equals("review_write")){
			return new ReviewOneWriteCommand();
		}else if(cmd.equals("review_write_list")){
			return new ReviewListWriteCommand();
		}
		
		else if(cmd.equals("register")){
			return new RegisterCommand();
		} else if (cmd.equals("wishmain")) {
			return new WishCommand();
		}else if (cmd.equals("deletelogin")) {
			return new LogindelCommand();

		}else if(cmd.equals("search")){
			return new SearchCommand();
		}else if(cmd.equals("bookmark")){
			return new BookmarkCommand();
		}else if(cmd.equals("booking")){
			return new BookingCommand();
		}else if(cmd.equals("mybookmark")){
			return new MyBookmarkCommand();
		}else if(cmd.equals("search")){
			return new SearchCommand();
		}else if(cmd.equals("searchboard")){
			return new SearchBoardCommand();
		}else if(cmd.equals("deletebookmark")){
			return new DeleteBookmarkCommand();
		}else if(cmd.equals("name")){
			return new NameBookingCommand();
		}else if(cmd.equals("approve")){
			return new ApproveBookmarkCommand();
		}
		else if(cmd.equals("wanted")){
			return new WantedListCommand();
		}else if(cmd.equals("wantedread")){
			return new WantedReadCommand();
		}else if(cmd.equals("wanteddel")){
			return new WantedDelCommand();
		}else if(cmd.equals("wantededit")){
			return new WantedEditCommand();
		}else if(cmd.equals("wantedinsert")){
			return new WantedWriteCommand();
		}else if(cmd.equals("wantededitview")){
			return new WantedEditViewCommand();
		}else if(cmd.equals("wantedinsertview")){
		return new WantedWriteViewCommand();
	}
		
		else if(cmd.equals("check_password")){
			return new CheckPasswordCommand();
		}else if(cmd.equals("myreview")){
			return new ReviewMyListCommand();
		}
		
		else if(cmd.equals("edituser")){
			return new UserEditCommand();
		}
		 else if(cmd.equals("loginsearch")){
	         return new LoginSearchCommand();
	      }
	      else if(cmd.equals("searchid")){
	         return new LoginSearchCommand();
	      } 
		
		
		
		return null;
	}

}
