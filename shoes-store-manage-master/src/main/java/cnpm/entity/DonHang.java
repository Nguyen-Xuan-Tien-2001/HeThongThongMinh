package cnpm.entity;

import java.util.Collection;
import java.util.Date;

import javax.annotation.Generated;
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
@Table(name = "DONHANG")
public class DonHang {
	@Id
	@GeneratedValue
	@Column(name = "MaDH")
	private int maDH;

	@ManyToOne
	@JoinColumn(name = "MaNV")
	private NhanVien nhanVien;

	@ManyToOne
	@JoinColumn(name = "MaKH")
	private KhachHang khachHang;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "ThoiGian")
	private Date thoiGian;

	@Column(name = "SDTKH")
	private String sdtKH;

	@Column(name = "DiaChi")
	private String diaChi;

	@Column(name = "GhiChu")
	private String ghiChu;
	
	@Column(name="TenNguoiNhan")
	private String tenNguoiNhan;

	@ManyToOne
	@JoinColumn(name = "HinhThucThanhToan")
	private HinhThucThanhToan hinhThucTT;

	@ManyToOne
	@JoinColumn(name = "TinhTrangDonHang")
	private TrangThaiDonHang trangThaiDH;

	@Column(name = "TongTien")
	private float tongTien;

	@OneToMany(mappedBy = "donHang", fetch = FetchType.LAZY)
	private Collection<ChiTietDonHang> chiTietDonHangs;
	
	
	
	public String getTenNguoiNhan() {
		return tenNguoiNhan;
	}

	public void setTenNguoiNhan(String tenNguoiNhan) {
		this.tenNguoiNhan = tenNguoiNhan;
	}

	public int getMaDH() {
		return maDH;
	}

	public void setMaDH(int maDH) {
		this.maDH = maDH;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public KhachHang getKhachHang() {
		return khachHang;
	}

	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}

	public Date getThoiGian() {
		return thoiGian;
	}

	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
	}

	public String getSdtKH() {
		return sdtKH;
	}

	public void setSdtKH(String sdtKH) {
		this.sdtKH = sdtKH;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public HinhThucThanhToan getHinhThucTT() {
		return hinhThucTT;
	}

	public void setHinhThucTT(HinhThucThanhToan hinhThucTT) {
		this.hinhThucTT = hinhThucTT;
	}

	public TrangThaiDonHang getTrangThaiDH() {
		return trangThaiDH;
	}

	public void setTrangThaiDH(TrangThaiDonHang trangThaiDH) {
		this.trangThaiDH = trangThaiDH;
	}

	public float getTongTien() {
		return tongTien;
	}

	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}

	public Collection<ChiTietDonHang> getChiTietDonHangs() {
		return chiTietDonHangs;
	}

	public void setChiTietDonHangs(Collection<ChiTietDonHang> chiTietDonHangs) {
		this.chiTietDonHangs = chiTietDonHangs;
	}

	
}
