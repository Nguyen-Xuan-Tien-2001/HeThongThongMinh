package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.GioHangDAO;
import cnpm.entity.GioHang;
import cnpm.entity.GioHangPK;

@Service
public class GioHangService {
	@Autowired
	GioHangDAO gioHangDAO;

	public Boolean them(GioHang giohang) {

		
		return gioHangDAO.them(giohang);
	}

	public GioHang getByPk(String maKH, Integer mactsp) {
		return gioHangDAO.getByPk(maKH, mactsp);
	}

	public List<GioHang> getGioHangCuaKH(String maKH) {
		return gioHangDAO.getGioHangCuaKH(maKH);
	}

	public Boolean sua(GioHang giohang) {

		return gioHangDAO.sua(giohang);
	}

	public Boolean xoa(GioHang giohang) {

		return gioHangDAO.xoa(giohang);
	}

}
