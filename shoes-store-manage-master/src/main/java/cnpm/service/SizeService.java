package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.SizeDAO;
import cnpm.entity.KhachHang;
import cnpm.entity.SizeSanPham;

@Service
public class SizeService {
	@Autowired
	SizeDAO sizeDAO;
	
	public List<SizeSanPham> getDSSize(){
		return sizeDAO.getDSSize();
	}
	
	public SizeSanPham getByMaSize(Integer maSize) {
		// TODO Auto-generated method stub
		return sizeDAO.getByMaSize(maSize);
	}
}
