package cnpm.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.PhieuNhapDAO;
import cnpm.entity.NhanVien;
import cnpm.entity.PhieuNhap;
import cnpm.entity.SanPham;


@Service
public class PhieuNhapService {
	@Autowired
	PhieuNhapDAO phieuNhapDAO;
	
	public Integer maPNCuoiCung() {
		List<PhieuNhap> phieuNhap = this.getDSPhieuNhap();
		Integer index = phieuNhap.get(phieuNhap.size()-1).getMaPN();
		return index;
	}
	
	public List<PhieuNhap> getDSPhieuNhap(){
		// TODO Auto-generated method stub
		return phieuNhapDAO.getDSPhieuNhap();
	}
	
	public PhieuNhap getByMaPN(Integer maPN) {
		return phieuNhapDAO.getByMaPN(maPN);
	}
	
	public Boolean themPN(PhieuNhap phieuNhap) {
		return phieuNhapDAO.them(phieuNhap);
	}
	
	public Boolean suaPN(PhieuNhap phieuNhap) {
		return phieuNhapDAO.sua(phieuNhap);
	}
	
	public Boolean xoaPN(PhieuNhap phieuNhap) {
		return phieuNhapDAO.xoa(phieuNhap);
	}
}
