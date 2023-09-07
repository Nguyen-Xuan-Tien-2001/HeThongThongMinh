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

@Transactional
@Repository
public class DanhMucSanPhamDAO {

	@Autowired
	SessionFactory factory;
	
	public DanhMucSanPham getByMaDM(Integer maDanhMuc) {
		Session session = factory.getCurrentSession();
		String hql = "from DanhMucSanPham where maDanhMuc = :maDanhMuc";
		Query query = session.createQuery(hql);
		

		query.setParameter("maDanhMuc", maDanhMuc);
		List<DanhMucSanPham> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		DanhMucSanPham dm = res.get(0);
		return dm;
	}
	
	public List<DanhMucSanPham> getDSDanhMuc(){
		Session session = factory.getCurrentSession();
		String hql ="from DanhMucSanPham";
		Query query = session.createQuery(hql);
		List<DanhMucSanPham> list = query.list();
		return list;
	}
	
	public List<DanhMucSanPham> getDS4DanhMuc(){
		Session session = factory.getCurrentSession();
		String hql ="from DanhMucSanPham order by newid()";
		Query query = session.createQuery(hql);
		List<DanhMucSanPham> list = query.list();
		return list;
	}
	
	public Boolean them(DanhMucSanPham danhMucSanPham) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(danhMucSanPham);
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
	
	public Boolean sua(DanhMucSanPham danhMucSanPham) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(danhMucSanPham);
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
	
	public Boolean xoa(DanhMucSanPham danhMucSanPham) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.delete(danhMucSanPham);
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
