package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.VaiTro;

@Transactional
@Repository
public class VaiTroDAO {
	@Autowired
	SessionFactory factory;
	
	public VaiTro getByMaVT(String maVT) {
		Session session = factory.getCurrentSession();
		String hql = "from VaiTro where MaVT = :maVT";
		Query query = session.createQuery(hql);
		query.setParameter("maVT", maVT);
		
		List<VaiTro> list = query.list();
		if(list.size() == 0) {
			return null;
		}
		
		return list.get(0);
	}

}
