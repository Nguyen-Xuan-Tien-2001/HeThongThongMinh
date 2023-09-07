package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.ChiTietSanPhamDAO;
import cnpm.entity.ChiTietSanPham;
import cnpm.entity.KhachHang;
import cnpm.entity.SanPham;


@Service
public class ChiTietSanPhamService {
	@Autowired
	ChiTietSanPhamDAO chiTietSanPhamDAO;

	public List<SanPham> locSP(String hql1){
		return chiTietSanPhamDAO.locSP(hql1);
	}

	public ChiTietSanPham getByMaSPVaSize(Integer maCTSP,  Integer maSize) {
		return chiTietSanPhamDAO.getByMaSPVaSize(maCTSP,maSize);
	}

	public ChiTietSanPham getByMaSCTSP(Integer maCTSP) {
		return chiTietSanPhamDAO.getByMaCTSPM(maCTSP);
	}
	
	public List<ChiTietSanPham> getByMaSP(Integer maSP) {
		return chiTietSanPhamDAO.getByMaSP(maSP);
  }
	
	
	/*
	 * public ChiTietSanPham getByCacMa(Integer maCTSP, Integer maMau, Integer
	 * maSize) { return chiTietSanPhamDAO.getByCacMa(maCTSP, maMau, maSize);
	 * 
	 * }
	 */
	
	public ChiTietSanPham getByMaSPandMaSize(Integer maSP, Integer maSize) {
		return chiTietSanPhamDAO.getByMaSPandMaSize(maSP, maSize);
	}
	
	/*
	 * public ChiTietSanPham getByCacMa(Integer maCTSP, Integer maMau, Integer
	 * maSize) { return chiTietSanPhamDAO.getByCacMa(maCTSP, maMau, maSize); }
	 */
	public Boolean themCTSP(ChiTietSanPham chiTietSanPham) {
		return chiTietSanPhamDAO.them(chiTietSanPham);
	}
	
	public Boolean truSLTon(Integer maCTSP, Integer soLuong) {
		ChiTietSanPham ctsp = this.getByMaSCTSP(maCTSP);
		if(ctsp.getSoLuong() < soLuong) {
			return false;
		}
		ctsp.setSoLuong(ctsp.getSoLuong() - soLuong);
		return chiTietSanPhamDAO.sua(ctsp);
	}
	
	public Boolean suaCTSP(ChiTietSanPham chiTietSanPham) {
		return chiTietSanPhamDAO.sua(chiTietSanPham);
	}
	
	public Boolean xoaCTSP(ChiTietSanPham chiTietSanPham) {
		return chiTietSanPhamDAO.xoa(chiTietSanPham);
	}
	
}
