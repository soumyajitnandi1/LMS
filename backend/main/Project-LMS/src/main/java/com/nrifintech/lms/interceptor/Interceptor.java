package com.nrifintech.lms.interceptor;

import java.util.Objects;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.AsyncHandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.UrlPathHelper;

@Component
public class Interceptor implements AsyncHandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String resourcePath = new UrlPathHelper().getPathWithinApplication(request);
		HttpSession session = request.getSession();
		System.out.println("Path = " + resourcePath);
		if(!isUserAuthenticated(request) && !canPassAuthentication(resourcePath)) {
			System.out.println("User not Logged IN ");
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		if(isUserAuthenticated(request)) {
			System.out.println("User Logged IN");
		}
		if(!isUserAuthenticated(request) && canPassAuthentication(resourcePath)) {
			System.out.println("not loggedin but can view");
		}
		Object validUser = session.getAttribute("validUser");
		if(isUserAuthenticated(request)) {
			if(validUser.equals("admin")) {
				if(resourcePath.equals("/userDB")) {
					response.getWriter().print("Not authorized");
					return false;
				}
			}
			else {
				if(resourcePath.equals("/adminDB")) {
					response.getWriter().print("You are not an admin");
					return false;
				}
			}
		}
		return true;
	}
	private boolean isUserAuthenticated(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return Objects.nonNull(session.getAttribute("validUser"));
	}

	private boolean canPassAuthentication(String resourcePath) {
		
		return resourcePath.equalsIgnoreCase("/")
				|| resourcePath.equalsIgnoreCase("/lms/")
				|| resourcePath.equalsIgnoreCase("/login")
				|| resourcePath.equalsIgnoreCase("/register")
				|| resourcePath.equalsIgnoreCase("/logout")
				|| resourcePath.equalsIgnoreCase("/addUser")
				|| resourcePath.equalsIgnoreCase("/userLogin")
				|| resourcePath.equalsIgnoreCase("/catalogue")
				|| Pattern.matches("^.*\\.(?!css|js|font|png|jpeg)[a-z0-9]+$", resourcePath);
	}
}
