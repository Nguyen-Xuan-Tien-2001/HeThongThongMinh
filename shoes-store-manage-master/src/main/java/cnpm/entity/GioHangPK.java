package cnpm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class GioHangPK implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Column(name="MaKH")
	private String maKH;
	
	@Column(name="MaChiTietSP")
	private int maCTSP;

	public String getMaKH() {
		return maKH;
	}

	public void setMaKH(String maKH) {
		this.maKH = maKH;
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
		result = prime * result + ((maKH == null) ? 0 : maKH.hashCode());
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
		GioHangPK other = (GioHangPK) obj;
		if (maCTSP != other.maCTSP)
			return false;
		if (maKH == null) {
			if (other.maKH != null)
				return false;
		} else if (!maKH.equals(other.maKH))
			return false;
		return true;
	}

	
	
	public GioHangPK() {
		super();
	}

	public GioHangPK(String maKH, int maCTSP) {
		super();
		this.maKH = maKH;
		this.maCTSP = maCTSP;
	}
	
	
	
	
}
