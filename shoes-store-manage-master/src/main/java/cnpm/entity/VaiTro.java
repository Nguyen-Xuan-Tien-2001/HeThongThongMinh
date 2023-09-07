package cnpm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="VAITRO")
public class VaiTro {
	
	@Id
	@Column(name="MaVT")
	private String MaVT;
	
	@Column(name="TenVT")
	private String TenVT;
	
	@OneToMany(mappedBy = "vaitro")
	private Collection<TaiKhoan> taikhoans;

	public String getMaVT() {
		return MaVT;
	}

	public void setMaVT(String maVT) {
		MaVT = maVT;
	}

	public String getTenVT() {
		return TenVT;
	}

	public void setTenVT(String tenVT) {
		TenVT = tenVT;
	}

	public Collection<TaiKhoan> getTaikhoans() {
		return taikhoans;
	}

	public void setTaikhoans(Collection<TaiKhoan> taikhoans) {
		this.taikhoans = taikhoans;
	}

	
	
	
}
