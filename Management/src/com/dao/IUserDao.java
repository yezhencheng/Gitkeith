package com.dao;


import java.util.List;
import java.util.Map;

import com.entity.User;

public interface IUserDao {
	public List<User> selectkey();
	public List<User> selectuser();
	public void saveuser(User user);
}
