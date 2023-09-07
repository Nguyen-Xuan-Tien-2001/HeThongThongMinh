
package cnpm.entity;


import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CHITIETDONHANG")
public class ChiTietDonHang {

	
	@EmbeddedId
	private ChiTietDonHangPK chiTietDonHangPK;

	@ManyToOne
	@JoinColumn(name="MaCTSP", insertable=false, updatable=false)
	private ChiTietSanPham chiTietSP;
	
	
	@ManyToOne
	@JoinColumn(name="MaDH", insertable=false, updatable=false)
	private DonHang donHang;
	
	@Column(name = "Gia")
	private float gia;

	@Column(name = "SoLuong")
	private int soLuong;

	public ChiTietDonHangPK getChiTietDonHangPK() {
		return chiTietDonHangPK;
	}

	public void setChiTietDonHangPK(ChiTietDonHangPK chiTietDonHangPK) {
		this.chiTietDonHangPK = chiTietDonHangPK;
	}

	public ChiTietSanPham getChiTietSP() {
		return chiTietSP;
	}

	public void setChiTietSP(ChiTietSanPham chiTietSP) {
		this.chiTietSP = chiTietSP;
	}

	public DonHang getDonHang() {
		return donHang;
	}

	public void setDonHang(DonHang donHang) {
		this.donHang = donHang;
	}

	public float getGia() {
		return gia;
	}

	public void setGia(float gia) {
		this.gia = gia;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	
	
	
}
