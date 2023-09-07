package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.ChiTietPhieuNhapDAO;
import cnpm.entity.ChiTietPhieuNhap;

@Service
public class ChiTietPhieuNhapService {

	@Autowired
	ChiTietPhieuNhapDAO chiTietPhieuNhapDAO;
	
	public ChiTietPhieuNhap getByMaCTPN(Integer maCTPN){
		return chiTietPhieuNhapDAO.getByMaCTPN(maCTPN);
	}
	
	public List<ChiTietPhieuNhap> getByListCTPN(Integer maPN){
		return chiTietPhieuNhapDAO.getListCTPN(maPN);
	}
	
	public Boolean kiemTraCTPN(Integer maCTSP) {
		return chiTietPhieuNhapDAO.kiemTraCTPN(maCTSP);
	}
	
	public Boolean themCTSP(ChiTietPhieuNhap chiTietPhieuNhap) {
		return chiTietPhieuNhapDAO.them(chiTietPhieuNhap);
	}
	
	public Boolean suaCTSP(ChiTietPhieuNhap chiTietPhieuNhap) {
		return chiTietPhieuNhapDAO.sua(chiTietPhieuNhap);
	}
	
	public Boolean xoaCTSP(ChiTietPhieuNhap chiTietPhieuNhap) {
		return chiTietPhieuNhapDAO.xoa(chiTietPhieuNhap);
	}
}
