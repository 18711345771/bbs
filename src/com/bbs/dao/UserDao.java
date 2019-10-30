package com.bbs.dao;

import org.apache.ibatis.annotations.Param;

import com.bbs.po.User;

public interface UserDao {
	public User selectUserByUsername(String username);
	public User selectUserById(Integer id);
	public User checkUserWithUsernameandPasswordandIdentity(@Param("username")String username,@Param("password")String password,@Param("identity")String identity);
	public Integer addOneUser(User user); 
	public Integer updateUser(User user);
}
