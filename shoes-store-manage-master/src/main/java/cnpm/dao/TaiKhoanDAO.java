package cnpm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cnpm.entity.TaiKhoan;

@Transactional
@Repository
public class TaiKhoanDAO {
	@Autowired
	SessionFactory factory;

	public boolean checkEmailExcept(String email) {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan where email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		
		List<TaiKhoan> list= query.list();
		if(list.size() == 0) {
			return false;
		}
		
		return true;
	}
	
	public boolean kiemTraDangNhap(String email, String matkhau) {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan where email = :email and matkhau = :matkhau";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		query.setParameter("matkhau", matkhau);
		
		List<TaiKhoan> list= query.list();
		if(list.size() == 0) {
			return false;
		}
		
		return true;
	}

	public TaiKhoan getByEmail(String email) {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan where email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		
		List<TaiKhoan> list= query.list();
		if(list.size() == 0) {
			return null;
		}
		
		return list.get(0);
	}
	

	public List<TaiKhoan> getDSTaiKhoan() {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan";
		Query query = session.createQuery(hql);
		List<TaiKhoan> list = query.list();
		
		return list;
	}

	public TaiKhoan getByMaTK(String maTK) {
		Session session = factory.getCurrentSession();
		String hql = "from TaiKhoan where maTK = :maTK";
		Query query = session.createQuery(hql);
		query.setParameter("maTK", maTK);
		
		List<TaiKhoan> list= query.list();
		if(list.size() == 0) {
			return null;
		}
		
		return list.get(0);
	}

	public Boolean them(TaiKhoan taikhoan) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(taikhoan);
			t.commit();
			
		}
		catch(Exception e) {
			System.out.println(e.getCause());
			t.rollback();
			isSuccess = false;
		}
		finally {
			session.close();
		}
		
		return isSuccess;
	}

	public Boolean sua(TaiKhoan taikhoan) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(taikhoan);
			t.commit();
			
		}
		catch(Exception e) {
			System.out.println(e.getCause());
			t.rollback();
			isSuccess = false;
		}
		finally {
			session.close();
		}
		
		return isSuccess;
	}

	public Boolean xoa(TaiKhoan taikhoan) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.delete(taikhoan);
			t.commit();
			
		}
		catch(Exception e) {
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
