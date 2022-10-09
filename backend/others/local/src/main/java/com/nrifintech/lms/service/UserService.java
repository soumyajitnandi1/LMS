package com.nrifintech.lms.service;

import com.nrifintech.lms.entity.User;
import com.nrifintech.lms.request.UserLoginRequest;

/**
 * @author	Debopam
 * @email	debpal07@gmail.com
 * @created	Nov 9, 2021
 */
public interface UserService extends AbstractBaseService<User, Long> {
	public boolean isValidUser(UserLoginRequest userLoginRequest);
}
