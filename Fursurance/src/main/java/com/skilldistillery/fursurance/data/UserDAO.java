package com.skilldistillery.fursurance.data;

import com.skilldistillery.fursurance.entities.User;

public interface UserDAO {
	
	User findById(int userId);

}
