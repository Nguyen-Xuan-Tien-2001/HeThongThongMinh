package cnpm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cnpm.entity.ChiTietDonHang;
import cnpm.entity.ChiTietPhieuNhap;
import cnpm.entity.ChiTietPhieuNhapPK;
import cnpm.entity.ChiTietSanPham;
import cnpm.entity.DanhMucSanPham;
import cnpm.entity.DonHang;
import cnpm.entity.KhachHang;
import cnpm.entity.MauSanPham;
import cnpm.entity.NhaCungCap;
import cnpm.entity.NhanVien;
import cnpm.entity.PhieuNhap;
import cnpm.entity.SanPham;
import cnpm.entity.SizeSanPham;
import cnpm.entity.TaiKhoan;
import cnpm.model.ThongKeTheoSP;
import cnpm.model.ThongTinChiTietPN;
import cnpm.service.ChiTietDonHangService;
import cnpm.service.ChiTietPhieuNhapService;
import cnpm.service.ChiTietSanPhamService;
import cnpm.service.DanhMucSanPhamService;
import cnpm.service.DonHangService;
import cnpm.service.KhachHangService;
import cnpm.service.MauService;
import cnpm.service.NhaCungCapService;
import cnpm.service.NhanVienService;
import cnpm.service.PhieuNhapService;
import cnpm.service.SanPhamService;
import cnpm.service.SizeService;
import cnpm.service.TaiKhoanService;
import cnpm.service.UtilsService;

@Controller
@RequestMapping("/nhanvien/")
public class NhanVienController {

	@Autowired
	NhanVienService nhanVienService;

	@Autowired
	TaiKhoanService taiKhoanService;

	@Autowired
	KhachHangService khachHangService;

	@Autowired
	DanhMucSanPhamService danhMucSanPhamService;

	@Autowired
	NhaCungCapService nhaCungCapService;

	@Autowired
	PhieuNhapService phieuNhapService;

	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;

	@Autowired
	ChiTietPhieuNhapService chiTietPhieuNhapService;

	@Autowired
	ChiTietDonHangService chiTietDonHangService;

	@Autowired
	SizeService sizeService;

	@Autowired
	MauService mauService;

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	DonHangService donHangService;

	@Autowired
	UtilsService utilService;

	// ============== List ==========================
	List<ThongTinChiTietPN> thongTinChiTietPN = new ArrayList<ThongTinChiTietPN>();
	List<ThongKeTheoSP> thongKeTheoSP = new ArrayList<ThongKeTheoSP>();
	boolean check = false;
//	============== Model - Attribute ==============

	@ModelAttribute("danhSachThongKeTheoSP")
	public List<ThongKeTheoSP> dsThongKe(HttpSession ss) {
		thongKeTheoSP.clear();
		List<ChiTietDonHang> dh = chiTietDonHangService.getDSCTDH();
		if(dh == null) {
			return thongKeTheoSP;
		}
		for (int i = 0; i < dh.size(); i++) {
			boolean check = false;
			double doanhthu = (double) (dh.get(i).getGia()*dh.get(i).getSoLuong());
			for (int j = 0; j < thongKeTheoSP.size(); j++) {
				if (dh.get(i).getChiTietSP().getSanPham().getMaSP() == thongKeTheoSP.get(j).getMaSP()) {
					thongKeTheoSP.get(j).setDoanhThu(doanhthu + thongKeTheoSP.get(j).getDoanhThu());
					;
					check = true;
					break;
				}
			}
			if (check == false) {
				ThongKeTheoSP tk = new ThongKeTheoSP();
				tk.setMaSP(dh.get(i).getChiTietSP().getSanPham().getMaSP());
				tk.setTenSP(dh.get(i).getChiTietSP().getSanPham().getTenSP());
				tk.setDoanhThu(doanhthu);
				thongKeTheoSP.add(tk);
			}
		}
		return thongKeTheoSP;
	}

	@ModelAttribute("danhSachDonHang")
	public List<DonHang> getDSDH() {
		return donHangService.getDSDonHang();
	}

	@ModelAttribute("danhSachNhaCungCap")
	public List<NhaCungCap> getDSNCC() {
		return nhaCungCapService.getDSNhaCungCap();
	}

	@ModelAttribute("danhSachMau")
	public List<MauSanPham> getDSMau() {
		List<MauSanPham> list = mauService.getDSMau();
		return list;
	}

	@ModelAttribute("danhSachSize")
	public List<SizeSanPham> getDSSize() {
		List<SizeSanPham> list = sizeService.getDSSize();
		return list;
	}

	@ModelAttribute("danhSachSanPham")
	public List<SanPham> getDSSanPham() {
		List<SanPham> list = sanPhamService.getDSSanPham();
		return list;
	}

	@ModelAttribute("danhSachPhieuNhap")
	public List<PhieuNhap> getDSPhieuNhap() {
		List<PhieuNhap> list = phieuNhapService.getDSPhieuNhap();
		return list;
	}

	@ModelAttribute("danhSachNhaCungCap")
	public List<NhaCungCap> getDSNhaCungCap() {
		List<NhaCungCap> list = nhaCungCapService.getDSNhaCungCap();
		return list;
	}

	@ModelAttribute("thongTinSP")
	public SanPham thongTinSP() {
		return new SanPham();
	}

	@ModelAttribute("sanPhamMoi")
	public SanPham sanPhamMoi() {
		return new SanPham();
	}

	@ModelAttribute("thongTinDH")
	public DonHang thongTinDH() {
		return new DonHang();
	}

	@ModelAttribute("CTSP")
	public ChiTietSanPham ctSPMoi() {
		return new ChiTietSanPham();
	}

	@ModelAttribute("CTPhieuNhapMoi")
	public ChiTietPhieuNhap ctPhieuNhapMoi() {
		return new ChiTietPhieuNhap();
	}

	@ModelAttribute("phieuNhapMoi")
	public PhieuNhap phieuNhapMoi(ModelMap model) {
		return new PhieuNhap();
	}

	@ModelAttribute("thongTinPN")
	public PhieuNhap thongtinPN(ModelMap model) {
		return new PhieuNhap();
	}

	@ModelAttribute("thongTinKH")
	public KhachHang thongtinKh(ModelMap model) {

		return new KhachHang();
	}

	// khach hang

	@RequestMapping("tongquan")
	public String getViewTongQuan(ModelMap model) {
		return "quantri/nhanvien/tongquan";
	}

//	@RequestMapping(value = "khachhang",  method = RequestMethod.GET)
//	public String showList (ModelMap model) {
//		
//		List<KhachHang> danhSachKhachHang = this.getDSKhachHang();
//		model.addAttribute("danhSachKhachHang", danhSachKhachHang);
//		model.addAttribute("isOpenModalInfo", false);
//		
//		return "quantri/nhanvien/khachhang";
//	}

	@ModelAttribute("danhSachKhachHang")
	public List<KhachHang> getDSKhachHang() {
		List<KhachHang> list = khachHangService.getDSKhachHang();
		return list;
	}

	// danh muc

	@ModelAttribute("danhSachDanhMucSanPham")
	public List<DanhMucSanPham> dsDanhMucSanPham() {
		List<DanhMucSanPham> list = danhMucSanPhamService.getDSDanhMuc();
		return list;
	}

	@ModelAttribute("danhMucMoi")
	public DanhMucSanPham thongtinDM() {
		DanhMucSanPham thongTinDM = new DanhMucSanPham();
		return thongTinDM;
	}

	@ModelAttribute("thongTinDM")
	public DanhMucSanPham thongtinDm(ModelMap model) {

		return new DanhMucSanPham();
	}

	// nha cung cap

	@ModelAttribute("danhSachNhaCungCap")
	public List<NhaCungCap> dsNhaCungCap() {
		List<NhaCungCap> list = nhaCungCapService.getDSNhaCungCap();
		return list;
	}

	@ModelAttribute("nhaCungCapMoi")
	public NhaCungCap thongtinNCC() {
		NhaCungCap thongTinNCC = new NhaCungCap();
		return thongTinNCC;
	}

	@ModelAttribute("thongTinNCC")
	public NhaCungCap thongtinNcc(ModelMap model) {

		return new NhaCungCap();
	}

	// phiếu nhập
	@ModelAttribute("danhSachThongTinCTPN")
	public List<ThongTinChiTietPN> thongTinCTPN() {
		return thongTinChiTietPN;
	}

	@ModelAttribute("thongTinCTPNMoi")
	public ThongTinChiTietPN thongTinCTPNMoi() {
		return new ThongTinChiTietPN();
	}

	@ModelAttribute("thongTinCTPN")
	public ThongTinChiTietPN thongTinCTPNMoi(ModelMap model) {
		return new ThongTinChiTietPN();
	}

	@RequestMapping(value = "tongquan", method = RequestMethod.GET)
	public String getViewTongQuan() {

		return "quantri/nhanvien/tongquan";
	}

	@RequestMapping(value = "danhmucsp", method = RequestMethod.GET)
	public String getViewDanhMuc(ModelMap model) {
		model.addAttribute("isOpenModalInfo", false);

		return "quantri/nhanvien/danhmucsp";
	}

	@RequestMapping(value = "nhacungcap", method = RequestMethod.GET)
	public String getViewNhaCungCap(ModelMap model) {
		model.addAttribute("isOpenModalInfo", false);

		return "quantri/nhanvien/nhacungcap";
	}

	@RequestMapping(value = "khachhang", method = RequestMethod.GET)
	public String getViewKhachHang(ModelMap model) {
		model.addAttribute("isOpenModalInfo", false);

		return "quantri/nhanvien/khachhang";
	}

	@RequestMapping(value = "thongke", method = RequestMethod.GET)
	public String getViewThongKe(ModelMap model) {
		model.addAttribute("isOpenModalInfo", false);

		return "quantri/nhanvien/thongke";
	}

	/// Khách hàng

	@RequestMapping(value = "khachhang/{maKH}", params = "thongtin", method = RequestMethod.GET)
	public String getThongtin1KhachHang(ModelMap model, @PathVariable("maKH") String maKH) {

		KhachHang khachhang = khachHangService.getByMaKH(maKH);
		if (khachhang != null) {
			model.addAttribute("thongTinKH", khachhang);
			model.addAttribute("isOpenModalInfo", true);

		}

		return "quantri/nhanvien/khachhang";
	}

	@RequestMapping(value = "khachhang/{maKH}", params = "suaThongtin", method = RequestMethod.GET)
	public String getSuaKhachHang(ModelMap model, @PathVariable("maKH") String maKH) {

		KhachHang khachhang = khachHangService.getByMaKH(maKH);

		if (khachhang != null) {
			model.addAttribute("thongTinKH", khachhang);
			model.addAttribute("isOpenModalEdit", true);

		}

		return "quantri/nhanvien/khachhang";
	}
	
	@RequestMapping(value = "khachhang/{maKH}", params = "suaKH", method = RequestMethod.POST)
	public String postSuaKhachHang(ModelMap model, @ModelAttribute("thongTinKH") KhachHang khachhang,
			@PathVariable("maKH") String maKH, BindingResult errors) {

		KhachHang kh = khachHangService.getByMaKH(maKH);
		TaiKhoan taikhoan = taiKhoanService.getByMaTK(kh.getTaiKhoan().getMaTK());

		//taikhoan.setTrangThai(khachhang.getTaiKhoan().getTrangThai());

		if (taiKhoanService.suaTK(taikhoan)) {
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Thay đổi trạng thái thành công");
			model.addAttribute("danhSachKhachHang", khachHangService.getDSKhachHang());
		}

		else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Thay đổi trạng thái thất bại");
		}

		return "quantri/nhanvien/khachhang";

	}

	@RequestMapping(value = "danhmucsp", params = "themDM", method = RequestMethod.POST)
	public String themMoiDanhMuc(ModelMap model, @ModelAttribute("danhMucMoi") DanhMucSanPham danhmucsp,
			BindingResult errors) {
		if (danhmucsp.getTenDM().trim().isEmpty()) {
			errors.rejectValue("tenDM", "danhMucMoi", "Tên danh mục không được trống");
		}

		if (errors.hasErrors()) {
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/danhmucsp";
		}

		if (danhMucSanPhamService.themDM(danhmucsp)) {

			model.addAttribute("danhmucMoi", new DanhMucSanPham());
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Thêm danh mục thành công");
			model.addAttribute("danhSachDanhMucSanPham", danhMucSanPhamService.getDSDanhMuc());
		} else {
			model.addAttribute("alertMessage", "Thêm danh mục thất bại");
		}

		return "quantri/nhanvien/danhmucsp";
	}

	// Sửa thông tin Danh mục

	@RequestMapping(value = "danhmucsp/{maDM}", params = "thongtin", method = RequestMethod.GET)
	public String getThongtin1DanhMuc(ModelMap model, @PathVariable("maDM") Integer maDM) {

		DanhMucSanPham danhmuc = danhMucSanPhamService.getByMaDM(maDM);
		if (danhmuc != null) {
			model.addAttribute("thongTinDM", danhmuc);
			model.addAttribute("isOpenModalInfo", true);

		}

		return "quantri/nhanvien/danhmucsp";
	}

	@RequestMapping(value = "danhmucsp/{maDM}", params = "suaThongtin", method = RequestMethod.GET)
	public String getSuaDanhMuc(ModelMap model, @PathVariable("maDM") Integer maDM) {

		DanhMucSanPham danhMucsp = danhMucSanPhamService.getByMaDM(maDM);

		if (danhMucsp != null) {
			model.addAttribute("thongTinDM", danhMucsp);
			model.addAttribute("isOpenModalEdit", true);

		}

		return "quantri/nhanvien/danhmucsp";
	}

	@RequestMapping(value = "danhmucsp/{maDM}", params = "suaThongtin", method = RequestMethod.POST)
	public String postSuaDanhMuc(ModelMap model, @ModelAttribute("thongTinDM") DanhMucSanPham danhmucsp,
			@PathVariable("maDM") Integer maDM, BindingResult errors) {

		if (danhmucsp.getTenDM().trim().isEmpty()) {
			errors.rejectValue("tenDM", "thongTinDM", "Tên danh mục không được trống");
		}
		if (errors.hasErrors()) {
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/danhmucsp";
		}

		DanhMucSanPham danhmuccu = danhMucSanPhamService.getByMaDM(maDM);
		if (danhmuccu != null) {
			System.out.println(1);
			if (!danhmuccu.getTenDM().equals(danhmucsp.getTenDM()))
				danhmuccu.setTenDM(danhmucsp.getTenDM());
		}
		if (danhMucSanPhamService.suaDM(danhmuccu)) {
			model.addAttribute("thongTinDM", new DanhMucSanPham());
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Sửa danh mục thành công");
			model.addAttribute("danhSachDanhMucSanPham", danhMucSanPhamService.getDSDanhMuc());
		}

		else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Sửa danh mục thất bại");
			System.out.println(3);
		}

		return "quantri/nhanvien/danhmucsp";
	}

	@RequestMapping(value = "danhmucsp", params = "xoadm", method = RequestMethod.POST)
	public String postXoaDanhMuc(ModelMap model, @RequestParam("maDM") Integer maDM) {

		// System.out.println(danhmucsp.getMaDM());
		DanhMucSanPham danhmucsp = danhMucSanPhamService.getByMaDM(maDM);
		if (danhmucsp == null) {
			if (danhmucsp.getSanPhams() != null) {
				model.addAttribute("isSuccess", false);
				model.addAttribute("alertMessage", "Xóa danh mục thất bại");
			}
		}
		if (danhmucsp.getSanPhams().size() == 0) {
			danhMucSanPhamService.xoaDM(danhmucsp);
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Xóa danh mục thành công");
			model.addAttribute("danhSachDanhMucSanPham", danhMucSanPhamService.getDSDanhMuc());

		}
		if (danhmucsp.getSanPhams().size() > 0) {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Xóa danh mục thất bại");
		}

		return "quantri/nhanvien/danhmucsp";
	}

	// ------ Nhà cung cấp

	@RequestMapping(value = "nhacungcap", params = "themNCC", method = RequestMethod.POST)
	public String themMoiNhaCungCap(ModelMap model, @ModelAttribute("nhaCungCapMoi") NhaCungCap nhacungcap,
			BindingResult errors) {

		if (nhacungcap.getTenNCC().trim().isEmpty()) {
			errors.rejectValue("tenNCC", "thongTinNCC", "Tên danh mục không được trống");
		}

		if (nhacungcap.getSdt().trim().isEmpty()) {
			errors.rejectValue("sdt", "thongTinNCC", "Số điện thoại không được trống");
		} else if (!nhacungcap.getSdt().trim().matches("^[0-9]*$")) {
			errors.rejectValue("sdt", "nhanVienMoi", "Số điện thoại không hợp lệ");
		}

		if (nhacungcap.getDiaChi().trim().isEmpty()) {
			errors.rejectValue("diaChi", "thongTinNCC", "Địa chỉ không được trống");
		}

		if (errors.hasErrors()) {
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/nhacungcap";
		}

		if (nhaCungCapService.themNCC(nhacungcap)) {

			model.addAttribute("nhaCungCapMoi", new NhaCungCap());
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Thêm nhà cung cấp thành công");
			model.addAttribute("danhSachNhaCungCap", nhaCungCapService.getDSNhaCungCap());
		} else {
			model.addAttribute("alertMessage", "Thêm danh mục thất bại");
		}

		return "quantri/nhanvien/nhacungcap";
	}

	@RequestMapping(value = "nhacungcap/{maNCC}", params = "thongtin", method = RequestMethod.GET)
	public String getThongtin1NhaCungCap(ModelMap model, @PathVariable("maNCC") Integer maNCC) {

		NhaCungCap nhacungcap = nhaCungCapService.getByMaNCC(maNCC);
		if (nhacungcap != null) {
			model.addAttribute("thongTinNCC", nhacungcap);
			model.addAttribute("isOpenModalInfo", true);

		}
		return "quantri/nhanvien/nhacungcap";
	}

	@RequestMapping(value = "nhacungcap/{maNCC}", params = "suaThongtin", method = RequestMethod.GET)
	public String getSuaNhaCungCap(ModelMap model, @PathVariable("maNCC") Integer maNCC) {

		NhaCungCap nhacungcap = nhaCungCapService.getByMaNCC(maNCC);

		if (nhacungcap != null) {
			model.addAttribute("thongTinNCC", nhacungcap);
			model.addAttribute("isOpenModalEdit", true);

		}

		return "quantri/nhanvien/nhacungcap";
	}

	@RequestMapping(value = "nhacungcap/{maNCC}", params = "suaThongtin", method = RequestMethod.POST)
	public String postSuaNhaCungCap(ModelMap model, @ModelAttribute("thongTinNCC") NhaCungCap nhacungcap,
			@PathVariable("maNCC") Integer maNCC, BindingResult errors) {

		if (nhacungcap.getTenNCC().trim().isEmpty()) {
			errors.rejectValue("tenNCC", "thongTinNCC", "Tên danh mục không được trống");
		}
		if (nhacungcap.getSdt().trim().isEmpty()) {
			errors.rejectValue("sdt", "thongTinNCC", "Số điện thoại không được trống");
		}
		if (nhacungcap.getDiaChi().trim().isEmpty()) {
			errors.rejectValue("diaChi", "thongTinNCC", "Địa chỉ không được trống");
		}
		if (errors.hasErrors()) {
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/nhacungcap";
		}

		NhaCungCap nhacungcapcu = nhaCungCapService.getByMaNCC(maNCC);
		if (nhacungcapcu != null) {

			if (!nhacungcapcu.getTenNCC().equals(nhacungcap.getTenNCC()))
				nhacungcapcu.setTenNCC(nhacungcap.getTenNCC());

			if (!nhacungcapcu.getSdt().equals(nhacungcap.getSdt()))
				nhacungcapcu.setSdt(nhacungcap.getSdt());

			if (!nhacungcapcu.getDiaChi().equals(nhacungcap.getDiaChi()))
				nhacungcapcu.setDiaChi(nhacungcap.getDiaChi());
		}
		if (nhaCungCapService.suaNCC(nhacungcapcu)) {
			model.addAttribute("thongTinDM", new NhaCungCap());
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Sửa nhà cung cấp thành công");
			model.addAttribute("danhSachNhaCungCap", nhaCungCapService.getDSNhaCungCap());
		}

		else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Sửa nhà cung cấp thất bại");
		}

		return "quantri/nhanvien/nhacungcap";
	}

	@RequestMapping(value = "nhacungcap", params = "xoancc", method = RequestMethod.POST)
	public String postXoaNhaCungCap(ModelMap model, @RequestParam("maNCC") Integer maNCC) {

		System.out.println(maNCC);
		NhaCungCap nhacungcap = nhaCungCapService.getByMaNCC(maNCC);
		if (nhacungcap == null) {
			System.out.println(1);
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Xóa nhà cung cấp thất bại");
		}
		if (nhacungcap.getPhieuNhap().size() == 0) {
			System.out.println(2);
			nhaCungCapService.xoaNCC(nhacungcap);
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Xóa nhà cung cấp thành công");
			model.addAttribute("danhSachNhaCungCap", nhaCungCapService.getDSNhaCungCap());

		}
		if (nhacungcap.getPhieuNhap().size() > 0) {
			System.out.println(3);
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Xóa nhà cung cấp thất bại");
		}

		return "quantri/nhanvien/nhacungcap";
	}

	//// Lỗi không biết sữa

	@RequestMapping(value = "donhang", method = RequestMethod.GET)
	public String getViewDonHang() {
		return "quantri/nhanvien/donhang";
	}

	@RequestMapping(value = "donhang/{maDH}", params = "thongtin", method = RequestMethod.GET)
	public String getThongTinDonHang(ModelMap model, @PathVariable("maDH") Integer maDH) {

		if (maDH != null) {
			DonHang donhang = donHangService.getByMaDH(maDH);

			if (donhang != null) {
				List<ChiTietDonHang> chitietdonhang = chiTietDonHangService.getDSByMaDH(maDH);
				if (chitietdonhang.size() > 0) {
					model.addAttribute("chitietdonhang", chitietdonhang);
				} else {
					model.addAttribute("chitietdonhang", new ArrayList<ChiTietDonHang>());
				}

				model.addAttribute("thongTinDH", donhang);
				model.addAttribute("isOpenModalInfo", true);
			}
		}

		return "quantri/nhanvien/donhang";
	}

	@RequestMapping(value = "donhang/{maDH}", params = "suaTrangthai", method = RequestMethod.GET)
	public String getTrangThaiNhanVien(ModelMap model, @PathVariable("maDH") Integer maDH) {

		if(maDH == null) {
			return "quantri/nhanvien/donhang";
		}
		
		DonHang donhang = donHangService.getByMaDH(maDH);

		System.out.println(donhang.getTrangThaiDH().getMaTTDH());

		if (donhang != null) {
			model.addAttribute("thongTinDH", donhang);
			model.addAttribute("isOpenModalEdit", true);

			System.out.println(2);
		}
		return "quantri/nhanvien/donhang";
	}

	@RequestMapping(value = "donhang/{maDH}", params = "suaDH", method = RequestMethod.POST)
	public String postTrangThaiDonHang(ModelMap model, @PathVariable("maDH") Integer maDH,
			@ModelAttribute("thongTinDH") DonHang donhang, BindingResult errors) {
		
		if(maDH == null) {
			return "quantri/nhanvien/donhang";
		}
		
		if(donhang.getTrangThaiDH() == null) {
			errors.rejectValue("trangThaiDH", "thongTinDH", "Vui lòng chọn trạng thái đơn hàng");
			model.addAttribute("isOpenModalEdit", true);
			return "quantri/nhanvien/donhang";
		}

		if(donhang.getTrangThaiDH().getMaTTDH() == 1) {
			errors.rejectValue("trangThaiDH", "thongTinDH", "Vui lòng chọn trạng thái đơn hàng phù hợp");
			model.addAttribute("isOpenModalEdit", true);
			return "quantri/nhanvien/donhang";
		}
		
		DonHang donhangcu = donHangService.getByMaDH(maDH);
		if (donhangcu != null) {
			if (donhangcu.getTrangThaiDH().getMaTTDH() == 5 && donhang.getTrangThaiDH().getMaTTDH() != 5) {

				errors.rejectValue("trangThaiDH", "thongTinDH", "Đơn hàng đã bị hủy trươc đó");
				model.addAttribute("isOpenModalEdit", true);
				return "quantri/nhanvien/donhang";
			}
			if (donhangcu.getTrangThaiDH().getMaTTDH() == 1 && (donhang.getTrangThaiDH().getMaTTDH() == 3 || donhang.getTrangThaiDH().getMaTTDH() == 4)) {
				errors.rejectValue("trangThaiDH", "thongTinDH", "Đơn hàng chưa được xác nhận");
				model.addAttribute("isOpenModalEdit", true);
				return "quantri/nhanvien/donhang";
			}

			if (donhang.getTrangThaiDH().getMaTTDH() == 5 && donhangcu.getTrangThaiDH().getMaTTDH() != 5 ) {
				errors.rejectValue("trangThaiDH", "thongTinDH", "Đơn hàng không thể hủy");
				model.addAttribute("isOpenModalEdit", true);
				return "quantri/nhanvien/donhang";
			}

			if (donhangcu.getTrangThaiDH().getMaTTDH() == 3 && donhang.getTrangThaiDH().getMaTTDH() == 2) {
				errors.rejectValue("trangThaiDH", "thongTinDH", "Đơn hàng đã được xác nhận và đang được vẫn  chuyển");
				model.addAttribute("isOpenModalEdit", true);
				return "quantri/nhanvien/donhang";
			}
			
			if (donhangcu.getTrangThaiDH().getMaTTDH() == 4 && donhang.getTrangThaiDH().getMaTTDH() != 4) {
				errors.rejectValue("trangThaiDH", "thongTinDH", "Đơn hàng đã giao thành công trước đó");
				model.addAttribute("isOpenModalEdit", true);
				return "quantri/nhanvien/donhang";
			}

			donhangcu.getTrangThaiDH().setMaTTDH(donhang.getTrangThaiDH().getMaTTDH());

			if (donHangService.suaDH(donhangcu)) {
				String email = donhangcu.getKhachHang().getTaiKhoan().getEmail();
				String noidung;
			
				if(donhang.getTrangThaiDH().getMaTTDH() == 2) {
					noidung = "đã được xác nhận.";
					boolean c = utilService.guiEmail(email, noidung, 1);
				}
				else if(donhang.getTrangThaiDH().getMaTTDH() == 3) {
					noidung = "đang được vận chuyển.";
					boolean c = utilService.guiEmail(email, noidung, 1);
				}
				else if(donhang.getTrangThaiDH().getMaTTDH() == 4) {
					noidung = "đã được giao thành công.";
					boolean c = utilService.guiEmail(email, noidung, 1);
				}
				
				model.addAttribute("isSuccess", true);
				model.addAttribute("alertMessage", "Thay đổi trạng thái thành công");
				model.addAttribute("danhSachDonHang", donHangService.getDSDonHang());
			} else {
				model.addAttribute("isSuccess", false);
				model.addAttribute("alertMessage", "Thay đổi trạng thái thất bại");
			}

		} else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Thay đổi trạng thái thất bại");
		}

		return "quantri/nhanvien/donhang";
	}

	// san pham
	@RequestMapping(value = "sanpham", method = RequestMethod.GET)
	public String getViewSanpham() {
		return "quantri/nhanvien/sanpham";
	}

	@RequestMapping(value = "sanpham/{maSP}", params = "thongtin", method = RequestMethod.GET)
	public String thongTin1SanPham(ModelMap model, @PathVariable("maSP") Integer maSP) {
		SanPham sanpham = sanPhamService.getByMaSP(maSP);
		if (sanpham != null) {
			model.addAttribute("thongTinSP", sanpham);
			model.addAttribute("isOpenModalInfo", true);
		}
		return "quantri/nhanvien/sanpham";
	}

//		@RequestParam("anhMoi") MultipartFile anh,
	@RequestMapping(value = "sanpham", params = "themSP", method = RequestMethod.POST)
	public String themMoiSanPham(ModelMap model, @ModelAttribute("sanPhamMoi") SanPham sanpham,
			@RequestParam("anhMoi") MultipartFile anh,
			@RequestParam(name = "size", required = false) List<Integer> listsize, BindingResult errors) {

		if (sanpham.getTenSP().trim().isEmpty()) {
			errors.rejectValue("tenSP", "sanPhamMoi", "Tên sản phẩm không được để trống");
		}

		if (sanpham.getGia() == 0) {
			errors.rejectValue("gia", "sanPhamMoi", "Giá không được để trống");
		}

		if (listsize == null) {
			model.addAttribute("size", "Phải chọn ít nhất 1 size sản phẩm");
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/sanpham";
		}

		if (errors.hasErrors()) {
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/sanpham";
		}

		if (anh == null) {
			model.addAttribute("anhMoi", "Hình ảnh không thể để trống");
			return "quantri/nhanvien/sanpham";
		}

		String hinh = "";
		System.out.println("anh " + anh);
		if (!anh.isEmpty()) {
			hinh = utilService.luuFile(anh);
			if (!hinh.isEmpty()) {
				sanpham.setHinhAnh(hinh);
			}
		}

		if (sanPhamService.themSP(sanpham)) {

			int masp = sanPhamService.maSPCuoiCung();
			ChiTietSanPham chiTietSanPham = new ChiTietSanPham();
			System.out.println(1);

			for (int i = 0; i < listsize.size(); i++) {
				System.out.println(2);
				SizeSanPham sizesanpham = sizeService.getByMaSize(listsize.get(i));
				chiTietSanPham.setSanPham(sanPhamService.getByMaSP(masp));
				chiTietSanPham.setSizeSanPham(sizesanpham);
				chiTietSanPham.setSoLuong(0);

				chiTietSanPhamService.themCTSP(chiTietSanPham);
				System.out.println(3);
			}
			model.addAttribute("sanPhamMoi", new SanPham());
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Thêm sản phẩm thành công");
			model.addAttribute("hinh", "");
			model.addAttribute("danhSachSanPham", sanPhamService.getDSSanPham());
		} else {

			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Thêm tài khoản thất bại");
		}

		return "quantri/nhanvien/sanpham";
	}

	@RequestMapping(value = "sanpham/{maSP}", params = "suaThongtin", method = RequestMethod.GET)
	public String getSuaSanPham(ModelMap model, @PathVariable("maSP") Integer maSP) {

		SanPham sanpham = sanPhamService.getByMaSP(maSP);

		if (sanpham != null) {
			model.addAttribute("thongTinSP", sanpham);
			model.addAttribute("isOpenModalEdit", true);

		}

		return "quantri/nhanvien/sanpham";
	}

	@RequestMapping(value = "sanpham/{maSP}", params = "suaSP", method = RequestMethod.POST)
	public String postSuaSanPham(ModelMap model, @ModelAttribute("thongTinSP") SanPham sanpham,
			@RequestParam("anhMoi") MultipartFile anh, @PathVariable("maSP") Integer maSP, BindingResult errors) {

		if (sanpham.getTenSP().trim().isEmpty()) {
			errors.rejectValue("tenSP", "sanPhamMoi", "Tên sản phẩm không được để trống");
		}

		if (sanpham.getGia() == 0) {
			errors.rejectValue("gia", "sanPhamMoi", "Giá không được để trống");
		}

		if (errors.hasErrors()) {
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/sanpham";
		}

		SanPham sanphamcu = sanPhamService.getByMaSP(maSP);
		if (sanphamcu != null) {
			if (!sanphamcu.getTenSP().equals(sanpham.getTenSP()))
				sanphamcu.setTenSP(sanpham.getTenSP());
			if (sanphamcu.getDanhMuc() != sanpham.getDanhMuc()) {
				sanphamcu.setDanhMuc(sanpham.getDanhMuc());
			}
			if (sanphamcu.getPhai() != sanpham.getPhai()) {
				sanphamcu.setPhai(sanpham.getPhai());
			}
			if (!sanphamcu.getMoTa().equals(sanpham.getMoTa())) {
				sanphamcu.setMoTa(sanpham.getMoTa());
			}
			if (sanphamcu.getGia() != sanpham.getGia()) {
				sanphamcu.setGia(sanpham.getGia());
			}
			if (sanphamcu.getGiamGia() != sanpham.getGiamGia()) {
				sanphamcu.setGiamGia(sanpham.getGiamGia());
			}
			if (sanphamcu.getMauSanPham() != sanpham.getMauSanPham()) {
				sanphamcu.setMauSanPham(sanpham.getMauSanPham());
			}

			if (!anh.isEmpty()) {
				String hinh = "";
				hinh = utilService.luuFile(anh);
				if (!hinh.isEmpty()) {
					sanphamcu.setHinhAnh(hinh);
				}
			}

			if (sanPhamService.suaSP(sanphamcu)) {
				model.addAttribute("thongTinNV", new NhanVien());
				model.addAttribute("isSuccess", true);
				model.addAttribute("alertMessage", "Sửa sản phẩm thành công");
				model.addAttribute("hinh", "");
				model.addAttribute("danhSachSanPham", sanPhamService.getDSSanPham());
			}
		}

		else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Sửa sản phẩm thất bại");
		}

		return "quantri/nhanvien/sanpham";
	}

	@RequestMapping(value = "sanpham/{maSP}", params = "thongtinchitiet", method = RequestMethod.GET)
	public String thongTinChiTiet1SanPham(ModelMap model, @PathVariable("maSP") Integer maSP) {

		List<ChiTietSanPham> list = chiTietSanPhamService.getByMaSP(maSP);

		if (list != null) {
			model.addAttribute("danhSachChiTietSanPham", list);
			model.addAttribute("isOpenModalInfoct", true);
		}
		return "quantri/nhanvien/sanpham";
	}

	@RequestMapping(value = "sanpham", params = "xoactsp", method = RequestMethod.POST)
	public String postXoaCTSP(ModelMap model, @RequestParam("maChiTietSP") Integer maCTSP) {

		System.out.println(maCTSP);
		ChiTietSanPham ctsp = chiTietSanPhamService.getByMaSCTSP(maCTSP);
		int masp = ctsp.getSanPham().getMaSP();

		if (ctsp != null) {
			if (ctsp.getSoLuong() != 0) {
				model.addAttribute("xoactsp", "Chi tiết này không được xóa");
			} else if (chiTietDonHangService.kiemTraCTDH(maCTSP)) {
				model.addAttribute("xoactsp", "Chi tiết này không được xóa");
			} else if (chiTietPhieuNhapService.kiemTraCTPN(maCTSP)) {
				model.addAttribute("xoactsp", "Chi tiết này không được xóa");
			} else {
				chiTietSanPhamService.xoaCTSP(ctsp);
				List<ChiTietSanPham> list = chiTietSanPhamService.getByMaSP(masp);
				if (list == null) {
					SanPham sanPham = sanPhamService.getByMaSP(masp);
					sanPhamService.xoaSP(sanPham);
					model.addAttribute("isSuccess", false);
					model.addAttribute("alertMessage", "Sản phẩm đã bị xóa vì sản phẩm không có chi tiết");
					model.addAttribute("danhSachSanPham", sanPhamService.getDSSanPham());
					return "quantri/nhanvien/sanpham";
				}
			}
		}
		model.addAttribute("danhSachChiTietSanPham", chiTietSanPhamService.getByMaSP(masp));
		model.addAttribute("isOpenModalInfoct", true);

		return "quantri/nhanvien/sanpham";
	}

	/// Phiếu nhập

	@RequestMapping(value = "phieunhap", method = RequestMethod.GET)
	public String getViewPhieuNhap(ModelMap model) {

		return "quantri/nhanvien/phieunhap";
	}
	
	@RequestMapping(value = "phieunhap", params = "huypn")
	public String huyPn(ModelMap model) {
		
		if(thongTinChiTietPN != null) {
			if(thongTinChiTietPN.size() > 0) {
				thongTinChiTietPN.clear();
				thongTinChiTietPN = new ArrayList<ThongTinChiTietPN>();
			}
		}
		
		return "redirect:/nhanvien/phieunhap";
	}
	
	@RequestMapping(value = "phieunhap", params = "themCTPN", method = RequestMethod.POST)
	public String themMoiThongTinCTPN(ModelMap model, HttpSession ss, @RequestParam("masp") Integer masp,
			@RequestParam(name = "size", required = false) Integer size,
			@RequestParam(name = "soluong", required = false) Integer soluong,
			@RequestParam(name = "gia", required = false) Float gia) {
		
		if(check == true) {
			thongTinChiTietPN.clear();
			check = false;
		}

		ThongTinChiTietPN thongtinctpn = new ThongTinChiTietPN();
		if (size == null) {
			model.addAttribute("size", "Chưa chọn size sản phẩm");
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/phieunhap";
		}
		
		if (soluong == null) {
			model.addAttribute("soluong", "Chưa nhập số lượng");
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/phieunhap";
		}
		
		if (gia == null) {
			model.addAttribute("gia", "Chưa nhập giá");
			model.addAttribute("isShowModalAddNew", true);
			return "quantri/nhanvien/phieunhap";
		}

		thongtinctpn.setMaTTCTPN(thongTinChiTietPN.size() + 1);
		thongtinctpn.setMaSP(masp);
		thongtinctpn.setMaSize(size);
		thongtinctpn.setSoLuong(soluong);
		thongtinctpn.setGia(gia);
		thongtinctpn.setTenSP(sanPhamService.getByMaSP(masp).getTenSP());
		System.out.println(thongtinctpn.getTenSP());
		thongtinctpn.setTenSize(sizeService.getByMaSize(size).getTenSize());

		for (int i = 0; i < thongTinChiTietPN.size(); i++) {
			if (thongTinChiTietPN.get(i).getMaSP() == masp && thongTinChiTietPN.get(i).getMaSize() == size) {
				thongTinChiTietPN.get(i).setSoLuong(thongTinChiTietPN.get(i).getSoLuong() + soluong);
				model.addAttribute("danhSachThongTinCTPN", thongTinChiTietPN);
				model.addAttribute("isShowModalAddNew", true);
				return "quantri/nhanvien/phieunhap";
			}
		}

		thongTinChiTietPN.add(thongtinctpn);
		model.addAttribute("danhSachThongTinCTPN", thongTinChiTietPN);
		model.addAttribute("isShowModalAddNew", true);

		return "quantri/nhanvien/phieunhap";
	}
	
	@RequestMapping(value = "phieunhap", params = "xoactpn", method = RequestMethod.POST)
	public String postXoaThongTinCTPN(ModelMap model, @RequestParam("maCTPN") Integer maCTPN) {

		System.out.println(maCTPN);
		for (int i = 0; i < thongTinChiTietPN.size(); i++) {
			if (thongTinChiTietPN.get(i).getMaTTCTPN() == maCTPN)
				thongTinChiTietPN.remove(i);
			break;
		}

		model.addAttribute("danhSachThongTinCTPN", thongTinChiTietPN);
		model.addAttribute("isShowModalAddNew", true);
		return "quantri/nhanvien/phieunhap";

	}

	@RequestMapping(value = "phieunhap", params = "themPN", method = RequestMethod.POST)
	public String themMoiPhieuNhap(ModelMap model, HttpSession ss,
			@RequestParam(name = "ncc", required = false) Integer ncc) {

		PhieuNhap phieunhap = new PhieuNhap();

		phieunhap.setNhaCungCap(nhaCungCapService.getByMaNCC(ncc));
		java.util.Date date = new java.util.Date();
		phieunhap.setThoiGian(date);

		double tongtien = 0;
		for (int i = 0; i < thongTinChiTietPN.size(); i++) {
			tongtien += (double)thongTinChiTietPN.get(i).getGia()
					* (double) thongTinChiTietPN.get(i).getSoLuong();
		}

		phieunhap.setTongTien(tongtien);

		String manv = ss.getAttribute("maUser").toString();
		NhanVien nv = nhanVienService.getByMaNV(manv);
		phieunhap.setNhanVien(nv);
//		

//		return "quantri/quanly/nhacungcap";
//	}

//		System.out.println(phieunhap.g);
		if (phieuNhapService.themPN(phieunhap)) {

			int mapn = phieuNhapService.maPNCuoiCung();
			phieunhap.setMaPN(mapn);

			ChiTietSanPham chiTietSP = new ChiTietSanPham();
			ChiTietPhieuNhap chiTietPN = new ChiTietPhieuNhap();
			ChiTietPhieuNhapPK chiTietPNPK = new ChiTietPhieuNhapPK();

			for (int i = 0; i < thongTinChiTietPN.size(); i++) {

				System.out.println(thongTinChiTietPN.get(i).getMaSP());
				chiTietSP = chiTietSanPhamService.getByMaSPandMaSize(thongTinChiTietPN.get(i).getMaSP(),
						thongTinChiTietPN.get(i).getMaSize());

				System.out.println(1);
				if (chiTietSP == null) {

					SanPham sp = sanPhamService.getByMaSP(thongTinChiTietPN.get(i).getMaSP());
					SizeSanPham sizesp = sizeService.getByMaSize(thongTinChiTietPN.get(i).getMaSize());

					chiTietSP = new ChiTietSanPham();
					chiTietSP.setSanPham(sp);
					chiTietSP.setSizeSanPham(sizesp);
					chiTietSP.setSoLuong(thongTinChiTietPN.get(i).getSoLuong());

					if (chiTietSanPhamService.themCTSP(chiTietSP)) {
						chiTietSP = chiTietSanPhamService.getByMaSPandMaSize(thongTinChiTietPN.get(i).getMaSP(),
								thongTinChiTietPN.get(i).getMaSize());
					}

				} else {
					chiTietSP.setSoLuong(chiTietSP.getSoLuong() + thongTinChiTietPN.get(i).getSoLuong());
					chiTietSanPhamService.suaCTSP(chiTietSP);
				}

				SanPham sp = sanPhamService.getByMaSP(thongTinChiTietPN.get(i).getMaSP());
				
				chiTietPNPK.setMaCTSP(chiTietSP.getMaChiTietSP());
				chiTietPNPK.setMaPhieuNhap(mapn);
				chiTietPN.setChitietpn(chiTietPNPK);
				chiTietPN.setPhieuNhap(phieunhap);
				chiTietPN.setChiTietSP(chiTietSP);
				chiTietPN.setSoLuong(thongTinChiTietPN.get(i).getSoLuong());
				chiTietPN.setGia(thongTinChiTietPN.get(i).getGia());
				
				if(sp.getGia() <= chiTietPN.getGia()) {
					sp.setGia(chiTietPN.getGia()+chiTietPN.getGia()*3/10);
					sanPhamService.suaSP(sp);
				}

				chiTietPhieuNhapService.themCTSP(chiTietPN);
				

			}
			thongTinChiTietPN.clear();
			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Thêm phiếu nhập thành công");
			model.addAttribute("danhSachPhieuNhap", phieuNhapService.getDSPhieuNhap());
		} else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Thêm phiếu nhập thất bại");
		}

		return "quantri/nhanvien/phieunhap";
	}

	@RequestMapping(value = "phieunhap", params = "xoapn", method = RequestMethod.POST)
	public String postXoaPhieuNhap(ModelMap model, @RequestParam("maPN") Integer mapn) {

		// System.out.println(danhmucsp.getMaDM());

		PhieuNhap phieunhap = phieuNhapService.getByMaPN(mapn);

		java.util.Date datepn = phieunhap.getThoiGian();
		java.util.Date dateht = new java.util.Date();

		if (dateht != datepn) {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Xóa phiếu nhập thất bại, đã quá thời gian cho phép xóa");
		}

		ChiTietSanPham ctsp = new ChiTietSanPham();
		for (int i = 0;; i++) {
			ChiTietPhieuNhap ctpn = chiTietPhieuNhapService.getByMaCTPN(mapn);
			if (ctpn == null) {
				break;
			}
			ctsp = chiTietSanPhamService.getByMaSCTSP(ctpn.getChiTietSP().getMaChiTietSP());
			ctsp.setSoLuong(ctpn.getSoLuong() + ctsp.getSoLuong());
			chiTietSanPhamService.suaCTSP(ctsp);
			chiTietPhieuNhapService.xoaCTSP(ctpn);
		}
		if (phieuNhapService.xoaPN(phieunhap)) {

			model.addAttribute("isSuccess", true);
			model.addAttribute("alertMessage", "Xóa phiếu nhập thành công");
			model.addAttribute("danhSachPhieuNhap", phieuNhapService.getDSPhieuNhap());
		}

		else {
			model.addAttribute("isSuccess", false);
			model.addAttribute("alertMessage", "Xóa phiếu nhập thất bại");
		}

		return "quantri/nhanvien/phieunhap";
	}

	@RequestMapping(value = "phieunhap/{maPN}", params = "thongtin", method = RequestMethod.GET)
	public String getThongtin1PhieuNhap(ModelMap model, HttpSession ss, @PathVariable("maPN") Integer maPN) {

		thongTinChiTietPN.clear();

		PhieuNhap phieunhap = phieuNhapService.getByMaPN(maPN);
		if (phieunhap != null) {

			List<ChiTietPhieuNhap> listct = chiTietPhieuNhapService.getByListCTPN(maPN);
			
			
			
			String tensp = "";
			String tensize = "";
			for (int i = 0; i < listct.size(); i++) {
				ThongTinChiTietPN thongtinctpn = new ThongTinChiTietPN();

				tensp = listct.get(i).getChiTietSP().getSanPham().getTenSP();
				tensize = listct.get(i).getChiTietSP().getSizeSanPham().getTenSize();

				thongtinctpn.setTenSP(tensp);
				thongtinctpn.setTenSize(tensize);
				thongtinctpn.setSoLuong(listct.get(i).getSoLuong());
				thongtinctpn.setGia(listct.get(i).getGia());
				

				thongTinChiTietPN.add(thongtinctpn);
				//System.out.println(thongTinChiTietPN.get(i));
			}
			System.out.println(thongTinChiTietPN);
			
			model.addAttribute("thongTinPN", phieunhap);

			model.addAttribute("isOpenModalInfo", true);
			model.addAttribute("danhSachThongTinCTPN", thongTinChiTietPN);
			check = true;
		}

		return "quantri/nhanvien/phieunhap";
	}

	@RequestMapping(value = "thongke", params = "thongke", method = RequestMethod.POST)
	public String ThongKeTheoSP(ModelMap model, HttpSession ss,
			@RequestParam(name = "fromDate", required = false) String from,
			@RequestParam(name = "toDate", required = false) String to) throws ParseException {
		thongKeTheoSP.clear();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");

		System.out.println(from);

		Date fromdate = null;
		Date todate = null;

		if (from != "") {
			fromdate = f.parse(from);
		}
		if (to != "") {
			todate = f.parse(to);
		}

		if (fromdate == null) {
			model.addAttribute("fromdate", "chưa chọn ngày");
			return "quantri/nhanvien/thongke";
		}
		if (todate == null) {
			model.addAttribute("todate", "chưa chọn ngày");
			return "quantri/nhanvien/thongke";
		}

//		DateFormat fd = new SimpleDateFormat("yyyy/MM/dd");
//		DateFormat t = new SimpleDateFormat("yyyy/MM/dd");

		System.out.println(fromdate);

		List<DonHang> dh = donHangService.getByDate(fromdate, todate);
//		System.out.println(dh.get(0).getMaDH());
		if (dh != null) {
			for (int i = 0; i < dh.size(); i++) {
				List<ChiTietDonHang> ct = chiTietDonHangService.getDSByMaDH(dh.get(i).getMaDH());
				for (int j = 0; j < ct.size(); j++) {
					boolean check = false;
					double doanhthu = (double) ct.get(j).getGia()*ct.get(j).getSoLuong();
					for (int z = 0; z < thongKeTheoSP.size(); z++) {
						if (ct.get(j).getChiTietSP().getSanPham().getMaSP() == thongKeTheoSP.get(z).getMaSP()) {
							thongKeTheoSP.get(z).setDoanhThu(doanhthu + thongKeTheoSP.get(z).getDoanhThu());
							check = true;
							break;
						}
					}
					if (check == false) {
						ThongKeTheoSP tk = new ThongKeTheoSP();
						tk.setMaSP(ct.get(i).getChiTietSP().getSanPham().getMaSP());
						tk.setTenSP(ct.get(i).getChiTietSP().getSanPham().getTenSP());
						tk.setDoanhThu(doanhthu);
						thongKeTheoSP.add(tk);
					}
				}
			}
		}

		model.addAttribute("danhSachThongKeTheoSP", thongKeTheoSP);
		return "quantri/nhanvien/thongke";
	}

}
