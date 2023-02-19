package com.tech.blog.dao;

import java.sql.*;

import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;
	
	 public UserDao(Connection con){
		 this.con = con;
	 }
	//to insert user details in db
	 public boolean saveUser(User user){
		 boolean flag =  false;
		 try{
			 String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
			 PreparedStatement psmt = this.con.prepareStatement(query);
			 psmt.setString(1, user.getName());
			 psmt.setString(1, user.getEmail());
			 psmt.setString(3, user.getPassword());
			 psmt.setString(4, user.getGender());
			 psmt.setString(5, user.getAbout());
			 
			 psmt.executeUpdate();
			 flag = true;
		 }
		 catch(Exception e){
			 e.printStackTrace();
		 }
		 return flag;
	 }
	 
	 //get user by user-email & pass
	 public User getUserByEmailAndPassword(String email,String password){
		 User user=null;
		 try{
			 String query="select * from user where email=? and password=?";
			 PreparedStatement psmt=con.prepareStatement(query);
			 psmt.setString(1,email);
			 psmt.setString(2,password);
			 ResultSet rs = psmt.executeQuery();
			 if(rs.next()){
				 user=new User();
				 String name=rs.getString("name");
				 user.setName(name);
				 user.setId(rs.getInt("id"));
				 user.setEmail(rs.getString("email"));
				 user.setPassword(rs.getString("password"));
				 user.setGender(rs.getString("gender"));
				 user.setAbout(rs.getString("about"));
				 user.setDateTime(rs.getTimestamp("regdate"));
				 user.setProfilePhoto(rs.getString("photo"));
			 }
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 
		 return user;
	 }
	 
	 public boolean updateUser(User user){
		 boolean flag=false;
		 try{
			 String query = "update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";
			 PreparedStatement psmt = con.prepareStatement(query);
			 psmt.setString(1, user.getName());
			 psmt.setString(2, user.getEmail());
			 psmt.setString(3, user.getPassword());
			 psmt.setString(4, user.getGender());
			 psmt.setString(5, user.getAbout());
			 psmt.setString(6, user.getProfilePhoto());
			 psmt.setInt(7, user.getId());
			 
			 psmt.executeUpdate();
			 flag=true;
			 
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 return flag;
	 }
}
