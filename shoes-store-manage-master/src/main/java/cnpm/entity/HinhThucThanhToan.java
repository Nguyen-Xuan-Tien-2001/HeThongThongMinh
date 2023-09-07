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
@Table(name = "HINHTHUCTHANHTOAN")
public class HinhThucThanhToan {
	@Id
	@GeneratedValue
	@Column(name = "MaHTTT")
	private int maHTTT;
	
	@Column(name = "KieuTT")
	private String kieuTT;
	
	@OneToMany(mappedBy = "hinhThucTT", fetch = FetchType.EAGER)
	private Collection<DonHang> donHangs;


	public int getMaHTTT() {
		return maHTTT;
	}

	public void setMaHTTT(int maHTTT) {
		this.maHTTT = maHTTT;
	}

	public String getKieuTT() {
		return kieuTT;
	}

	public void setKieuTT(String kieuTT) {
		this.kieuTT = kieuTT;
	}

	public Collection<DonHang> getDonHangs() {
		return donHangs;
	}

	public void setDonHangs(Collection<DonHang> donHangs) {
		this.donHangs = donHangs;
	}

	
}
