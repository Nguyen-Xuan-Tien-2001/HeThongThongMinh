package cnpm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cnpm.entity.ChiTietSanPham;
import cnpm.entity.GioHang;
import cnpm.entity.GioHangPK;
import cnpm.entity.TaiKhoan;
import cnpm.service.ChiTietSanPhamService;
import cnpm.service.GioHangService;

@Controller
@RequestMapping("/api/")
public class ApiController {
	
	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;
	
	@Autowired
	GioHangService gioHangService;

	@ResponseBody
	@RequestMapping(value = "themvaogiohang", method = RequestMethod.POST)
	public String themvaogiohang(ModelMap model, HttpSession ss, HttpServletRequest request) {
		if (request.getParameter("size") == null || request.getParameter("soluong") == null
				|| request.getParameter("maSP") == null) {
			return "themfalse";
		}
		
		Integer size = Integer.parseInt(request.getParameter("size"));
		Integer soluong = Integer.parseInt(request.getParameter("soluong"));
		Integer maCTSP = Integer.parseInt(request.getParameter("maSP"));
		
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return "candangnhap";
		} else if (!tk.getVaitro().getMaVT().equals("KH")) {

			return "themfalse";
		}
		
		ChiTietSanPham ctsp = chiTietSanPhamService.getByMaSPVaSize(maCTSP, size);
		
		if (ctsp.getSoLuong() == 0 ||ctsp.getSoLuong() < soluong) {
			
			return "themfalse";
		}
		
		GioHang giohang = gioHangService.getByPk(tk.getKhachHang().getMaKH(), ctsp.getMaChiTietSP());
		if (giohang == null) {
			GioHangPK pk = new GioHangPK(tk.getKhachHang().getMaKH(), ctsp.getMaChiTietSP());
			giohang = new GioHang();
			giohang.setGioHangPK(pk);
			giohang.setSoLuong(soluong);

			if (gioHangService.them(giohang)) {
				
				return "themtrue";
			} 
		} else {
			giohang.setSoLuong(giohang.getSoLuong() + soluong);

			if (gioHangService.sua(giohang)) {
				return "capnhattrue";
			} else {
				return "capnhatfalse";
			}

		}


		return "themfalse";
	}
	
	@ResponseBody
	@RequestMapping(value="xoakhoigiohang", method=RequestMethod.POST)
	public String xoakhoigiohang(ModelMap model, HttpSession ss, HttpServletRequest request) {
		if (request.getParameter("mactsp") == null) {
			return "xoafalse";
		}

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return "candangnhap";
		} else if (!tk.getVaitro().getMaVT().equals("KH")) {

			return "xoafalse";
		}

		Integer mactsp = Integer.parseInt(request.getParameter("mactsp"));
		GioHang giohang = gioHangService.getByPk(tk.getKhachHang().getMaKH(), mactsp);
		if (gioHangService.xoa(giohang)) {
			return "xoatrue";
		}
		
		return "xoafalse";
	}
}
