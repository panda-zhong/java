package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Manage;
import pojo.NewsMaker;

public class CheckNewsMakerLoginFilter implements Filter {
	private String unCheckUrls;
	private String loginPage;
	private String newsMakerInSession;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpServletRequest = (HttpServletRequest) req;
		HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
		ServletContext servletContext = httpServletRequest.getServletContext();
		String uri = httpServletRequest.getRequestURI();// 当前请求的资源名称
		uri = uri.substring(uri.indexOf("/", 2)+1);
		// System.out.println("处理后的URI" + );
		System.out.println("uri:"+uri);
		System.out.println("unCheckUrls："+unCheckUrls);
		if (!unCheckUrls.equals(uri)) {
			NewsMaker currentNewsMaker = (NewsMaker) httpServletRequest.getSession().getAttribute(newsMakerInSession);
			if (currentNewsMaker == null) {
				System.out.println("登录拦截");
				httpServletResponse.sendRedirect(servletContext.getContextPath() + loginPage);
				return;
			}
		}
//		httpServletResponse.sendRedirect(servletContext.getContextPath() + loginPage);
		chain.doFilter(httpServletRequest, httpServletResponse);
		return;
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		newsMakerInSession = config.getInitParameter("newsMakerInSession");
		loginPage = config.getInitParameter("loginPage");
		unCheckUrls =config.getInitParameter("unCheckUrls");
	}

}
