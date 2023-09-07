package cnpm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.VaiTroDAO;
import cnpm.entity.VaiTro;

@Service
public class VaiTroService {
	@Autowired
	VaiTroDAO vaiTroDAO;
	
	public VaiTro getByMaVT(String maVT) {
		// TODO Auto-generated method stub
		return vaiTroDAO.getByMaVT(maVT);
	}

}
