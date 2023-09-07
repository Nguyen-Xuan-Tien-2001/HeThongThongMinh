package cnpm.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.DonHangDAO;
import cnpm.entity.DonHang;
import cnpm.entity.NhanVien;

@Service
public class DonHangService {
	@Autowired
	DonHangDAO donHangDAO;
	
	public List<DonHang> getDSDonHangByTT(Integer maTT){
		return donHangDAO.getDSDonHangByTT(maTT);
	}
	
	
	public List<DonHang> getDSDonHangCuaKH(String maKH){
		return donHangDAO.getDSDonHangCuaKH(maKH);
	}
	
	public List<DonHang> getDSDonHang(){
		return donHangDAO.getDSDonHang();
	}
	
	public List<DonHang> getByDate(Date fromdate, Date todate){
		return donHangDAO.getByDate(fromdate, todate);
	}
	
	public DonHang getByMaDH(Integer maDH) {
		return donHangDAO.getByMaDH(maDH);
	}
	
	public Boolean themDH(DonHang donhang) {
		return donHangDAO.them(donhang);
	}
	
	public Boolean suaDH(DonHang donhang) {
		return donHangDAO.sua(donhang);
	}
	
	public Boolean xoaDH(DonHang donhang) {
		return donHangDAO.xoa(donhang);
	}
	
	public DonHang getDHVuaTao() {
		return donHangDAO.getDHVuaTao();
	}
}
