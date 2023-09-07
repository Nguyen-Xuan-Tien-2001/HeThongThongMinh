package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.MauDAO;
import cnpm.entity.MauSanPham;

@Service
public class MauService {
	@Autowired
	MauDAO mauDAO;
	
	public List<MauSanPham> getDSMau(){
		return mauDAO.getDSMau();
	}
}
