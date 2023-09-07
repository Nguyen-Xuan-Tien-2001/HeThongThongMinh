package cnpm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TRANGTHAIDONHANG")
public class TrangThaiDonHang {
	
	@Id
	@GeneratedValue
	@Column(name = "MaTTDH")
	private int maTTDH;
	
	@Column(name = "TrangThai")
	private String trangThai;
	
	@OneToMany(mappedBy = "trangThaiDH", fetch = FetchType.EAGER)
	private Collection<DonHang> donHangs;
	
	public int getMaTTDH() {
		return maTTDH;
	}

	public void setMaTTDH(int maTTDH) {
		this.maTTDH = maTTDH;
	}

	public String getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}

	public Collection<DonHang> getDonHangs() {
		return donHangs;
	}

	public void setDonHangs(Collection<DonHang> donHangs) {
		this.donHangs = donHangs;
	}

	
}
