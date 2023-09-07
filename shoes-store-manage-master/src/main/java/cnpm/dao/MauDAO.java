package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.MauSanPham;

@Transactional
@Repository
public class MauDAO {
	@Autowired
	SessionFactory factory;
	
	public List<MauSanPham> getDSMau(){
		Session session = factory.getCurrentSession();
		String hql = "from MauSanPham";
		Query query = session.createQuery(hql);
		List<MauSanPham> list = query.list();
		
		return list;
	}
}
