package com.semi.reservation.model.dao;

import static com.semi.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.semi.reservation.model.vo.Reservation;


public class ReservationDao {
	
	 private Properties prop;
	   
	   public ReservationDao(){
	  prop = new Properties();
      String filePath = ReservationDao.class
                   .getResource("/config/reservation_query.properties").getPath();
      
      try {
	         prop.load(new FileReader(filePath));
	         
	      }catch(FileNotFoundException e) {
	         e.printStackTrace();
	      }catch(IOException e) {
	         e.printStackTrace();
	      }
}

	public ArrayList<Reservation> selectList(Connection con) {
		
	ArrayList<Reservation> list = new ArrayList<>();
	Statement stmt = null;
	ResultSet rset = null;
	
	String sql = prop.getProperty("selectMovie");
	
	try {
		stmt = con.createStatement();
        rset = stmt.executeQuery(sql);
        
        System.out.println("다오도 오긴옴!?????");
        while(rset.next()) {
           Reservation r = new Reservation();
           
           r.setRmovie(rset.getString("MOVIE_TITLE"));
           r.setRageLimit(rset.getString("AGELIMIT"));
        
           list.add(r);
           System.out.println(list);
        }
	  }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(stmt);
	      }
		
		return list;
	}


	public ArrayList<Reservation> selectAbcList(Connection con) {

		ArrayList<Reservation> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAbcMovie");
		
		try {
			stmt = con.createStatement();
	        rset = stmt.executeQuery(sql);
	        
	        System.out.println("다오도 오긴옴!");
	        while(rset.next()) {
	           Reservation r = new Reservation();
	           
	           r.setRmovie(rset.getString("MOVIE_TITLE"));
	           r.setRageLimit(rset.getString("AGELIMIT"));
	        
	           list.add(r);
			
	        }
		  }catch(SQLException e) {
		         e.printStackTrace();
		      }finally {
		         close(rset);
		         close(stmt);
		      }
			
			return list;
		
	
	}

	

	public ArrayList<Reservation> searchCinema(Connection con, String search) {
		
		ArrayList<Reservation> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchCinema");
		
		try {
			 pstmt = con.prepareStatement(sql);
	         pstmt.setString(1,search);
	         
	         rset = pstmt.executeQuery();
	        
	        System.out.println("서치도 다오 오긴옴!");
	        while(rset.next()) {
	           Reservation r = new Reservation();
	           
	           r.setRcinema(rset.getString("CINEMA_NAME"));
	           
	        
	           list.add(r);
	System.out.println(list);
	        }
		  }catch(SQLException e) {
		         e.printStackTrace();
		      }finally {
		    	  close(rset);
		          close(pstmt);
		      }
			
			return list;
		
	}

	public ArrayList<Reservation> searchTime(Connection con) {
		
		ArrayList<Reservation> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchTime");
		
		try {
			stmt = con.createStatement();
	        rset = stmt.executeQuery(sql);
	        
	        System.out.println("시간표도 오긴옴!?????");
	        while(rset.next()) {
	           Reservation r = new Reservation();
	           
	           
	           r.setRshowtime(rset.getString("START_TIME"));
	           
	        
	           list.add(r);
	           System.out.println(list);
	        }
		  }catch(SQLException e) {
		         e.printStackTrace();
		      }finally {
		    	  close(rset);
		          close(stmt);
		      }
			
			return list;
	}

	public ArrayList<Reservation> searchImage(Connection con, String movie) {
		
		ArrayList<Reservation> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchImage");
		System.out.println("하이루" + movie);
		try {
			 pstmt = con.prepareStatement(sql);
	         pstmt.setString(1,movie);
	         
	         rset = pstmt.executeQuery();
	        
	        System.out.println("이미지 찾기도 다오 오긴옴!");
	        while(rset.next()) {
	           Reservation r = new Reservation();
	           
	           r.setRmovie(rset.getString("MOVIE_TITLE"));
	           r.setRimage(rset.getString("POSTERPATH"));
	           
	        
	           list.add(r);
	         
	        }
		  }catch(SQLException e) {
		         e.printStackTrace();
		      }finally {
		    	  close(rset);
		          close(pstmt);
		      }
			
			return list;
		
	}


	
}
