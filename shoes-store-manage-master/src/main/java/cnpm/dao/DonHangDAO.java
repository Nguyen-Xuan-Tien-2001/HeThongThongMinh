package cnpm.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity. DonHang;
import cnpm.entity.NhanVien;

@Transactional
@Repository
public class DonHangDAO {
	@Autowired
	SessionFactory factory;
	
	public DonHang getDHVuaTao() {
		Session session = factory.getCurrentSession();
		String hql = "from DonHang as dh order by dh.maDH desc";
		Query query = session.createQuery(hql);
		List<DonHang> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		return res.get(0);
	}
	
	public List<DonHang> getDSDonHangByTT(Integer maTT){
		Session session = factory.getCurrentSession();
		String hql = "from DonHang as dh where dh.trangThaiDH.maTTDH =:maTT order by dh.maDH desc";
		Query query = session.createQuery(hql);
		query.setParameter("maTT", maTT);
		List< DonHang> list = query.list();
		
		return list;
	}
	
	public List<DonHang> getDSDonHangCuaKH(String maKH){
		Session session = factory.getCurrentSession();
		String hql = "from DonHang as dh where dh.khachHang.maKH = :maKH order by dh.trangThaiDH.maTTDH asc ";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		List< DonHang> list = query.list();
		
		return list;
	}
	
	public List<DonHang> getDSDonHang(){
		Session session = factory.getCurrentSession();
		String hql = "from  DonHang";
		Query query = session.createQuery(hql);
		List< DonHang> list = query.list();
		
		return list;
	}
	
	public DonHang getByMaDH(Integer maDH) {
		Session session = factory.getCurrentSession();
		String hql = "from DonHang where maDH = :maDH";
		Query query = session.createQuery(hql);
		query.setParameter("maDH", maDH);
		List<DonHang> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		return res.get(0);
	}
	
	public List<DonHang> getByDate(Date fromdate, Date todate) {
		Session session = factory.getCurrentSession();
		String hql = "from DonHang where thoiGian >= :fromdate AND thoiGian <= :todate";
		Query query = session.createQuery(hql);
		query.setParameter("fromdate", fromdate);
		query.setParameter("todate", todate);
		List<DonHang> res = query.list();
		
		if(res.isEmpty()) {
			return null;
		}
		
		return res;
	}
	
	public Boolean them(DonHang donhang) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(donhang);
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
	
	public Boolean sua(DonHang donhang) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(donhang);
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
	
	public Boolean xoa(DonHang donhang) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.delete(donhang);
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
