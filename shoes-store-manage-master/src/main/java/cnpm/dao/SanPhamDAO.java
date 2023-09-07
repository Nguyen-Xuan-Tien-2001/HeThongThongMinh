package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.DanhMucSanPham;
import cnpm.entity.KhachHang;
import cnpm.entity.SanPham;

@Transactional
@Repository
public class SanPhamDAO {
	@Autowired
	SessionFactory factory;
	
	/*
	 * public List<SanPham> locSP(String hql){ Session session =
	 * factory.getCurrentSession(); String hql = "from SanPham where " + hql; Query
	 * query = session.createQuery(hql); List<SanPham> list = query.list();
	 * 
	 * return list; }
	 */
	
	public List<SanPham> getSanPhamTheoTen(String tensp){
		Session session = factory.getCurrentSession();
		String hql = "from SanPham where gia > 0.0 and tenSP like :tensp";
		Query query = session.createQuery(hql);
		query.setParameter("tensp", "%"+tensp+"%");
		List<SanPham> list = query.list();
		
		return list;
	}
	
	public List<SanPham> getRandomDSSanPham(){
		Session session = factory.getCurrentSession();
		String hql = "from SanPham where gia > 0.0 order by newid()";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		
		return list;
	}
	
	public List<SanPham> getDSSanPhamTheoDM(Integer maDanhMuc){
		Session session = factory.getCurrentSession();
		String hql = "from SanPham where gia > 0.0 and maDanhMuc = :maDanhMuc";
		Query query = session.createQuery(hql);
		
		query.setParameter("maDanhMuc", maDanhMuc);
		List<SanPham> list = query.list();
		
		return list;
	}
	
	public List<SanPham> getDSSanPhamTheoDeXuat(String style){
		Session session = factory.getCurrentSession();
		String hql = "from SanPham where style = :style";
		Query query = session.createQuery(hql);
		
		query.setParameter("style", style);
		List<SanPham> list = query.list();
		
		return list;
	}
	
	public List<SanPham> getDSSanPhamTheoPhai(Boolean phai){
		Session session = factory.getCurrentSession();
		String hql = "from SanPham where gia > 0.0 and phai = :phai";
		Query query = session.createQuery(hql);
		
		query.setParameter("phai", phai);
		List<SanPham> list = query.list();
		if(list.isEmpty())
		{
			return null;
		}
		
		return list;
	}
	
	public List<SanPham> getDSSanPham(){
		Session session = factory.getCurrentSession();
		String hql = "from SanPham";
		Query query = session.createQuery(hql);
		List<SanPham> list = query.list();
		
		return list;
	}
	
	public SanPham getByMaSP(Integer maSP) {
		Session session = factory.getCurrentSession();
		String hql = "from SanPham where maSP = :maSP";
		Query query = session.createQuery(hql);
		

		query.setParameter("maSP", maSP);
		List<SanPham> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
	
		return res.get(0);
	}
	
	public Boolean them(SanPham sanPham) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(sanPham);
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
	
	public Boolean sua(SanPham sanPham) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(sanPham);
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
	
	public Boolean xoa(SanPham sanPham) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.delete(sanPham);
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
