package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.ChiTietPhieuNhap;
import cnpm.entity.PhieuNhap;

@Transactional
@Repository
public class ChiTietPhieuNhapDAO {
	@Autowired
	SessionFactory factory;
	
	public ChiTietPhieuNhap getByMaCTPN(Integer maPhieuNhap) {
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietPhieuNhap where maPhieuNhap = :maPhieuNhap";
		Query query = session.createQuery(hql);
		query.setParameter("maPhieuNhap", maPhieuNhap);
		List<ChiTietPhieuNhap> res = query.list();
		
		if(res.isEmpty()) {
			return null;
		}
		
		ChiTietPhieuNhap pn = res.get(0);
		return pn;
	}
	
	public List<ChiTietPhieuNhap> getListCTPN(Integer maPhieuNhap) {
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietPhieuNhap where maPhieuNhap = :maPhieuNhap";
		Query query = session.createQuery(hql);
		query.setParameter("maPhieuNhap", maPhieuNhap);
		List<ChiTietPhieuNhap> res = query.list();

		return res;
	}
	
	public Boolean kiemTraCTPN(Integer MaChiTietSP) {
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietPhieuNhap where MaChiTietSP = :MaChiTietSP";
		Query query = session.createQuery(hql);
		query.setParameter("MaChiTietSP", MaChiTietSP);
		List<ChiTietPhieuNhap> res = query.list();
		
		if(res.isEmpty()) {
			return false;
		}

		return true;
	}
	
	
	/*
	 * public List<PhieuNhap> getDSPhieuNhap(){ Session session =
	 * factory.getCurrentSession(); String hql = "from PhieuNhap"; Query query =
	 * session.createQuery(hql); List<PhieuNhap> list = query.list();
	 * 
	 * return list; }
	 */
	
	public Boolean them(ChiTietPhieuNhap chiTietPhieuNhap) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(chiTietPhieuNhap);
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
	
	public Boolean sua(ChiTietPhieuNhap chiTietPhieuNhap) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(chiTietPhieuNhap);
			t.commit();
			
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
			isSuccess = false;
		}
		finally {
			session.close();
		}
		
		return isSuccess;
	}
	
	public Boolean xoa(ChiTietPhieuNhap chiTietPhieuNhap) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.delete(chiTietPhieuNhap);
			t.commit();
			
		} catch (Exception e) {
			System.out.println(e);
			t.rollback();
			isSuccess = false;
		}
		finally {
			session.close();
		}
		
		return isSuccess;
	}
}
