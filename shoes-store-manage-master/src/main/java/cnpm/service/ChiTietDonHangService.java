package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.ChiTietDonHangDAO;
import cnpm.entity.ChiTietDonHang;

@Service
public class ChiTietDonHangService {
	@Autowired
	ChiTietDonHangDAO chiTietDonHangDAO;
	
	public List<ChiTietDonHang> getDSByMaDH(Integer MaDH){
		return chiTietDonHangDAO.getDSByMaDH(MaDH);
	}
	
	public List<ChiTietDonHang> getDSCTDH(){
		return chiTietDonHangDAO.getDSCTDH();
	}

	public Boolean themCTDH(ChiTietDonHang ctdh) {
		return chiTietDonHangDAO.them(ctdh);
	}

	public Boolean kiemTraCTDH(Integer maCTSP) {
		return chiTietDonHangDAO.kiemTraCTDH(maCTSP);
	}
}
