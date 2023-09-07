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
@Table(name = "SIZESANPHAM")
public class SizeSanPham {
	@Id
	@GeneratedValue
	@Column(name = "MaSize")
	private int maSize;
	
	@Column(name = "TenSize")
	private String tenSize;

	@OneToMany(mappedBy = "sizeSanPham", fetch = FetchType.LAZY)
	private Collection<ChiTietSanPham> chiTietSanPhams;

	public int getMaSize() {
		return maSize;
	}

	public void setMaSize(int maSize) {
		this.maSize = maSize;
	}

	public String getTenSize() {
		return tenSize;
	}

	public void setTenSize(String tenSize) {
		this.tenSize = tenSize;
	}

	public Collection<ChiTietSanPham> getChiTietSanPhams() {
		return chiTietSanPhams;
	}

	public void setChiTietSanPhams(Collection<ChiTietSanPham> chiTietSanPhams) {
		this.chiTietSanPhams = chiTietSanPhams;
	}

	
	
}
