package cnpm.controller;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cnpm.entity.DanhMucSanPham;
import cnpm.entity.KhachHang;
import cnpm.entity.NhanVien;
import cnpm.entity.TaiKhoan;
import cnpm.service.DanhMucSanPhamService;
import cnpm.service.KhachHangService;
import cnpm.service.NhanVienService;
import cnpm.service.TaiKhoanService;
import cnpm.service.UtilsService;

@Controller
//@SessionAttributes("user")
public class TaiKhoanController {
	@Autowired
	TaiKhoanService taiKhoanService;

	@Autowired
	KhachHangService khachHangService;

	@Autowired
	NhanVienService nhanVienService;

	@Autowired
	UtilsService utilService;

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	DanhMucSanPhamService danhMucSanPhamService;
	
	@ModelAttribute("danhSachDanhMucSanPham")
	public List<DanhMucSanPham> dsDanhMucSanPham() {
		List<DanhMucSanPham> list = danhMucSanPhamService.getDSDanhMuc();
		return list;
	}

	@ModelAttribute("thongTinNV")
	public NhanVien thongtinNv(ModelMap model) {

		return new NhanVien();
	}

	@RequestMapping(value = "dangxuat")
	public String dangXuat(HttpSession ss) {

		if (ss.getAttribute("user") != null) {

			ss.removeAttribute("user");
		}
		return "redirect:/";
	}

	@RequestMapping(value = { "dangnhap" }, method = RequestMethod.GET)
	public String getDangNhap(ModelMap model) {
		model.addAttribute("taikhoan", new TaiKhoan());
		return "taikhoan/dangnhap";
	}

	@RequestMapping(value = { "dangky" }, method = RequestMethod.GET)
	public String getDangKy(ModelMap model) {
		model.addAttribute("tkdangky", new KhachHang());
		return "taikhoan/dangky";
	}

	@RequestMapping(value = { "quenmatkhau" }, method = RequestMethod.GET)
	public String getQuenMatKhau(ModelMap model) {
		model.addAttribute("quenmatkhau", new TaiKhoan());
		return "taikhoan/quenmatkhau";
	}

	@RequestMapping(value = "resetmk", method = RequestMethod.GET)
	public String getResetMk(ModelMap model) {
		return "taikhoan/resetmk";
	}

	@RequestMapping(value = "resetmk", method = RequestMethod.POST)
	public String postResetMk(ModelMap model, HttpServletRequest request, HttpSession ss,
			RedirectAttributes redirectAttributes) {

		String matkhaumoi = request.getParameter("matkhaumoi");
		String rematkhaumoi = request.getParameter("rematkhaumoi");

		System.out.println("mk moi " + matkhaumoi + " " + rematkhaumoi);
		
		Boolean check = false;
		if (matkhaumoi.isEmpty()) {
			check = true;
			model.addAttribute("matkhaumoi", "Mật khẩu mới không được để trống");
		}

		if (rematkhaumoi.isEmpty()) {
			check = true;
			model.addAttribute("rematkhaumoi", "Xác nhận mật khẩu mới không được để trống");
		}

		if (!check) {
			if (!matkhaumoi.equals(rematkhaumoi)) {
				check = true;
				model.addAttribute("rematkhaumoi", "Xác nhận mật khẩu mới không trùng");
			}

		}

		if (check) {
			return "taikhoan/resetmk";
		}

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return "redirect:/dangnhap";
		}

		tk.setTrangThai(1);
		if (taiKhoanService.doiMK(tk, matkhaumoi)) {
			ss.setAttribute("user", tk);
			redirectAttributes.addFlashAttribute("isSuccess", true);
			redirectAttributes.addFlashAttribute("alertMessage", "Đổi mật khẩu thành công");

			if (tk.getVaitro().getMaVT().equals("KH")) {
				return "redirect:/";
			}

			if (tk.getVaitro().getMaVT().equals("NV")) {
				return "redirect:/nhanvien/tongquan";
			}

			if (tk.getVaitro().getMaVT().equals("QL")) {
				return "redirect:/quanly/tongquan";
			}

			

		} else {
			tk.setTrangThai(2);
			ss.setAttribute("user", tk);
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Đổi mật khẩu thất bại");
		}

		return "taikhoan/resetmk";
	}

	@RequestMapping(value = "dangnhap", method = RequestMethod.POST)
	public String postDangNhap(ModelMap model, HttpServletRequest request, HttpSession ss,
			@ModelAttribute("taikhoan") TaiKhoan taikhoan, BindingResult errors) {

		if (taikhoan.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "taikhoan", "Email không được để trống");
		}else
		if (!taikhoan.getEmail().trim().matches(
				"^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$")) {
			errors.rejectValue("email", "taikhoan", "Vui lòng nhập chính xác email của bạn!");
		}

		if (taikhoan.getMatKhau().trim().isEmpty()) {
			errors.rejectValue("matKhau", "taikhoan", "Mật khẩu không được để trống");
		}
		if (errors.hasErrors()) {
			return "taikhoan/dangnhap";
		}

		if (taiKhoanService.kiemTraDangNhap(taikhoan.getEmail(), taikhoan.getMatKhau())) {
			TaiKhoan thongtinTk = taiKhoanService.getByEmail(taikhoan.getEmail());

			if (thongtinTk.getTrangThai() == 0) {
				model.addAttribute("message",
						"Tài khoản chưa được kích hoạt hoặc đã bị khóa, vui lòng liên hệ với bộ phận hỗ trợ của chúng tôi!");
				return "taikhoan/dangnhap";
			}

			if (thongtinTk.getVaitro().getMaVT().equals("KH")) {
				if (thongtinTk.getKhachHang() == null) {
					model.addAttribute("message", "Thông tin đăng nhập không hợp lệ");
					return "taikhoan/dangnhap";
				}
				ss.setAttribute("user", thongtinTk);

				ss.setAttribute("maUser", thongtinTk.getKhachHang().getMaKH());
				if (thongtinTk.getTrangThai() == 2) {
					return "redirect:/resetmk";
				}

				return "redirect:/trangchu";
			} else if (thongtinTk.getVaitro().getMaVT().equals("NV")) {

				if (thongtinTk.getNhanVien() == null) {
					model.addAttribute("message", "Thông tin đăng nhập không hợp lệ");
					return "taikhoan/dangnhap";
				}
				ss.setAttribute("user", thongtinTk);

				ss.setAttribute("maUser", thongtinTk.getNhanVien().getMaNV());
				if (thongtinTk.getTrangThai() == 2) {
					return "redirect:/resetmk";
				}

				return "redirect:/nhanvien/tongquan";
			} else if (thongtinTk.getVaitro().getMaVT().equals("QL")) {
				if (thongtinTk.getNhanVien() == null) {
					model.addAttribute("message", "Thông tin đăng nhập không hợp lệ");
					return "taikhoan/dangnhap";
				}
				ss.setAttribute("user", thongtinTk);
				ss.setAttribute("maUser", thongtinTk.getNhanVien().getMaNV());
				if (thongtinTk.getTrangThai() == 2) {
					return "redirect:/resetmk";
				}

				return "redirect:/quanly/tongquan";
			}

			return "redirect:/quanly/tongquan";
		}
		model.addAttribute("message", "Sai thông tin tài khoản hoặc mật khẩu");

		return "taikhoan/dangnhap";
	}

	@RequestMapping(value = "dangky", method = RequestMethod.POST)
	public String postDangKy(ModelMap model, @ModelAttribute("tkdangky") KhachHang khachHang, BindingResult errors,
			@RequestParam("email-register") String email, @RequestParam("password-register") String matKhau,
			@RequestParam("confirm-password-register") String xnMatKhau) {

		if (khachHang.getHo().trim().isEmpty()) {
			errors.rejectValue("ho", "tkdangky", "Họ không được để trống");
		}

		if (khachHang.getTen().trim().isEmpty()) {
			errors.rejectValue("ten", "tkdangky", "Tên không được để trống");
		}

		if (email == "") {
			model.addAttribute("email", "Email không thể để trống");
			return "taikhoan/dangky";
		}

		if (matKhau == "") {
			model.addAttribute("password", "Mật khẩu không thể để trống");
			return "taikhoan/dangky";
		}

		if (xnMatKhau == "") {
			model.addAttribute("confirmPassword", "Mật khẩu xác nhận không thể để trống");
			return "taikhoan/dangky";
		}

		if(matKhau.trim().length() <6) {
			model.addAttribute("password", "Mật khẩu phải tổi thiểu 6 kí tự");
			return "taikhoan/dangky";
		}
		
		if (matKhau != "" && xnMatKhau != "" && !xnMatKhau.equals(matKhau)) {
			model.addAttribute("confirmPassword", "Mật khẩu và mật khẩu xác nhận không trùng nhau");
			return "taikhoan/dangky";
		}

		if (khachHang.getSdt().trim().isEmpty()) {
			errors.rejectValue("sdt", "tkdangky", "Số điện thoại không được để trống");
		}

		if (khachHang.getDiaChi().trim().isEmpty()) {
			errors.rejectValue("diaChi", "tkdangky", "Địa chỉ không được để trống");
		}
		if (errors.hasErrors()) {
			return "taikhoan/dangky";
		}

//		System.out.println("khahchang " + khachhang.getHo());
//		
//		System.out.println("email " + email);

		if (taiKhoanService.emailDaCo(email)) {
			model.addAttribute("email", "Email đã được sử dụng");
			return "taikhoan/dangky";
		}

		if (khachHangService.getBySdt(khachHang.getSdt()) != null) {
			errors.rejectValue("sdt", "tkdangky", "Số điện thoại đã được sử dụng");
			return "taikhoan/dangky";
		}

		TaiKhoan taiKhoan = taiKhoanService.setTK(email.trim(), matKhau);
		taiKhoanService.themKH(taiKhoan);

		khachHang.setMaKH(khachHangService.taoMaKHMoi());
		khachHang.setTaiKhoan(taiKhoan);
		if (khachHangService.themKH(khachHang)) {
			model.addAttribute("tkdangky", new KhachHang());
			model.addAttribute("message", "Tạo tài khoản thành công");
		} else {
			model.addAttribute("message", "Tạo tài khoản thất bại");
		}

		return "taikhoan/dangky";
	}

	@RequestMapping(value = "tongquan/{maNV}", params = "chinhsua", method = RequestMethod.GET)
	public String getLoginUser(@PathVariable("maNV") String maNV, HttpSession ss, ModelMap model) {

		NhanVien nhanvien = nhanVienService.getByMaNV(maNV);
		model.addAttribute("thongTinNV", nhanvien);
//			model.addAttribute("isOpenModalEditUser", true);

		return "quantri/include/taikhoan";
	}

	@RequestMapping(value = "tongquan/{maNV}", params = "chinhsua", method = RequestMethod.POST)
	public String postLoginUser(ModelMap model, HttpSession ss, @ModelAttribute("thongTinNV") NhanVien nhanvien,
			@RequestParam("anhMoi") MultipartFile anh, @PathVariable("maNV") String maNV, BindingResult errors) {
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (nhanvien.getHo().trim().isEmpty()) {
			errors.rejectValue("ho", "thongTinNV", "Họ không được để trống");
		}

		if (nhanvien.getTen().trim().isEmpty()) {
			errors.rejectValue("ten", "thongTinNV", "Tên không được để trống");
		}

		/*
		 * if (nhanvien.getTaiKhoan().getEmail().trim().isEmpty() ||
		 * !nhanvien.getTaiKhoan().getEmail().trim().matches(
		 * "^[a-zA-Z0-9.!#$%&'*+\\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
		 * )) { errors.rejectValue("taiKhoan.email", "thongTinNV",
		 * "Email không hợp lệ hoặc bị trống"); }
		 */

		if (nhanvien.getPhai() != true && nhanvien.getPhai() != false) {
			errors.rejectValue("phai", "thongTinNV", "???");
		}

		if (nhanvien.getNgaySinh() == null) {
			errors.rejectValue("ngaySinh", "thongTinNV", "Ngày sinh không được để trống");
		}

		if (nhanvien.getCccd().trim().isEmpty()) {
			errors.rejectValue("cccd", "thongTinNV", "Cccd không được để trống");
		} else if (!nhanvien.getCccd().trim().matches("^[0-9]*$")) {
			errors.rejectValue("cccd", "thongTinNV", "Cccd không hợp lệ");
		}

		if (nhanvien.getSdt().trim().isEmpty()) {
			errors.rejectValue("sdt", "thongTinNV", "Số điện thoại không được để trống");
		} else if (!nhanvien.getSdt().trim().matches("^[0-9]*$")) {
			errors.rejectValue("sdt", "thongTinNV", "Số điện thoại không hợp lệ");
		}

		if (errors.hasErrors()) {
//			model.addAttribute("isOpenModalEditUser", true);
			nhanvien.getTaiKhoan().setEmail(tk.getEmail());
			model.addAttribute("thongTinNV", nhanvien);
			return "quantri/include/taikhoan";
		}

		NhanVien nhanviencu = nhanVienService.getByMaNV(maNV);
		if (nhanviencu != null) {
			if (!nhanviencu.getHo().equals(nhanvien.getHo()))
				nhanviencu.setHo(nhanvien.getHo());
			if (!nhanviencu.getTen().equals(nhanvien.getTen())) {
				nhanviencu.setTen(nhanvien.getTen());
			}
			if (!nhanviencu.getNgaySinh().equals(nhanvien.getNgaySinh())) {
				nhanviencu.setNgaySinh(nhanvien.getNgaySinh());
			}
			if (!nhanviencu.getCccd().equals(nhanvien.getCccd())) {
				nhanviencu.setCccd(nhanvien.getCccd());
			}
			if (!nhanviencu.getDiaChi().equals(nhanvien.getDiaChi())) {
				nhanviencu.setDiaChi(nhanvien.getDiaChi());
			}

			if (!nhanviencu.getSdt().equals(nhanvien.getSdt())) {
				if (nhanVienService.getBySdt(nhanvien.getSdt()) != null) {
					errors.rejectValue("sdt", "thongTinNV", "Số điện thoại đã được sử dụng");
//					model.addAttribute("isOpenModalEditUser", true);
					return "quantri/include/taikhoan";
				} else {
					nhanviencu.setSdt(nhanvien.getSdt());
				}
			}

			if (nhanviencu.getPhai() != nhanvien.getPhai()) {
				nhanviencu.setPhai(nhanvien.getPhai());
			}
//			if (!nhanviencu.getTaiKhoan().getEmail().equals(nhanvien.getTaiKhoan().getEmail())) {
//				if (taiKhoanService.emailDaCo(nhanvien.getTaiKhoan().getEmail())) {
//					errors.rejectValue("taiKhoan.email", "thongTinNV", "Email đã được sử dụng");
////					model.addAttribute("isOpenModalEditUser", true);
//					return "quantri/include/taikhoan";
//				} else {
//					nhanviencu.getTaiKhoan().setEmail(nhanvien.getTaiKhoan().getEmail());
//				}
//
//			}

//			if (nhanviencu.getTaiKhoan().getTrangThai() != nhanvien.getTaiKhoan().getTrangThai()) {
//				nhanviencu.getTaiKhoan().setTrangThai(nhanvien.getTaiKhoan().getTrangThai());
//			}

			if (!anh.isEmpty()) {
				String hinh = "";
				hinh = utilService.luuFile(anh);
				if (!hinh.isEmpty()) {
					nhanviencu.setAnh(hinh);
				}
			}

			if (nhanVienService.suaNV(nhanviencu)) {

				model.addAttribute("thongTinNV", nhanviencu);
				tk.setNhanVien(nhanviencu);
				ss.setAttribute("user", tk);
				model.addAttribute("isSuccess", true);
				model.addAttribute("alertMessage", "Sửa nhân viên thành công");
			}
		}

		else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Sửa nhân viên thất bại");
		}

		return "quantri/include/taikhoan";
	}

	@RequestMapping(value = "tongquan/{maNV}", params = "doimatkhau", method = RequestMethod.POST)
	public String resetMatKhau(ModelMap model, HttpSession ss, @RequestParam("s-password") String spass,
			@RequestParam("new-password") String newpass, @RequestParam("confirm-password") String confpass) {

		if (spass == "") {
			model.addAttribute("sPassword", "Chưa nhập mật khẩu hiện tại");
			return "quantri/include/taikhoan";
		}

		if (newpass == "") {
			model.addAttribute("newPassword", "Chưa nhập mật khẩu mới");
			return "quantri/include/taikhoan";
		}

		if (confpass == "") {
			model.addAttribute("confirmPassword", "Chưa nhập mật khẩu xác nhận");
			return "quantri/include/taikhoan";
		}

		if (!newpass.equals(confpass)) {
			model.addAttribute("confirmPassword", "Mật khẩu và mật khẩu xác nhận khác nhau");
			return "quantri/include/taikhoan";
		}

		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");

		if (taiKhoanService.kiemTraDangNhap(tk.getEmail(), spass)) {
			taiKhoanService.thayDoiMK(tk, newpass);
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Thay đổi thành công");
		} else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Thay đổi thất bại");
		}
		model.addAttribute("thongTinNV", tk.getNhanVien());
		return "quantri/include/taikhoan";
	}

	@RequestMapping(value = "quenmatkhau", method = RequestMethod.POST)
	public String postQuenMatKhau(ModelMap model, HttpSession ss, @ModelAttribute("quenmatkhau") TaiKhoan taikhoan,
			BindingResult errors) {

		if (taikhoan.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "taikhoan", "Email không được để trống");
		}

		if (errors.hasErrors()) {
			return "taikhoan/quenmatkhau";
		}

		if (taiKhoanService.checkEmailExcept(taikhoan.getEmail())) {
			TaiKhoan thongtinTk = taiKhoanService.getByEmail(taikhoan.getEmail());

			Random generator = new Random();
			int ramdom = generator.nextInt(99999999) + 100000;
			String mkmoi = String.valueOf(ramdom);
			
			thongtinTk.setTrangThai(2);
			taiKhoanService.thayDoiMK(thongtinTk, mkmoi);
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message);

			try {
				helper.setFrom("no-reply-email");
				helper.setTo(thongtinTk.getEmail());
				helper.setSubject("Đổi mật khẩu thành công!");
				helper.setText("Mật khẩu mới của quý khách là: " + mkmoi);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mailSender.send(message);
			model.addAttribute("message", "Vui lòng kiểm tra Email!");
			return "taikhoan/quenmatkhau";

		}
		model.addAttribute("message", "Quên mật khẩu thất bại");

		return "taikhoan/quenmatkhau";
	}

}
