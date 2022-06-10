package com.semi.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;


import com.semi.member.exception.MemberException;
import com.semi.member.model.vo.Member;
import static com.semi.common.JDBCTemplate.*;

public class MemberDao {

	private Properties prop;

	public MemberDao() {
		prop = new Properties();

		String filePath = MemberDao.class
				.getResource("/config/member_query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));

		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}


	public Member loginMember(Connection con, Member m) throws MemberException {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());

			rset = pstmt.executeQuery();
			System.out.println(m.getUserId() + ":" +  m.getUserPwd());
			if(rset.next()) {
				result = new Member();

				result.setUserId(m.getUserId());
				result.setUserPwd(m.getUserPwd());
				result.setUserName(rset.getString("MEM_NAME"));
				result.setUserBirth(rset.getString("MEM_YEAR"));
				result.setGender(rset.getString("GENDER"));
				result.setPhone(rset.getString("PHONE"));
				result.setEmail(rset.getString("EMAIL"));
				result.setAddress(rset.getString("ADDRESS"));

			}
			System.out.println(result);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}


	public int joinMember(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("joinMember");

		try {
			pstmt = con.prepareStatement(sql);

			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserBirth());
			pstmt.setString(5, m.getGender());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getEmail());
			pstmt.setString(8, m.getAddress());
			
		

			result = pstmt.executeUpdate();

		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int idDupCheck(Connection con, String id) {
		int result = -1;
		// -1 : 에러
		// 0 : id중복사용자 없음
		// 1 : 이미 id를 누가 사용하고 있음
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idDupCheck");  // select count(*) from member where userid=?

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;

	}


	public int phoneCheck(Connection con, String phone) {
		int result = -1;
		// -1 : 에러
		// 0 : id중복사용자 없음
		// 1 : 이미 id를 누가 사용하고 있음
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("phoneCheck"); 

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);

			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;

	}


	public Member MypagePwdCheck(Connection con, Member m) throws MemberException {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("loginMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());

			rset = pstmt.executeQuery();
			System.out.println(m.getUserId() + ":" +  m.getUserPwd());
			if(rset.next()) {
				result = new Member();

				result.setUserId(m.getUserId());
				result.setUserPwd(m.getUserPwd());
				result.setUserName(rset.getString("MEM_NAME"));
				result.setUserBirth(rset.getString("MEM_YEAR"));
				result.setGender(rset.getString("GENDER"));
				result.setPhone(rset.getString("PHONE"));
				result.setEmail(rset.getString("EMAIL"));
				result.setAddress(rset.getString("ADDRESS"));

			}
			System.out.println(result);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;

	}


	public int mainupdateMember(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("mainupdateMember");

		try {

			pstmt = con.prepareStatement(sql);



			pstmt.setString(1, m.getPhone());
			pstmt.setString(2, m.getAddress());
			pstmt.setString(3, m.getUserBirth());
			pstmt.setString(4, m.getUserId());

			result = pstmt.executeUpdate();

		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}

		return result;
	}


	public int deleteMember(Connection con, String userId) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);

			result = pstmt.executeUpdate();

		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}

		return result;
	}


	public int PwdupdateMember(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("PwdupdateMember");

		try {

			pstmt = con.prepareStatement(sql);



			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getUserId());

			result = pstmt.executeUpdate();

		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}

		return result;
	}




	public Member findId(Connection conn, String userName, String userEmail) {
		Member findUser = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("FindId");
		
		
		System.out.println("다오" + userName + ":" +  userEmail);

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				findUser = new Member(rset.getString("MEM_NAME"),
						rset.getString("EMAIL"));
			}  

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return findUser;


	}


	public Member findMember(Connection con, Member findUser) throws MemberException {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("FindidMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, findUser.getUserName());
			pstmt.setString(2, findUser.getEmail());

			rset = pstmt.executeQuery();
			System.out.println("dao" + findUser.getUserName() + ":" +  findUser.getEmail());
			if(rset.next()) {
				result = new Member();

				result.setUserId(rset.getString("MEM_ID"));
				result.setUserPwd(rset.getString("MEM_PWD"));
				result.setUserName(findUser.getUserName());
				result.setUserBirth(rset.getString("MEM_YEAR"));
				result.setGender(rset.getString("GENDER"));
				result.setPhone(rset.getString("PHONE"));
				result.setEmail(findUser.getEmail());
				result.setAddress(rset.getString("ADDRESS"));

			}
			System.out.println(result);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}


	public Member findPwd(Connection conn, String userid, String userEmail) {
		Member findUser = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("FindPwd");
		
		
		System.out.println("다오" + userid + ":" +  userEmail);

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userEmail);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				findUser = new Member(rset.getString("MEM_ID"),
						rset.getString("EMAIL"));
			}  

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return findUser;


	}


	public Member findMember2(Connection con, Member findUser) throws MemberException {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("FindpwdMember");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, findUser.getUserId());
			pstmt.setString(2, findUser.getEmail());

			rset = pstmt.executeQuery();
			System.out.println("dao" + findUser.getUserName() + ":" +  findUser.getEmail());
			if(rset.next()) {
				result = new Member();

				result.setUserId(findUser.getUserId());
				result.setUserPwd(rset.getString("MEM_PWD"));
				result.setUserName(rset.getString("MEM_NAME"));
				result.setUserBirth(rset.getString("MEM_YEAR"));
				result.setGender(rset.getString("GENDER"));
				result.setPhone(rset.getString("PHONE"));
				result.setEmail(findUser.getEmail());
				result.setAddress(rset.getString("ADDRESS"));

			}
			System.out.println(result);
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	

	


}






















