package com.nrifintech.lms.repository;

import org.springframework.stereotype.Repository;

import com.nrifintech.lms.entity.User;

/**
 * @author	Debopam
 * @email	debpal07@gmail.com
 * @created	Nov 9, 2021
 */
@Repository
public interface UserRepository extends AbstractBaseRepository<User, Long> {
	User findByUsernameAndPassword(String username, String password);
}
