package com.bbs.service;

import com.bbs.po.User;

public interface UserService {
	public User selectUserByUsername(String username);
	public User selectUserById(Integer id);
	public User checkUserWithUsernameandPasswordandIdentity(String username,String password,String identity);
	public Integer addOneUser(User user);
	public Integer updateUser(User user);
}
