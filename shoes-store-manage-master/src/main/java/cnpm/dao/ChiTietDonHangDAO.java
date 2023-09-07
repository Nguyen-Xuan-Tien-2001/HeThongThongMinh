package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.ChiTietDonHang;

@Transactional
@Repository
public class ChiTietDonHangDAO {
	@Autowired
	SessionFactory factory;
	
	public List<ChiTietDonHang> getDSCTDH(){
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietDonHang";
		Query query = session.createQuery(hql);
		List<ChiTietDonHang> res = query.list();
		
		if(res.isEmpty()) {
			return null;
		}
		
		return res;
	}
	
	public List<ChiTietDonHang> getDSByMaDH(Integer MaDH){
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietDonHang where MaDH = :MaDH";
		Query query = session.createQuery(hql);
		query.setParameter("MaDH", MaDH);
		List<ChiTietDonHang> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		return res;
	}
	

	public Boolean them(ChiTietDonHang chiTietDonHang) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(chiTietDonHang);
			t.commit();
			
		} catch (Exception e) {
			System.out.println(e);
			System.out.println(e.getCause());
			t.rollback();
			isSuccess = false;
		}
		finally {
			session.close();
		}
		return isSuccess;
	}
	

	public Boolean kiemTraCTDH(Integer MaCTSP){
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietDonHang where MaCTSP = :MaCTSP";
		Query query = session.createQuery(hql);
		query.setParameter("MaCTSP", MaCTSP);
		List<ChiTietDonHang> res = query.list();
		
		if(res.isEmpty()) {
			return false;
		}
		
		return true;
	}
}
