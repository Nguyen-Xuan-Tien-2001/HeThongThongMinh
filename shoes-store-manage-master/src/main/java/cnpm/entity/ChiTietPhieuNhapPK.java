package cnpm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ChiTietPhieuNhapPK implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Column(name="MaPhieuNhap")
	private int maPhieuNhap;
	
	@Column(name="MaChiTietSP")
	private int maCTSP;

	public int getMaPhieuNhap() {
		return maPhieuNhap;
	}

	public void setMaPhieuNhap(int maPhieuNhap) {
		this.maPhieuNhap = maPhieuNhap;
	}

	public int getMaCTSP() {
		return maCTSP;
	}

	public void setMaCTSP(int maCTSP) {
		this.maCTSP = maCTSP;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + maCTSP;
		result = prime * result + maPhieuNhap;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChiTietPhieuNhapPK other = (ChiTietPhieuNhapPK) obj;
		if (maCTSP != other.maCTSP)
			return false;
		if (maPhieuNhap != other.maPhieuNhap)
			return false;
		return true;
	}
	
	
}