package com.bbs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bbs.po.User;

public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 获取Session
		HttpSession session = request.getSession();
		User user1 = (User) session.getAttribute("UserInfo");
		User user2 = (User) session.getAttribute("AdminInfo");
		// 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
		if (user1 != null || user2 != null) {
			return true;
		} else {
			// 获取请求的URL
			String url = request.getRequestURI();
			// URL:除了登录请求、注册请求、查看根帖请求和查看子帖请求外，其他的URL都进行拦截控制
			if (url.indexOf("/userlogin.action") >= 0 || url.indexOf("/adminlogin.action") >= 0
					|| url.indexOf("/list.action") >= 0 || url.indexOf("/root_child_article.action") >= 0
					|| url.indexOf("/userregist.action") >= 0) {
				return true;
			}
			// 不符合条件的给出提示信息，并转发到登录页面
			// request.setAttribute("msg", "您还没有登录，请先登录！");
			response.sendRedirect("/bbs/bbs/list.action");
			return false;
		}
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
