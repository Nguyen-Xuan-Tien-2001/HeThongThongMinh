package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.KhachHang;
import cnpm.entity.SizeSanPham;

@Transactional
@Repository
public class SizeDAO {
	@Autowired
	SessionFactory factory;
	
	public List<SizeSanPham> getDSSize(){
		Session session = factory.getCurrentSession();
		String hql = "from SizeSanPham";
		Query query = session.createQuery(hql);
		List<SizeSanPham> list = query.list();
		
		return list;
	}
	
	public SizeSanPham getByMaSize(Integer maSize) {
		Session session = factory.getCurrentSession();
		String hql = "from SizeSanPham where maSize = :maSize";
		Query query = session.createQuery(hql);
		query.setParameter("maSize", maSize);
		List<SizeSanPham> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		SizeSanPham size = res.get(0);
		return size;
	}
}
