package cnpm.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ChiTietDonHangPK implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name="MaCTSP")
	private int maCTSP;
	
	@Column(name="MaDH")
	private int MaDH;

	public int getMaCTSP() {
		return maCTSP;
	}

	public void setMaCTSP(int maCTSP) {
		this.maCTSP = maCTSP;
	}

	public int getMaDH() {
		return MaDH;
	}

	public void setMaDH(int maDH) {
		MaDH = maDH;
	}

	

	
	
	
}
