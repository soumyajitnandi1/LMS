package com.nrifintech.lms.interceptpr;

import java.util.Objects;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.UrlPathHelper;

/**
 * @author	Debopam
 * @email	debpal07@gmail.com
 * @created	Nov 9, 2021
 */
@Component
public class AuthenticationInterceptor implements HandlerInterceptor {
	private static final Logger LOGGER = LoggerFactory.getLogger(AuthenticationInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String resourcePath = new UrlPathHelper().getPathWithinApplication(request);
		
		if(LOGGER.isDebugEnabled())
			LOGGER.debug("Intercepted resource - {} in preHandle()", resourcePath);
		
		if(!canPassAuthentication(resourcePath) && !isUserAuthenticated(request)) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		
		return true;
	}

	private boolean isUserAuthenticated(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return Objects.nonNull(session.getAttribute("isValidUser"));
	}

	private boolean canPassAuthentication(String resourcePath) {
		return resourcePath.equalsIgnoreCase("/login")
				|| resourcePath.equalsIgnoreCase("/doLogin")
				|| resourcePath.equalsIgnoreCase("/login/admin")
				|| resourcePath.equalsIgnoreCase("/register")
				|| resourcePath.equalsIgnoreCase("/logout")
				|| resourcePath.equalsIgnoreCase("/forget-password")
				|| resourcePath.equalsIgnoreCase("/verification")
				|| Pattern.matches(".*\\.[a-zA-Z]+$", resourcePath);
	}
}
