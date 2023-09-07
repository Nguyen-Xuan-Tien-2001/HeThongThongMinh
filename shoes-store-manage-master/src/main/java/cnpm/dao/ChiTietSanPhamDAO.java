package cnpm.dao;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.ChiTietPhieuNhap;
import cnpm.entity.ChiTietSanPham;
import cnpm.entity.NhanVien;
import cnpm.entity.SanPham;
import cnpm.entity.ChiTietSanPham;

@Transactional
@Repository
public class ChiTietSanPhamDAO {
	@Autowired
	SessionFactory factory;
	
	public List<SanPham> locSP(String hql1){
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietSanPham " + hql1;
		Query query = session.createQuery(hql);
		
		List<ChiTietSanPham> res = query.list();
		
		List<SanPham> list = new ArrayList<SanPham>();
		for(ChiTietSanPham ctsp : res) {
			list.add(ctsp.getSanPham());
		}
		
		return list;
	}
	
	public ChiTietSanPham getByMaSPVaSize(Integer maSP, Integer maSize) {
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietSanPham where sanPham.maSP = :maSP and sizeSanPham.maSize = :maSize";
		Query query = session.createQuery(hql);
		query.setParameter("maSP", maSP);
		query.setParameter("maSize", maSize);
		List<ChiTietSanPham> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		return res.get(0);
	}
	
	public ChiTietSanPham getByMaCTSPM(Integer maCTSP){
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietSanPham where maChiTietSP = :maCTSP";
		Query query = session.createQuery(hql);
		query.setParameter("maCTSP", maCTSP);
		List<ChiTietSanPham> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		ChiTietSanPham ctsp = res.get(0);
		return ctsp;
	}
	
	public List<ChiTietSanPham> getByMaSP(Integer maSP){
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietSanPham where maSP = :maSP";
		Query query = session.createQuery(hql);
		query.setParameter("maSP", maSP);
		List<ChiTietSanPham> res = query.list();
		if(res.isEmpty())
		{
			return null;
		}
		return res;
	}
	
	public ChiTietSanPham getByMaSPandMaSize(Integer maSP, Integer maSize) {
		Session session = factory.getCurrentSession();
		String hql = "from ChiTietSanPham where maSP = :maSP and maSize = :maSize";
		Query query = session.createQuery(hql);
		query.setParameter("maSP", maSP);
		query.setParameter("maSize", maSize);
		List<ChiTietSanPham> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		ChiTietSanPham ctsp = res.get(0);
		return ctsp;
	}
	
	public Boolean them(ChiTietSanPham chiTietSP) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(chiTietSP);
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
	
	public Boolean sua(ChiTietSanPham chiTietSP) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(chiTietSP);
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
	
	public Boolean xoa(ChiTietSanPham chiTietSP) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.delete(chiTietSP);
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
