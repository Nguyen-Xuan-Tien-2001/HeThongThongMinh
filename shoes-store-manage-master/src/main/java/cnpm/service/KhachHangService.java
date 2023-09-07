package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.KhachHangDAO;
import cnpm.dao.TaiKhoanDAO;
import cnpm.entity.KhachHang;
import cnpm.entity.NhanVien;
import cnpm.entity.TaiKhoan;

@Service
public class KhachHangService {

	@Autowired
	KhachHangDAO khachHangDAO;
	
	@Autowired
	TaiKhoanService taiKhoanService;
	
	public String taoMaKHMoi() {
		int index = this.getDSKhachHang().size() + 1;
		while(this.maKHDaCo("KH"+Integer.toString(index))) {
			index++;
		}
		
		String maKH = "KH" + Integer.toString(index);
		
		return maKH;
	}
	
	public List<KhachHang> getDSKhachHang(){
		// TODO Auto-generated method stub
		return khachHangDAO.getDSKhachHang();
	}
	
	public Boolean maKHDaCo(String maKH) {
		if(this.getByMaKH(maKH) != null) {
			return true;
		}
		return false;
	}
	
	public KhachHang getBySdt(String sdt) {
		return khachHangDAO.getBySdt(sdt);
	}

	public KhachHang getByMaKH(String maKH) {
		// TODO Auto-generated method stub
		return khachHangDAO.getByMaKH(maKH);
	}
	
	public Boolean themKH(KhachHang khachHang) {
		return khachHangDAO.them(khachHang);
	}
	
	public Boolean suaKH(KhachHang khachHang) {
		return khachHangDAO.sua(khachHang);
	}
}
