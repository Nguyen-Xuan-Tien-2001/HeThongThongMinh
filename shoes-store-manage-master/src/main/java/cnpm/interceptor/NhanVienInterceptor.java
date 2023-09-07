package cnpm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cnpm.entity.TaiKhoan;

public class NhanVienInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null){
			response.sendRedirect(request.getContextPath() + "/dangnhap");
			return false;
		}else {
			
			TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("user");
			if(!taikhoan.getVaitro().getMaVT().equals("NV")) {
				
				response.sendRedirect(request.getContextPath() + "/403");
				return false;
			}
			
		}
		
		return true;
	}
}
