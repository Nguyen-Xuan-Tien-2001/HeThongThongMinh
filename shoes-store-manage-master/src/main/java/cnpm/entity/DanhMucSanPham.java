
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

@Table(name = "DANHMUCSANPHAM")
public class DanhMucSanPham {

	@Id
	@GeneratedValue
	@Column(name = "MaDanhMuc")
	private int maDM;

	@Column(name = "TenDanhMuc")
	private String tenDM;
	
	@OneToMany(mappedBy = "danhMuc", fetch=FetchType.EAGER)
	private Collection<SanPham> sanPhams;
	

	public Collection<SanPham> getSanPhams() {
		return sanPhams;
	}

	public void setSanPhams(Collection<SanPham> sanPhams) {
		this.sanPhams = sanPhams;
	}

	public int getMaDM() {
		return maDM;
	}

	public void setMaDM(int maDM) {
		this.maDM = maDM;
	}

	public String getTenDM() {
		return tenDM;
	}

	public void setTenDM(String tenDM) {
		this.tenDM = tenDM;
	}


}
