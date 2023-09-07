package cnpm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cnpm.entity.TaiKhoan;

public class ResetInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 HttpSession session = request.getSession();
		
		 String reqUrl = request.getRequestURL().toString();
		 
		 if( reqUrl.contains("dangxuat") || reqUrl.contains("resources")) {
			 return true;
		 }
		 
		 if(reqUrl.contains("resetmk")) {
			 System.out.println("req " + reqUrl);
			 if(session.getAttribute("user") == null) {
				 response.sendRedirect(request.getContextPath() + "/");
				 return false;
			 }else if(session.getAttribute("user") != null){ 
				 
				 TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("user");
					if(taikhoan.getTrangThai() != 2 ) {
						 response.sendRedirect(request.getContextPath() + "/");
						return false;
					}
			 }
			 
			 return true;
		 }
		 
		 if(session.getAttribute("user") != null){
			 
			 TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("user");
				if(taikhoan.getTrangThai() == 2 ) {
					response.sendRedirect(request.getContextPath() + "/resetmk");
					return false;
				}
		}


		return true;
	}
}
