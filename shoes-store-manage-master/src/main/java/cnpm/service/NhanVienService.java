package cnpm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cnpm.dao.NhanVienDAO;
import cnpm.entity.NhanVien;

@Service
public class NhanVienService{
	
	@Autowired
	NhanVienDAO nhanVienDAO;
	
	public String taoMaNVMoi() {
		int index = this.getDSNhanVien().size() + 1;
		while(this.maNVDaCo("NV"+Integer.toString(index))) {
			index++;
		}
		
		String maNV = "NV" + Integer.toString(index);
		
		return maNV;
	}
	
	public Boolean maNVDaCo(String maNV) {
		if(this.getByMaNV(maNV) != null) {
			return true;
		}
		return false;
	}
	
	public NhanVien getByMaNV(String maNV) {
		return nhanVienDAO.getByMaNV(maNV);
	}

	public NhanVien getByMaTK(String maTK) {
		// TODO Auto-generated method stub
		return nhanVienDAO.getByMaTK(maTK);
	}

	public List<NhanVien> getDSNhanVien(){
		return nhanVienDAO.getDSNhanVien();
	}
	
	public NhanVien getBySdt(String sdt) {
		return nhanVienDAO.getBySdt(sdt);
	}
	public Boolean themNV(NhanVien nhanvien) {
		return nhanVienDAO.them(nhanvien);
	}
	
	public Boolean suaNV(NhanVien nhanvien) {
		return nhanVienDAO.sua(nhanvien);
	}
}