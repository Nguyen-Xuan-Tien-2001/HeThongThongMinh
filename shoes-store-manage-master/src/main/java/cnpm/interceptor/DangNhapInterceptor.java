package cnpm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cnpm.entity.TaiKhoan;

public class DangNhapInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			TaiKhoan taikhoan = (TaiKhoan) session.getAttribute("user");
			System.out.println("user " + taikhoan.getVaitro().getMaVT());
			if (taikhoan.getVaitro().getMaVT().equals("KH")) {

				response.sendRedirect(request.getContextPath() + "/");
				return false;
			}

			else if (taikhoan.getVaitro().getMaVT().equals("NV")) {

				response.sendRedirect(request.getContextPath() + "/nhanvien/tongquan");
				return false;
			}

			else if (taikhoan.getVaitro().getMaVT().equals("QL")) {

				response.sendRedirect(request.getContextPath() + "/quanly/tongquan");
				return false;
			}
			
		} 

		return true;
	}
}
