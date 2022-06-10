package com.semi.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6139039833660364122L;
	
	private String userName;
	private String userId;
	private String userPwd;
	private String phone;
	private String address;
	private String email;
	private String userBirth;
	private String gender;
	private Date enrollDate;
	
	public Member() {
		
	}
	



	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	public Member(String userName, String userId, String email) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.email = email;
	}



	public Member(String userName, String userId, String userPwd, String phone, String address, String email,
			String userBirth, String gender, Date enrollDate) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.userBirth = userBirth;
		this.gender = gender;
		this.enrollDate = enrollDate;
	}

	public Member(String userName, String userId, String userPwd, String phone, String address, String email,
			String userBirth, String gender) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.userPwd = userPwd;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.userBirth = userBirth;
		this.gender = gender;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	
	@Override
	public String toString() {
		return "Member [userName=" + userName + ", userId=" + userId + ", userPwd=" + userPwd + ", phone=" + phone
				+ ", address=" + address + ", email=" + email + ", userBirth=" + userBirth + ", gender=" + gender
				+ ", enrollDate=" + enrollDate + "]";
	}

	
	
}