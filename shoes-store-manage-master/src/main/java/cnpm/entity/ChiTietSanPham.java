package cnpm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CHITIETSANPHAM")
public class ChiTietSanPham {
	@Id
	@GeneratedValue
	@Column(name = "MaChiTietSP")
	private int maChiTietSP;

	@Column(name = "SoLuong")
	private int soLuong;
	

	@ManyToOne
	@JoinColumn(name = "MaSP")
	private SanPham sanPham;

	
	@ManyToOne
	@JoinColumn(name = "MaSize")
	private SizeSanPham sizeSanPham;

	@OneToMany(mappedBy = "chiTietSP", fetch = FetchType.LAZY)
	private Collection<GioHang> gioHangs;

	@OneToMany(mappedBy = "chiTietSP", fetch = FetchType.LAZY)
	private Collection<ChiTietPhieuNhap> chiTietPhieuNhaps;

	@OneToMany(mappedBy = "chiTietSP", fetch = FetchType.LAZY)
	private Collection<ChiTietDonHang> chiTietDonHangs;
	

	public int getMaChiTietSP() {
		return maChiTietSP;
	}

	public void setMaChiTietSP(int maChiTietSP) {
		this.maChiTietSP = maChiTietSP;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public SanPham getSanPham() {
		return sanPham;
	}

	public void setSanPham(SanPham sanPham) {
		this.sanPham = sanPham;
	}

	public SizeSanPham getSizeSanPham() {
		return sizeSanPham;
	}

	public void setSizeSanPham(SizeSanPham sizeSanPham) {
		this.sizeSanPham = sizeSanPham;
	}

	public Collection<GioHang> getGioHangs() {
		return gioHangs;
	}

	public void setGioHangs(Collection<GioHang> gioHangs) {
		this.gioHangs = gioHangs;
	}

	public Collection<ChiTietPhieuNhap> getChiTietPhieuNhaps() {
		return chiTietPhieuNhaps;
	}

	public void setChiTietPhieuNhaps(Collection<ChiTietPhieuNhap> chiTietPhieuNhaps) {
		this.chiTietPhieuNhaps = chiTietPhieuNhaps;
	}

	public Collection<ChiTietDonHang> getChiTietDonHangs() {
		return chiTietDonHangs;
	}

	public void setChiTietDonHangs(Collection<ChiTietDonHang> chiTietDonHangs) {
		this.chiTietDonHangs = chiTietDonHangs;
	}

	
}
