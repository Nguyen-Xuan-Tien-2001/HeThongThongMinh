package cnpm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "PHIEUNHAP")
public class PhieuNhap {
	@Id
	@GeneratedValue
	@Column(name = "MaPN")
	private int maPN;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ThoiGian")
	private Date thoiGian;

	@ManyToOne
	@JoinColumn(name = "MaNV")
	private NhanVien nhanVien;

	@ManyToOne
	@JoinColumn(name = "MaNCC")
	private NhaCungCap nhaCungCap;
	
	@Column(name="TongTien")
	private double tongTien;
	
	
	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
	}

	public double getTongTien() {
		return tongTien;
	}

	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}

	public NhaCungCap getNhaCungCap() {
		return nhaCungCap;
	}

	public void setNhaCungCap(NhaCungCap nhaCungCap) {
		this.nhaCungCap = nhaCungCap;
	}

	public Collection<ChiTietPhieuNhap> getChiTietPN() {
		return chiTietPN;
	}

	public void setChiTietPN(Collection<ChiTietPhieuNhap> chiTietPN) {
		this.chiTietPN = chiTietPN;
	}

	@OneToMany(mappedBy = "phieuNhap", fetch = FetchType.EAGER)
	private Collection<ChiTietPhieuNhap> chiTietPN;

	public int getMaPN() {
		return maPN;
	}

	public void setMaPN(int maPN) {
		this.maPN = maPN;
	}

	public Date getThoiGian() {
		return thoiGian;
	}


	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}


	/*
	 * public Collection<ChiTietPhieuNhap> getChiTietPN() { return chiTietPN; }
	 * 
	 * public void setChiTietPN(Collection<ChiTietPhieuNhap> chiTietPN) {
	 * this.chiTietPN = chiTietPN; }
	 */

}
