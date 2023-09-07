package cnpm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cnpm.entity.ChiTietDonHang;
import cnpm.entity.ChiTietDonHangPK;
import cnpm.entity.ChiTietSanPham;
import cnpm.entity.DanhMucSanPham;
import cnpm.entity.DonHang;
import cnpm.entity.GioHang;
import cnpm.entity.GioHangPK;
import cnpm.entity.HinhThucThanhToan;
import cnpm.entity.KhachHang;
import cnpm.entity.NhanVien;
import cnpm.entity.TaiKhoan;
import cnpm.service.ChiTietDonHangService;
import cnpm.service.ChiTietSanPhamService;
import cnpm.service.DanhMucSanPhamService;
import cnpm.service.DonHangService;
import cnpm.service.GioHangService;
import cnpm.service.HinhThucThanhToanService;
import cnpm.service.KhachHangService;
import cnpm.service.SanPhamService;
import cnpm.service.TaiKhoanService;
import cnpm.service.TrangThaiDonHangService;
import cnpm.service.UtilsService;

@Controller

public class KhachHangController {
	@Autowired
	KhachHangService khachHangService;

	@Autowired
	TaiKhoanService taiKhoanService;

	@Autowired
	GioHangService gioHangService;

	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;

	@Autowired
	HinhThucThanhToanService hinhThucThanhToanService;

	@Autowired
	DonHangService donHangService;

	@Autowired
	TrangThaiDonHangService trangThaiDonHangService;

	@Autowired
	ChiTietDonHangService chiTietDonHangService;

	@Autowired
	UtilsService utilService;

	@Autowired
	SanPhamService sanPhamService;
	
	@Autowired
	DanhMucSanPhamService danhMucSanPhamService;
	
	@ModelAttribute("danhSachDanhMucSanPham")
	public List<DanhMucSanPham> dsDanhMucSanPham() {
		List<DanhMucSanPham> list = danhMucSanPhamService.getDSDanhMuc();
		return list;
	}

	@ModelAttribute("khachhang")
	public KhachHang getKh(HttpSession ss) {
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return null;
		}
		return tk.getKhachHang();
	}

	@ModelAttribute("dsdonhang")
	public List<DonHang> getDSDonHangCuaKH(HttpSession ss) {
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return null;
		}

		List<DonHang> list = donHangService.getDSDonHangCuaKH(tk.getKhachHang().getMaKH());
		return list;
	}

	@ModelAttribute("dsHTTT")
	public List<HinhThucThanhToan> getDSHinhThucThanhToan() {
		return hinhThucThanhToanService.getDSHinhThucThanhToan();
	}

	/*
	 * @ModelAttribute("thongTinKH") public KhachHang getThongTin(HttpSession ss) {
	 * TaiKhoan taiKhoan = (TaiKhoan) ss.getAttribute("user"); KhachHang kh =
	 * taiKhoan.getKhachHang(); return kh; }
	 */

	@ModelAttribute("giohang")
	public List<GioHang> getGioHang(HttpSession ss, ModelMap model) {

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return null;
		}

		if (!tk.getVaitro().getMaVT().equals("KH")) {

			return null;
		}

		List<GioHang> list = gioHangService.getGioHangCuaKH(tk.getKhachHang().getMaKH());
		return list;

	}

	@RequestMapping("taikhoan")
	public String getViewTaiKhoan(ModelMap model, HttpSession ss) {

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		KhachHang khachhang = tk.getKhachHang();
		model.addAttribute("thongTinKH", khachhang);
		return "shop/taikhoan";
	}

	/*
	 * @RequestMapping(value = "taikhoan", params = "luuthaydoi", method =
	 * RequestMethod.POST) public String postLoginUser(ModelMap
	 * model, @ModelAttribute("thongTinKH") KhachHang khachhang,
	 * 
	 * @RequestParam("anhMoi") MultipartFile anh, BindingResult errors, HttpSession
	 * ss) {
	 * 
	 * if (khachhang.getHo().trim().isEmpty()) { errors.rejectValue("ho",
	 * "thongTinKH", "Họ không được để trống"); }
	 * 
	 * if (khachhang.getTen().trim().isEmpty()) { errors.rejectValue("ten",
	 * "thongTinKH", "Tên không được để trống"); }
	 * 
	 * if (khachhang.getPhai() != true && khachhang.getPhai() != false) {
	 * errors.rejectValue("phai", "thongTinKH", "???"); }
	 * 
	 * if (khachhang.getNgaySinh() == null) { errors.rejectValue("ngaySinh",
	 * "thongTinKH", "Ngày sinh không được để trống"); }
	 * 
	 * if (khachhang.getSdt().trim().isEmpty()) { errors.rejectValue("sdt",
	 * "thongTinKH", "Số điện thoại không được để trống"); } else if
	 * (!khachhang.getSdt().trim().matches("^[0-9]*$")) { errors.rejectValue("sdt",
	 * "thongTinKH", "Số điện thoại không hợp lệ"); }
	 * 
	 * if (errors.hasErrors()) { // model.addAttribute("isOpenModalEditUser", true);
	 * return "shop/taikhoan"; }
	 * 
	 * TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
	 * 
	 * System.out.println(tk.getKhachHang().getMaKH());
	 * 
	 * KhachHang khachhangcu =
	 * khachHangService.getByMaKH(tk.getKhachHang().getMaKH()); if (khachhangcu !=
	 * null) { if (!khachhangcu.getHo().equals(khachhang.getHo()))
	 * khachhangcu.setHo(khachhang.getHo()); if
	 * (!khachhangcu.getTen().equals(khachhang.getTen())) {
	 * khachhangcu.setTen(khachhang.getTen()); } if
	 * (!khachhangcu.getNgaySinh().equals(khachhang.getNgaySinh())) {
	 * khachhangcu.setNgaySinh(khachhang.getNgaySinh()); } if
	 * (!khachhangcu.getDiaChi().equals(khachhang.getDiaChi())) {
	 * khachhangcu.setDiaChi(khachhang.getDiaChi()); }
	 * 
	 * if (!khachhangcu.getSdt().equals(khachhang.getSdt())) {
	 * khachhangcu.setSdt(khachhang.getSdt()); }
	 * 
	 * if (khachhangcu.getPhai() != khachhang.getPhai()) {
	 * khachhangcu.setPhai(khachhang.getPhai()); }
	 * 
	 * if (!anh.isEmpty()) { String hinh = ""; hinh = utilService.luuFile(anh); if
	 * (!hinh.isEmpty()) { khachhangcu.setAnh(hinh); } }
	 * 
	 * if (khachHangService.suaKH(khachhangcu)) { tk.setKhachHang(khachhangcu);
	 * ss.setAttribute("user", tk); model.addAttribute("thongTinKH", khachhangcu);
	 * model.addAttribute("change", "Sửa nhân viên thành công"); } }else {
	 * model.addAttribute("change", "Sửa nhân viên thất bại"); }
	 * 
	 * return "shop/taikhoan"; }
	 * 
	 * @RequestMapping(value = "taikhoan", params = "doimatkhau", method =
	 * RequestMethod.POST) public String postDoiMatKhau(ModelMap model, HttpSession
	 * ss, @RequestParam("mkcu") String mkcu,
	 * 
	 * @RequestParam("mkmoi") String mkmoi, @RequestParam("xacnhanmk") String
	 * xacnhanmk) {
	 * 
	 * if (mkcu == "") { model.addAttribute("mkcu", "Chưa nhập mật khẩu hiện tại");
	 * return "shop/taikhoan"; }
	 * 
	 * if (mkmoi == "") { model.addAttribute("mkmoi", "Chưa nhập mật khẩu mới");
	 * return "shop/taikhoan"; }
	 * 
	 * if (xacnhanmk == "") { model.addAttribute("xacnhanmk",
	 * "Chưa nhập mật khẩu xác nhận"); return "shop/taikhoan"; }
	 * 
	 * if (!mkmoi.equals(xacnhanmk)) { model.addAttribute("xacnhanmk",
	 * "Mật khẩu và mật khẩu xác nhận khác nhau"); return "shop/taikhoan"; }
	 * 
	 * TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
	 * 
	 * if (taiKhoanService.kiemTraDangNhap(tk.getEmail(), mkcu)) {
	 * taiKhoanService.thayDoiMK(tk, mkmoi); model.addAttribute("suamk",
	 * "Thay đổi thành công"); } else { model.addAttribute("suamk",
	 * "Thay đổi thất bại"); }
	 * 
	 * return "shop/taikhoan"; }
	 */

	float tongtien = 0.0F;

	@RequestMapping("donhang")
	public String getDonHang(ModelMap model) {
		model.addAttribute("tabListOrder", true);
		return "shop/taikhoan";
	}

	@RequestMapping(value = "donhang", params = "huydonhang", method = RequestMethod.POST)
	public String huyDonHang(ModelMap model, HttpSession ss, @RequestParam("maDH") Integer maDH) {
		if (maDH == null) {
			return "shop/taikhoan";
		}

		DonHang donhang = donHangService.getByMaDH(maDH);
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");

		if (donhang != null) {
			donhang.getTrangThaiDH().setMaTTDH(5);
			if (donHangService.suaDH(donhang)) {
				/*
				 * String noidung = "đã được hủy thành công."; boolean c =
				 * utilService.guiEmail(tk.getEmail(), noidung, 1);
				 */
				model.addAttribute("isSuccess", true);
				model.addAttribute("alertMessage", "Hủy đơn hàng thành công");

				model.addAttribute("dsdonhang", donHangService.getDSDonHangCuaKH(tk.getKhachHang().getMaKH()));
			} else {
				model.addAttribute("isSuccess", false);
				model.addAttribute("alertMessage", "Hủy đơn hàng thất bại");
			}
			model.addAttribute("tabListOrder", true);
		}

		return "shop/taikhoan";
	}

	@RequestMapping(value = "donhang/{maDH}", method = RequestMethod.GET)
	public String getDetailOrder(ModelMap model, @PathVariable("maDH") Integer maDH) {
		if (maDH == null) {
			return "shop/taikhoan";
		}
		DonHang dh = donHangService.getByMaDH(maDH);
		List<ChiTietDonHang> list = chiTietDonHangService.getDSByMaDH(maDH);

		if (list.size() > 0) {
			model.addAttribute("donhang", dh);
			model.addAttribute("ctdh", list);
			model.addAttribute("isShowModalInfo", true);
			model.addAttribute("tabListOrder", true);
		}

		return "shop/taikhoan";
	}

	@RequestMapping(value = "donhang/{maTT}", params = "trangthaidh", method = RequestMethod.GET)
	public String getListOrderByStatus(ModelMap model, @PathVariable("maTT") Integer maTT) {
		if (maTT == null) {
			return "shop/taikhoan";
		}

		List<DonHang> list = donHangService.getDSDonHangByTT(maTT);
		if (list != null) {
			model.addAttribute("dsdonhang", list);
			model.addAttribute("tabListOrder", true);
		}

		return "shop/taikhoan";
	}

	@RequestMapping(value = "thanhtoan", method = RequestMethod.GET)
	public String getViewThanhToan(ModelMap model, HttpSession ss, HttpServletRequest request) {

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return "redirect:/dangnhap";
		} else if (!tk.getVaitro().getMaVT().equals("KH")) {

			return "redirect:/";
		}

		List<GioHang> dsgiohang = gioHangService.getGioHangCuaKH(tk.getKhachHang().getMaKH());
		if (dsgiohang == null) {

			return "redirect:/giohang";
		}
		if (dsgiohang.size() == 0) {
			return "redirect:/giohang";
		}

		model.addAttribute("tongtien", tongtien);
		model.addAttribute("donhang", new DonHang());

		return "shop/thanhtoan";
	}

	@RequestMapping(value = "thanhtoan", params = "thanhtoangiohang", method = RequestMethod.POST)
	public String getthanhToan(ModelMap model, HttpServletRequest request) {

		tongtien = Float.parseFloat(request.getParameter("tongtien"));

		model.addAttribute("tongtien", tongtien);
		model.addAttribute("donhang", new DonHang());

		return "shop/thanhtoan";
	}

	@RequestMapping(value = "thanhtoan", params = "muahang", method = RequestMethod.POST)
	public String muaHang(ModelMap model, HttpSession ss, HttpServletRequest request, RedirectAttributes redirectAttributes,
			@ModelAttribute("donhang") DonHang donhang, BindingResult errors) {

		if (donhang.getTenNguoiNhan().trim().isEmpty()) {
			errors.rejectValue("tenNguoiNhan", "donhang", "Tên người nhận không được bỏ trống");
		}

		if (donhang.getDiaChi().trim().isEmpty()) {
			errors.rejectValue("diaChi", "donhang", "Địa chỉ nhận hàng không được bỏ trống");
		}

		if (donhang.getSdtKH().trim().isEmpty()) {
			errors.rejectValue("sdtKH", "donhang", "Số điện thoại người nhận không được bỏ trống");
		}

		if (donhang.getHinhThucTT() == null) {
			errors.rejectValue("hinhThucTT.maHTTT", "donhang", "Vui lòng chọn 1 hình thức thanh toán");
		}

		if (errors.hasErrors()) {
			model.addAttribute("tongtien", tongtien);
			return "shop/thanhtoan";
		}

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return "redirect:/dangnhap";
		} else if (!tk.getVaitro().getMaVT().equals("KH")) {

			return "redirect:/";
		}

		List<GioHang> dsgiohang = gioHangService.getGioHangCuaKH(tk.getKhachHang().getMaKH());
		// check sl ton

		ChiTietSanPham ctsp = new ChiTietSanPham();

		if (dsgiohang != null) {
			Boolean coTheThem = true;
			Map<Integer, Integer>  dskohople = new HashMap<Integer, Integer>();
			// check sl ton trong chitiet sp
			for (GioHang giohang : dsgiohang) {
				
				ctsp = chiTietSanPhamService.getByMaSCTSP(giohang.getChiTietSP().getMaChiTietSP());
				if(ctsp.getSoLuong() < giohang.getSoLuong()) {          
					coTheThem = false;
					dskohople.put(ctsp.getMaChiTietSP(), ctsp.getSoLuong());
					//dskohople
				}
			}
			
			if(!coTheThem) {
				redirectAttributes.addFlashAttribute("isSuccess", false);
				redirectAttributes.addFlashAttribute("dskohople", dskohople);
				return "redirect:/giohang";
			}
			

			// them don hang
			donhang.setKhachHang(tk.getKhachHang());
			donhang.setThoiGian(new Date());
			donhang.setTongTien(tongtien);
			donhang.setTrangThaiDH(trangThaiDonHangService.getById(1));
			donHangService.themDH(donhang);
			// them chi tiet don hang
			donhang = donHangService.getDHVuaTao();
			System.out.println("donhang id " + donhang.getMaDH());
			ChiTietDonHang ctdonhang = new ChiTietDonHang();
			ChiTietDonHangPK ctpk = new ChiTietDonHangPK();
			
			for (GioHang giohang : dsgiohang) {
				ctpk.setMaDH(donhang.getMaDH());
				ctpk.setMaCTSP(giohang.getChiTietSP().getMaChiTietSP());
				ctdonhang.setChiTietDonHangPK(ctpk);
				ctdonhang.setSoLuong(giohang.getSoLuong());
				ctdonhang.setGia((float) ((giohang.getChiTietSP().getSanPham().getGia()
						- (giohang.getChiTietSP().getSanPham().getGia()
								* (giohang.getChiTietSP().getSanPham().getGiamGia() / 100)))));

				if (chiTietDonHangService.themCTDH(ctdonhang)) {
					// tru sl ton trong ctsp
					//chiTietSanPhamService.truSLTon(giohang.getChiTietSP().getMaChiTietSP(), giohang.getSoLuong());
					// xoa trong gio hang
					gioHangService.xoa(giohang);
				} else {
					return "shop/giohang";
				}
				 

			}

			if (donhang.getHinhThucTT().getMaHTTT() == 1) {
				utilService.guiEmail(tk.getEmail(), "", 2);
			}
			model.addAttribute("giohang", new ArrayList<GioHang>());
			model.addAttribute("isSuccess", true);
			return "shop/kqdathang";

		}

		return "shop/thanhtoan";
	}

	@RequestMapping("giohang")
	public String getViewGioHang(ModelMap model, HttpSession ss) {

		return "shop/giohang";
	}

	@ResponseBody
	@RequestMapping(value = "giohang", params = "capnhatsl", method = RequestMethod.POST)
	public String capNhatSL(ModelMap model, HttpSession ss, HttpServletRequest request) {

		if (request.getParameter("soluong") == null || request.getParameter("mactsp") == null) {
			System.out.println("soluong " + request.getParameter("soluong"));
			System.out.println("mactsp " + request.getParameter("mactsp"));
			return null;
		}

		System.out.println("soluong " + request.getParameter("soluong"));
		System.out.println("mactsp " + request.getParameter("mactsp"));

		Integer mactsp = Integer.parseInt(request.getParameter("mactsp"));
		Integer soluong = Integer.parseInt(request.getParameter("soluong"));

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		GioHang giohang = gioHangService.getByPk(tk.getKhachHang().getMaKH(), mactsp);
		giohang.setSoLuong(soluong);
		if (gioHangService.sua(giohang)) {
			return "true";
		}

		return "false";
	}

	@RequestMapping(value = "giohang", params = "xoasp", method = RequestMethod.POST)
	public String xoaSPKhoiGioHang(ModelMap model, HttpSession ss, HttpServletRequest request) {

		if (request.getParameter("mactsp") == null) {
			return "shop/giohang";
		}

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return "redirect:/dangnhap";
		} else if (!tk.getVaitro().getMaVT().equals("KH")) {

			return "redirect:/";
		}

		Integer mactsp = Integer.parseInt(request.getParameter("mactsp"));
		GioHang giohang = gioHangService.getByPk(tk.getKhachHang().getMaKH(), mactsp);
		if (gioHangService.xoa(giohang)) {
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Xóa sản phẩm khỏi giỏ hàng thành công !");
			List<GioHang> list = gioHangService.getGioHangCuaKH(tk.getKhachHang().getMaKH());
			model.addAttribute("giohang", list);
		}

		return "shop/giohang";
	}

	@RequestMapping(value = "/sanpham/{maSP}", params = "themvaogiohang", method = RequestMethod.POST)
	public String themGioHang(ModelMap model, HttpServletRequest request, @PathVariable("maSP") Integer maSP,

			// ("size") Integer size, @RequestParam("soluong") Integer soLuong,

			HttpSession ss, RedirectAttributes redirectAttributes) {
		/// check chi cho khach hang dc them
		Integer size = 0;
		Integer soLuong = 0;
		if (request.getParameter("size") != null) {
			size = Integer.parseInt(request.getParameter("size"));
		} else {
			System.out.println("size = null");
		}

		if (request.getParameter("soluong") != null) {
			soLuong = Integer.parseInt(request.getParameter("soluong"));
		} else {
			System.out.println("sl = null");
		}

		System.out.println("size " + size + "so luong " + soLuong);

		if (maSP == null) {
			return "redirect:/";

		}

		if (size == 0) {
			redirectAttributes.addFlashAttribute("isSuccess", false);
			redirectAttributes.addFlashAttribute("alertMessage", "Vui lòng chọn size");

			return "redirect:" + request.getHeader("Referer");

		}

		if (soLuong == 0) {
			redirectAttributes.addFlashAttribute("isSuccess", false);
			redirectAttributes.addFlashAttribute("alertMessage", "Vui lòng chọn số lượng thêm");
			return "redirect:" + request.getHeader("Referer");
		}

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return "redirect:/dangnhap";
		} else if (!tk.getVaitro().getMaVT().equals("KH")) {

			return "redirect:/";
		}

		ChiTietSanPham ctsp = chiTietSanPhamService.getByMaSPVaSize(maSP, size);

		System.out.println("number " + size + " numer" + soLuong + " " + maSP + " " + ctsp);

		if ( ctsp.getSoLuong() == 0||ctsp.getSoLuong() < soLuong) {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Thêm sản phẩm vào giỏ thất bại");
			model.addAttribute("ctsanpham", sanPhamService.getByMaSP(maSP));
			return "shop/chitietsanpham";
		}

		GioHang giohang = gioHangService.getByPk(tk.getKhachHang().getMaKH(), ctsp.getMaChiTietSP());
		if (giohang == null) {
			GioHangPK pk = new GioHangPK(tk.getKhachHang().getMaKH(), ctsp.getMaChiTietSP());
			giohang = new GioHang();
			giohang.setGioHangPK(pk);
			giohang.setSoLuong(soLuong);

			if (gioHangService.them(giohang)) {
				model.addAttribute("isSuccess", true);
				model.addAttribute("alertMessage", "Đã thêm sản phẩm vào giỏ");
				System.out.println("Đã thêm sản phẩm vào giỏ");
				List<GioHang> list = gioHangService.getGioHangCuaKH(tk.getKhachHang().getMaKH());
				model.addAttribute("giohang", list);
			} else {
				model.addAttribute("isSuccess", false);
				model.addAttribute("alertMessage", "Thêm sản phẩm vào giỏ thất bại");
				System.out.println("Thêm sản phẩm vào giỏ thất bại");
			}
		} else {
			giohang.setSoLuong(giohang.getSoLuong() + soLuong);

			if (gioHangService.sua(giohang)) {
				model.addAttribute("isSuccess", true);
				model.addAttribute("alertMessage", "Đã thêm sản phẩm vào giỏ");
				System.out.println("Cập nhật giỏ hàng thành công");
			} else {
				model.addAttribute("isSuccess", false);
				model.addAttribute("alertMessage", "Cập nhật giỏ hàng thất bại");
				System.out.println("Cập nhật giỏ hàng thất bại");
			}

		}

		// String referer = request.getHeader("Referer");
		// return "redirect:" + referer;

		model.addAttribute("ctsanpham", ctsp.getSanPham());
		return "shop/chitietsanpham";
	}

	@RequestMapping(value = "kqdathang")
	public String kqdatHang(ModelMap model) {
		return "shop/kqdathang";
	}

	@RequestMapping(value = "taikhoan", params = "updatethongtin", method = RequestMethod.POST)
	public String updateThongTin(ModelMap model, @RequestParam("anhMoi") MultipartFile anh,
			@ModelAttribute("khachhang") KhachHang khachhang, HttpSession ss, BindingResult errors) {

		if (khachhang.getHo().trim().isEmpty()) {
			errors.rejectValue("ho", "khachhang", "Họ không được để trống");
		}

		if (khachhang.getTen().trim().isEmpty()) {
			errors.rejectValue("ten", "khachhang", "Tên không được để trống");
		}

		if (khachhang.getPhai() != true && khachhang.getPhai() != false) {
			errors.rejectValue("phai", "khachhang", "???");
		}

		if (khachhang.getNgaySinh() == null) {
			errors.rejectValue("ngaySinh", "khachhang", "Ngày sinh không được để trống");
		} else if (khachhang.getNgaySinh().after(new Date())) {
			errors.rejectValue("ngaySinh", "khachhang", "Ngày sinh không được quá ngày hiện tại");
		}

		if (khachhang.getDiaChi().trim().isEmpty()) {
			errors.rejectValue("ngaySinh", "khachhang", "Địa chỉ không được để trống");
		}

		if (khachhang.getSdt().trim().isEmpty()) {
			errors.rejectValue("sdt", "khachhang", "Số điện thoại không được để trống");
		} else if (!khachhang.getSdt().trim().matches("^[0-9]*$")) {
			errors.rejectValue("sdt", "khachhang", "Số điện thoại không hợp lệ");
		}

		if (errors.hasErrors()) {

			return "shop/taikhoan";
		}

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		// KhachHang khachhangcu =
		// khachHangService.getByMaKH(tk.getKhachHang().getMaKH());
		KhachHang khachhangcu = tk.getKhachHang();
		if (!khachhangcu.getHo().equals(khachhang.getHo())) {
			khachhangcu.setHo(khachhang.getHo());
		}

		if (!khachhangcu.getTen().equals(khachhang.getTen())) {
			khachhangcu.setTen(khachhang.getTen());
		}

		if (khachhangcu.getPhai() != khachhang.getPhai()) {
			khachhangcu.setPhai(khachhang.getPhai());
		}

		if (!khachhangcu.getNgaySinh().equals(khachhang.getNgaySinh())) {
			khachhangcu.setNgaySinh(khachhang.getNgaySinh());
		}

		if (!khachhangcu.getDiaChi().equals(khachhang.getDiaChi())) {
			khachhangcu.setDiaChi(khachhang.getDiaChi());
		}

		if (!khachhangcu.getSdt().equals(khachhang.getSdt())) {
			khachhangcu.setSdt(khachhang.getSdt());
		}

		if (!anh.isEmpty()) {
			String hinh = "";
			hinh = utilService.luuFile(anh);
			if (!hinh.isEmpty()) {
				khachhangcu.setAnh(hinh);
			}
		}

		if (khachHangService.suaKH(khachhangcu)) {
			khachhangcu = khachHangService.getByMaKH(tk.getKhachHang().getMaKH());
			tk.setKhachHang(khachhangcu);
			ss.setAttribute("user", tk);
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Sửa thông tin cá nhân thành công");
			model.addAttribute("khachhang", khachhangcu);

		} else {
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Sửa thông tin cá nhân thất bại");
		}

		return "shop/taikhoan";
	}

	@RequestMapping(value = "taikhoan", params = "doimatkhau", method = RequestMethod.POST)
	public String doiMatKhau(ModelMap model, HttpSession ss, HttpServletRequest request) {

		Boolean check = false;
		if (request.getParameter("matkhau").length() == 0) {
			check = true;
			model.addAttribute("matkhau", "Mật khẩu không được để trống");
		}

		if (request.getParameter("matkhaumoi").length() == 0) {
			check = true;
			model.addAttribute("matkhaumoi", "Mật khẩu mới không được để trống");
		}

		if (request.getParameter("nlmatkhaumoi").length() == 0) {
			check = true;
			model.addAttribute("nlmatkhaumoi", "Mật khẩu nhập lại không được để trống");
		}

		if (check) {
			model.addAttribute("tabListPassword", true);
			return "shop/taikhoan";
		}

		String matKhau = request.getParameter("matkhau");
		String matkhaumoi = request.getParameter("matkhaumoi");
		String nlmatkhaumoi = request.getParameter("nlmatkhaumoi");

		System.out.println("mat khau" + matKhau);

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (!tk.getMatKhau().equals(taiKhoanService.hashPass(matKhau))) {
			System.out.println(tk.getMatKhau());
			check = true;
			model.addAttribute("matkhau", "Mật khẩu hiện tại không đúng");
		}

		if (!matkhaumoi.equals(nlmatkhaumoi)) {
			check = true;
			model.addAttribute("nlmatkhaumoi", "Mật khẩu nhập lại không trùng");
		}

		if (check) {
			model.addAttribute("tabListPassword", true);
			return "shop/taikhoan";
		}

		if (taiKhoanService.doiMK(tk, matkhaumoi)) {
			tk.setMatKhau(taiKhoanService.hashPass(matkhaumoi));
			ss.setAttribute("user", tk);
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Đổi mật khẩu thành công");
		} else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Đổi mật khẩu thất bại");
		}

		model.addAttribute("tabListPassword", true);
		return "shop/taikhoan";
	}

}
