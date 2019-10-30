package com.bbs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bbs.dao.UserDao;
import com.bbs.po.User;
import com.bbs.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;
	
	@Override
	public User selectUserByUsername(String username) {
		return userDao.selectUserByUsername(username);
	}

	@Override
	public User selectUserById(Integer id) {
		return userDao.selectUserById(id);
	}

	@Override
	public User checkUserWithUsernameandPasswordandIdentity(String username, String password,String identity) {
		return userDao.checkUserWithUsernameandPasswordandIdentity(username, password,identity);
	}

	@Override
	public Integer addOneUser(User user) {
		return userDao.addOneUser(user);
	}

	@Override
	public Integer updateUser(User user) {
		return userDao.updateUser(user);
	}
}
