package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.NhanVien;
import cnpm.entity.PhieuNhap;

@Transactional
@Repository
public class PhieuNhapDAO {
	@Autowired
	SessionFactory factory;
	
	public PhieuNhap getByMaPN(Integer maPN) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuNhap where maPN = :maPN";
		Query query = session.createQuery(hql);
		query.setParameter("maPN", maPN);
		List<PhieuNhap> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		PhieuNhap pn = res.get(0);
		return pn;
	}
	
	public List<PhieuNhap> getDSPhieuNhap(){
		Session session = factory.getCurrentSession();
		String hql = "from PhieuNhap";
		Query query = session.createQuery(hql);
		List<PhieuNhap> list = query.list();
		
		return list;
	}
	
	public Boolean them(PhieuNhap phieuNhap) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(phieuNhap);
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
	
	public Boolean sua(PhieuNhap phieuNhap) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(phieuNhap);
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
	
	public Boolean xoa(PhieuNhap phieuNhap) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.delete(phieuNhap);
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
