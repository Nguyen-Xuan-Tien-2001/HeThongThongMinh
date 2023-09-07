package cnpm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.TrangThaiDonHangDAO;
import cnpm.entity.TrangThaiDonHang;

@Service
public class TrangThaiDonHangService {
	@Autowired
	TrangThaiDonHangDAO trangThaiDonHangDAO;
	
	public TrangThaiDonHang getById(Integer maTTDH) {
		return trangThaiDonHangDAO.getByID(maTTDH);
	}
}
