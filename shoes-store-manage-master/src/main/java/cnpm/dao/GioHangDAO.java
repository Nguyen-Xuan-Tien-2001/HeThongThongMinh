package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.GioHang;
import cnpm.entity.GioHangPK;

@Transactional
@Repository
public class GioHangDAO {
	@Autowired
	SessionFactory factory;
	
	public GioHang getByPk(String maKH, Integer mactsp) {
		Session session = factory.getCurrentSession();
		String hql ="from GioHang where gioHangPK.maKH = :maKH and gioHangPK.maCTSP = :maCTSP";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		query.setParameter("maCTSP", mactsp);
		List<GioHang> list = query.list();
		if(list.size() == 0) {
			return null;
		}
		return list.get(0);
	}
	
	public List<GioHang> getGioHangCuaKH(String maKH){
		Session session = factory.getCurrentSession();
		String hql ="from GioHang where gioHangPK.maKH = :maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		List<GioHang> list = query.list();
		return list;
	}
	
	public Boolean them(GioHang gioHang){
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(gioHang);
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
	
	public Boolean sua(GioHang gioHang){
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(gioHang);
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
	
	public Boolean xoa(GioHang gioHang){
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.delete(gioHang);
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
