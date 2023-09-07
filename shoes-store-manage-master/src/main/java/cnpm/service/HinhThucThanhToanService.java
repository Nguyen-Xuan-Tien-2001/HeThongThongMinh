package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.HinhThucThanhToanDAO;
import cnpm.entity.HinhThucThanhToan;

@Service
public class HinhThucThanhToanService {
	@Autowired
	HinhThucThanhToanDAO hinhThucThanhToanDAO;
	
	public List<HinhThucThanhToan> getDSHinhThucThanhToan(){
		return hinhThucThanhToanDAO.getDSHinhThucThanhToan();
	}
}
