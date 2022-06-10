package com.semi.member.model.service;

import java.sql.Connection;

import com.semi.member.exception.MemberException;
import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;
import static com.semi.common.JDBCTemplate.*;

public class MemberService {

	private Connection con;
	private MemberDao mDao = new MemberDao();

	/**
	 * 로그인
	 * @param m
	 * 
	 */
	public Member loginMember(Member m) throws MemberException {
		con = getConnection();

		Member result = mDao.loginMember(con,m);

		close(con);

		if(result == null) {
			throw new MemberException("회원 아이디나 비밀번호가 올바르지 않습니다.");
		}


		return result;
	}

	/**
	 * 회원가입
	 * @param m
	 * @return 
	 */
	public int joinMember(Member m) throws MemberException{
		con = getConnection();
		int result = mDao.joinMember(con,m);

		System.out.println("회원가입 확인용" + result);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int IdCheck(String id) {
		Connection con = getConnection();
		int result = mDao.idDupCheck(con,id);
		close(con);
		return result;

	}


	public int PhoneCheck(String phone) {
		Connection con = getConnection();
		int result = mDao.phoneCheck(con,phone);
		close(con);
		return result;

	}

	public Member MypagePwdCheck(Member m) throws MemberException {
		con = getConnection();

		Member result = mDao.MypagePwdCheck(con,m);

		close(con);

		if(result == null) {
			throw new MemberException("비밀번호가 올바르지 않습니다.");
		}


		return result;
	}

	public int mainupdateMember(Member m) throws MemberException {
		con = getConnection();
		int result = mDao.mainupdateMember(con,m);

		System.out.println(m);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public int deleteMember(String userId) throws MemberException {

		con = getConnection();
		int result = mDao.deleteMember(con,userId);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);

		return result;
	}

	public int PwdupdateMember(Member m) throws MemberException {
		con = getConnection();
		int result = mDao.PwdupdateMember(con,m);

		System.out.println(m);

		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		close(con);

		return result;
	}



	public Member findId(String userName, String userEmail) {
		Connection conn = getConnection();

		Member findUser = new MemberDao().findId(conn, userName, userEmail);

		close(conn);

		return findUser;
	}

	public Member findUserid(Member findUser) throws MemberException {
		// TODO Auto-generated method stub
		con = getConnection();


		Member result = mDao.findMember(con,findUser);
		System.out.println("service : " + result);
		close(con);

		if(result == null) {
			throw new MemberException("회원 아이디나 비밀번호가 올바르지 않습니다.");
		}


		return result;
	}

	public Member findPwd(String userid, String userEmail) {
		Connection conn = getConnection();

		Member findUser = new MemberDao().findPwd(conn, userid, userEmail);

		close(conn);

		return findUser;
	
	}

	public Member findUserpwd(Member findUser) throws MemberException {
		con = getConnection();


		Member result = mDao.findMember2(con,findUser);
		System.out.println("service : " + result);
		close(con);

		if(result == null) {
			throw new MemberException("회원 아이디나 비밀번호가 올바르지 않습니다.");
		}


		return result;
	}




	


}
