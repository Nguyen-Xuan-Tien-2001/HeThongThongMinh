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
@Table(name = "MAUSANPHAM")
public class MauSanPham {
	@Id
	@GeneratedValue
	@Column(name = "MaMau")
	private int maMau;
	
	@Column(name = "TenMau")
	private String tenMau;
	
	@OneToMany(mappedBy = "mauSanPham", fetch = FetchType.LAZY)
	private Collection<SanPham> sanPhams;
	
	public int getMaMau() {
		return maMau;
	}

	public void setMaMau(int maMau) {
		this.maMau = maMau;
	}

	public String getTenMau() {
		return tenMau;
	}

	public void setTenMau(String tenMau) {
		this.tenMau = tenMau;
	}

	
}
