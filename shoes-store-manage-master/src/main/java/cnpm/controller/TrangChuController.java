package cnpm.controller;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.python.util.PythonInterpreter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cnpm.entity.ChiTietSanPham;
import cnpm.entity.DanhMucSanPham;
import cnpm.entity.GioHang;
import cnpm.entity.HinhThucThanhToan;
import cnpm.entity.MauSanPham;
import cnpm.entity.SanPham;
import cnpm.entity.SizeSanPham;
import cnpm.entity.TaiKhoan;
import cnpm.entity.VaiTro;
import cnpm.service.ChiTietSanPhamService;
import cnpm.service.DanhMucSanPhamService;
import cnpm.service.GioHangService;
import cnpm.service.HinhThucThanhToanService;
import cnpm.service.MauService;
import cnpm.service.NhanVienService;
import cnpm.service.SanPhamService;
import cnpm.service.SizeService;

@Transactional
@Controller
public class TrangChuController {
	@Autowired
	SessionFactory factory;

	@Autowired
	NhanVienService nhanVienService;

	@Autowired
	SanPhamService sanPhamService;

	@Autowired
	SizeService sizeService;

	@Autowired
	MauService mauService;

	@Autowired
	DanhMucSanPhamService danhMucSanPhamService;
	
	@Autowired
	HinhThucThanhToanService hinhThucThanhToanService;
	
	@Autowired
	GioHangService gioHangService;
	
	@Autowired
	ChiTietSanPhamService chiTietSanPhamService;
	
	
	
	private int soDeXuat = 9;

	@ModelAttribute("dsHTTT")
	public  List<HinhThucThanhToan> getDSHinhThucThanhToan(){
		return hinhThucThanhToanService.getDSHinhThucThanhToan();
	}
		
	@ModelAttribute("giohang")
	public List<GioHang> getGioHang(HttpSession ss, ModelMap model){
		
		TaiKhoan tk = (TaiKhoan) ss.getAttribute("user");
		if (tk == null) {
			return null;
		}
		
		if(!tk.getVaitro().getMaVT().equals("KH")) {
			
			return null;
		}
		
		List<GioHang> list = gioHangService.getGioHangCuaKH(tk.getKhachHang().getMaKH());
		return list;
		
	}

	@ModelAttribute("danhSachDanhMucSanPham")
	public List<DanhMucSanPham> dsDanhMucSanPham() {
		List<DanhMucSanPham> list = danhMucSanPhamService.getDSDanhMuc();
		return list;
	}
	
	@ModelAttribute("danhSachDanh4MucSanPham")
	public List<DanhMucSanPham> ds4DanhMucSanPham() {
		List<DanhMucSanPham> list = danhMucSanPhamService.get4DanhMuc();
		return list;
	}
	
	@ModelAttribute("danhSach8SanPham")
	public List<SanPham> ds8SanPham(){
		List<SanPham> list = sanPhamService.get8SanPham();
		return list;
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

	@ModelAttribute("thongTinDM")
	public DanhMucSanPham thongtinDm(ModelMap model) {

		return new DanhMucSanPham();
	}

	/*
	 * @ModelAttribute("danhSachSanPham") public List<SanPham> getDsSP(){
	 * 
	 * return sanPhamService.getDSSanPham(); }
	 */
	
	
	/*
	 * @RequestMapping("") public String reView404() { return "redirect:/404"; }
	 */

	@RequestMapping("404")
	public String getView404() {
		return "loi/404";
	}

	@RequestMapping("/403")
	public String getView403() {
		return "loi/403";
	}

	@RequestMapping(value = { "/", "trangchu", "index" })
	public String index(ModelMap model, HttpServletRequest request) {
		
		return "shop/trangchu";
	}

	@RequestMapping(value = "/sanpham")
	public String getViewProduct(ModelMap model, HttpServletRequest request) {
		PagedListHolder pagedListHolder = this.getSPTheoTrang(request);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "shop/sanpham";
	}

	@RequestMapping(value = "/sanpham/{maSP}", method = RequestMethod.GET)
	public String getDetailProduct(ModelMap model, HttpSession ss, HttpServletRequest request, @PathVariable("maSP") Integer maSP) {
		SanPham sanpham = sanPhamService.getByMaSP(maSP);
		if (sanpham != null) {
			model.addAttribute("ctsanpham", sanpham);
				
		}else {
			return "redirect:/sanpham";
		}

		int maDM = sanpham.getDanhMuc().getMaDM();
		List<SanPham> spTheoDM = sanPhamService.get4SanPham(maDM);
		ss.setAttribute("sanPhamTrongCT", spTheoDM);
		PagedListHolder pagedListHolder = this.getSPTheoTrang(request);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "shop/chitietsanpham";
	}
	
	@GetMapping(value = "dexuat")
	public String getSuggestProduct(ModelMap model, HttpServletRequest request) {
//		PagedListHolder pagedListHolder = this.getSPTheoTrang(request);
//		model.addAttribute("pagedListHolder", pagedListHolder);
		return "shop/dexuat";
	}
	
	@PostMapping(value = "dexuat")
	public String layThongTinDeXuat(ModelMap model, HttpServletRequest request, HttpSession ss, 
			RedirectAttributes redirectAttributes) throws IOException {

		String[] thongTinDeXuat = new String[soDeXuat];
		
		for(int i = 0; i<soDeXuat; i++) {
			String s = "r" + String.valueOf(i+1);
			thongTinDeXuat[i] = request.getParameter(s);
		}
		
		File file = new File("C:\\Users\\ACER\\Desktop\\shoes-store-manage-master\\src\\main\\java\\duLieuDeXuat.txt");
		OutputStream outputStream = new FileOutputStream(file);
	    OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream);
	 
	    for (int i=0; i<soDeXuat; i++){
	    	outputStreamWriter.write(String.valueOf(thongTinDeXuat[i]));
	    	if(i < soDeXuat-1) {
	    		outputStreamWriter.write(" ");
	    	}
	    }
	    outputStreamWriter.flush();
		
		ProcessBuilder builder = new ProcessBuilder("python",
                "C:\\Users\\ACER\\Desktop\\shoes-store-manage-master\\src\\main\\python\\testModel.py");


        Process process = builder.start();
        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

        String style = null;
        
        // đọc luồng
        while ((style = reader.readLine())!= null){
            System.out.println("lines Process:" + style);
            if(style != null) {
            	break;
            }
            
        }
        model.addAttribute("pageListRecomment",style);
        System.out.println(style);
        
        PagedListHolder pagedListHolder = this.getSPDeXuat(request, style);
		model.addAttribute("pagedListHolder", pagedListHolder);

		return "shop/sanphamdexuat";
	}

	/*
	 * @RequestMapping(value = "/giohang/them/{maSP}", method=RequestMethod.GET)
	 * public String themSPVaoGioHang(ModelMap model, @PathVariable("maSP") Integer
	 * maSP, HttpServletRequest request, RedirectAttributes redirectAttributes) {
	 * 
	 * System.out.println();
	 * 
	 * return "shop/chitietsanpham"; }
	 */
	
	@RequestMapping(value="sanpham", params="filter", method=RequestMethod.GET)
	public String filter(HttpServletRequest request, ModelMap model) {
		
		String[] size = request.getParameterValues("size");
		String[] color = request.getParameterValues("color");
		String[] danhmuc = request.getParameterValues("dm");
		
		String hql = "where ";
		Integer index = 0;
		if(size != null) {
			for(String s : size) {
				hql += "sizeSanPham.maSize = " + s;
				index++;
				if(index < size.length) hql += " and ";
			}
		}
		
		index = 0;
		if(color != null) {
			if(size != null) {
				hql += " and ";
			}
			for(String c : color) {
				hql += "sanPham.mauSanPham.maMau = " + c;
				index++;
				if(index < color.length) hql += " and ";
			}
		}
		
		index = 0;
		if(danhmuc != null) {
			if(size!= null || color != null) {
				hql += " and ";
			}
			for(String d : danhmuc) {
				hql += "sanPham.danhMuc.maDM = " + d;
				index++;
				if(index < danhmuc.length) hql += " and ";
			}
		}
		
		
		
		System.out.println(hql);
		//hql = hql.substring(0, hql.length() - 5);
		System.out.println(hql);
		
		
		PagedListHolder pagedListHolder = this.locSP(request, hql);
		model.addAttribute("pagedListHolder", pagedListHolder);
		return "shop/sanpham";
	}

	@RequestMapping(value="sanpham", params="timsp", method=RequestMethod.POST)
	public String timSp(HttpServletRequest request, ModelMap model) {
		
		if(request.getParameter("tensp") == null) {
			return "shop/sanpham";
		}
		
		String tensp = request.getParameter("tensp");
		
		PagedListHolder pagedListHolder = this.timSPTheoTen(request, tensp);
		model.addAttribute("pagedListHolder", pagedListHolder);
		
		pagedListHolder.setPageSize(12);
		return "shop/sanpham";
	}
	
	@RequestMapping(value = "/lienhe")
	public String getViewLienHe() {

		return "shop/lienhe";
	}

	public PagedListHolder getSPTheoTrang(HttpServletRequest request) {
//		List<SanPham> list = sanPhamService.getDSSanPham();
		List<SanPham> list = sanPhamService.getRandomDSSanPham();
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(12);
		return pagedListHolder;
	}
	
	public PagedListHolder getSPDeXuat(HttpServletRequest request, String hql) {
//		List<SanPham> list = sanPhamService.getDSSanPham();
		List<SanPham> list = sanPhamService.getDSSanPhamTheoDeXuat(hql);
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(12);
		return pagedListHolder;
	}
	
	public PagedListHolder locSP(HttpServletRequest request, String hql) {
		List<SanPham> list = chiTietSanPhamService.locSP(hql);
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(12);
		return pagedListHolder;
	}
	
	public PagedListHolder timSPTheoTen(HttpServletRequest request, String tenSP) {
		List<SanPham> list = sanPhamService.getSanPhamTheoTen(tenSP);
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);

		pagedListHolder.setPageSize(12);
		return pagedListHolder;
	}
	
	
	
	@ResponseBody 
	@RequestMapping(value="test", method=RequestMethod.GET)
	public String text(HttpServletRequest request) {
		System.out.println(request.getParameter("data"));
		return "true";
	}
	
	@RequestMapping(value = "danhmuc/{maDM}", params = "ds", method = RequestMethod.GET)
	public String getTheoDanhMuc(ModelMap model, HttpServletRequest request, @PathVariable("maDM") Integer maDM) {

//		dsSanPhamTheoDM.clear();

		List<SanPham> list = sanPhamService.getDSSanPhamTheoDM(maDM);
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		
		pagedListHolder.setPageSize(12);
		model.addAttribute("pagedListHolder", pagedListHolder);

//		for(int i=0; i<sanpham.size(); i++) {
//			
//			if(sanpham.get(i).getDanhMuc().getMaDM() == maDM) {
//				dsSanPhamTheoDM.add(sanpham.get(i));
//			}
//		}

		return "shop/sanpham";
	}
	
	@RequestMapping(value = "muasam/{phai}", params = "ds", method = RequestMethod.GET)
	public String getTheoGioiTinh(ModelMap model, HttpServletRequest request, @PathVariable("phai") String phai) {

//		dsSanPhamTheoDM.clear();
		
		boolean checkphai = true;
		if(phai.equals("nu")) {
			checkphai = false;
		}

		List<SanPham> list = sanPhamService.getDSSanPhamTheoPhai(checkphai);
		PagedListHolder pagedListHolder = new PagedListHolder(list);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setMaxLinkedPages(5);
		
		pagedListHolder.setPageSize(12);
		model.addAttribute("pagedListHolder", pagedListHolder);

//		for(int i=0; i<sanpham.size(); i++) {
//			
//			if(sanpham.get(i).getDanhMuc().getMaDM() == maDM) {
//				dsSanPhamTheoDM.add(sanpham.get(i));
//			}
//		}

		return "shop/sanpham";
	}
	
}
