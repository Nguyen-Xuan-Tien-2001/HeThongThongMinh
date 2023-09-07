package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.HinhThucThanhToan;

@Transactional
@Repository
public class HinhThucThanhToanDAO {
	@Autowired
	SessionFactory factory;
	
	public List<HinhThucThanhToan> getDSHinhThucThanhToan(){
		Session session = factory.getCurrentSession();
		String hql = "from HinhThucThanhToan";
		Query query = session.createQuery(hql);
		
		List< HinhThucThanhToan> list = query.list();
		
		return list;
	}
}
