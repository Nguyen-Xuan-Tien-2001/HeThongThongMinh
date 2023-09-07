package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import cnpm.entity.KhachHang;

@Transactional
@Repository
public class KhachHangDAO {
	
	@Autowired
	SessionFactory factory;

	public KhachHang getByMaKH(String maKH) {
		Session session = factory.getCurrentSession();
		String hql = "from KhachHang where maKH = :maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		List<KhachHang> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		KhachHang kh = res.get(0);
		return kh;
	}
	
	public KhachHang getBySdt(String sdt) {
		Session session = factory.getCurrentSession();
		String hql = "from KhachHang where sdt = :sdt";
		Query query = session.createQuery(hql);
		query.setParameter("sdt", sdt);
		List<KhachHang> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		KhachHang kh = res.get(0);
		return kh;
	}

	public KhachHang getByMaTK(String maTK) {
		Session session = factory.getCurrentSession();
		String hql = "from KhachHang where maTK = :maTK";
		Query query = session.createQuery(hql);
		query.setParameter("maTK", maTK);
		List<KhachHang> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		KhachHang kh = res.get(0);
		return kh;
	}
	
	public List<KhachHang> getDSKhachHang(){
		Session session = factory.getCurrentSession();
		String hql ="from KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();
		return list;
	}
	
	public Boolean them(KhachHang khachHang) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(khachHang);
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
	
	public Boolean sua(KhachHang khachHang) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(khachHang);
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

}
