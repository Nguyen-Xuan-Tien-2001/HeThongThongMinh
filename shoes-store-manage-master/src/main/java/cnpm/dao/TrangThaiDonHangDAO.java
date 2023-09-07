package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.TrangThaiDonHang;



@Transactional
@Repository
public class TrangThaiDonHangDAO {
	@Autowired
	SessionFactory factory;
	
	public TrangThaiDonHang getByID(Integer maTTDH) {
		Session session = factory.getCurrentSession();
		String hql = "from TrangThaiDonHang where maTTDH = :maTTDH";
		Query query = session.createQuery(hql);
		query.setParameter("maTTDH", maTTDH);
		
		List<TrangThaiDonHang> list= query.list();
		if(list.size() == 0) {
			return null;
		}
		
		return list.get(0);
	}
}
