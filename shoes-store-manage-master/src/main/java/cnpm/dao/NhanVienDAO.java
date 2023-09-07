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
import cnpm.entity.NhanVien;

@Transactional
@Repository
public class NhanVienDAO {
	
	@Autowired
	SessionFactory factory;

	public NhanVien getByMaNV(String maNV) {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien where maNV = :maNV";
		Query query = session.createQuery(hql);
		query.setParameter("maNV", maNV);
		List<NhanVien> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		NhanVien nv = res.get(0);
		return nv;
	}
	
	public NhanVien getBySdt(String sdt) {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien where sdt = :sdt";
		Query query = session.createQuery(hql);
		query.setParameter("sdt", sdt);
		List<NhanVien> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		NhanVien nv = res.get(0);
		return nv;
	}

	public NhanVien getByMaTK(String maTK) {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien where maTK = :maTK";
		Query query = session.createQuery(hql);
		query.setParameter("maTK", maTK);
		List<NhanVien> res = query.list();
		
		if(res.size() == 0) {
			return null;
		}
		
		NhanVien nv = res.get(0);
		return nv;
	}
	
	public List<NhanVien> getDSNhanVien(){
		Session session = factory.getCurrentSession();
		String hql ="from NhanVien";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		return list;
	}
	
	public Boolean them(NhanVien nhanvien) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.save(nhanvien);
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
	
	public Boolean sua(NhanVien nhanvien) {
		Boolean isSuccess = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			session.update(nhanvien);
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
