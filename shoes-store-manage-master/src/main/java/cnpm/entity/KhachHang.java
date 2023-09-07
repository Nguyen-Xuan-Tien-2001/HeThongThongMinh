package cnpm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="KHACHHANG")
public class KhachHang {
	@Id
	@Column(name="MaKH")
	private String maKH;
	
	@Column(name="Ho")
	private String ho;
	
	@Column(name="Ten")
	private String ten;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Column(name="NgaySinh")
	private Date ngaySinh;
	
	@Column(name="Diachi")
	private String diaChi;
	
	@Column(name="SDT")
	private String sdt;
	
	@Column(name="Phai")
	private Boolean phai;
	
	@Column(name="Anh")
	private String anh;
	
	@OneToOne
	@JoinColumn(name="MaTK")
	private TaiKhoan taiKhoan;
	
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.EAGER)
	private Collection<DonHang> donHangs;
	
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
	private Collection<GioHang> gioHangs;
	
	public Boolean getPhai() {
		return phai;
	}

	public void setPhai(Boolean phai) {
		this.phai = phai;
	}

	public String getAnh() {
		return anh;
	}

	public void setAnh(String anh) {
		this.anh = anh;
	}

	public String getMaKH() {
		return maKH;
	}

	public void setMaKH(String maKH) {
		this.maKH = maKH;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

	public Collection<DonHang> getDonHangs() {
		return donHangs;
	}

	public void setDonHangs(Collection<DonHang> donHangs) {
		this.donHangs = donHangs;
	}

	public Collection<GioHang> getGioHangs() {
		return gioHangs;
	}

	public void setGioHangs(Collection<GioHang> gioHangs) {
		this.gioHangs = gioHangs;
	}
	
}
