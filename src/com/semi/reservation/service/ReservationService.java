package com.semi.reservation.service;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.semi.reservation.model.dao.ReservationDao;
import com.semi.reservation.model.vo.Reservation;
import static com.semi.common.JDBCTemplate.*;
public class ReservationService {
	
	 private ReservationDao rDao = new ReservationDao();

	public ArrayList<Reservation> selectList() {

		 Connection con = getConnection();
		
		 ArrayList<Reservation> list = rDao.selectList(con);
	      
	    close(con);
	      
		return list;
	}

	public ArrayList<Reservation> list() {

		Connection con = getConnection();
		
		ArrayList<Reservation>list = rDao.selectAbcList(con);
		close(con);
		
		return list;
	}


	public ArrayList<Reservation> searchCinema(String search) {

		Connection con = getConnection();
		ArrayList <Reservation> list = null;
		
		list = rDao.searchCinema(con,search);
		
		
		return list;
		
	}

	public ArrayList<Reservation> searchTime() {

		Connection con = getConnection();
		
		ArrayList <Reservation> list=null;
		
		list = rDao.searchTime(con);
		return list;
	}

	public ArrayList<Reservation> searcImage(String movie) {

		Connection con = getConnection();
		
		ArrayList<Reservation> list = null;
		list = rDao.searchImage(con,movie);
		
		
		return list;
	}




	

}
