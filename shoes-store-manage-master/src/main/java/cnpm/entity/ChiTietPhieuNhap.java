package cnpm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CHITIETPHIEUNHAP")
public class ChiTietPhieuNhap implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ChiTietPhieuNhapPK chitietpn;

	@ManyToOne
	@JoinColumn(name = "MaPhieuNhap", insertable = false, updatable = false)
	private PhieuNhap phieuNhap;

	@ManyToOne
	@JoinColumn(name = "MaChiTietSP", insertable = false, updatable = false)
	private ChiTietSanPham chiTietSP;

	@Column(name = "SoLuong")
	private int soLuong;
	
	@Column(name="Gia")
	private float gia;

	
	
	public float getGia() {
		return gia;
	}

	public void setGia(float gia) {
		this.gia = gia;
	}

	public ChiTietPhieuNhapPK getChitietpn() {
		return chitietpn;
	}

	public void setChitietpn(ChiTietPhieuNhapPK chitietpn) {
		this.chitietpn = chitietpn;
	}

	public PhieuNhap getPhieuNhap() {
		return phieuNhap;
	}

	public void setPhieuNhap(PhieuNhap phieuNhap) {
		this.phieuNhap = phieuNhap;
	}

	public ChiTietSanPham getChiTietSP() {
		return chiTietSP;
	}

	public void setChiTietSP(ChiTietSanPham chiTietSP) {
		this.chiTietSP = chiTietSP;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

}