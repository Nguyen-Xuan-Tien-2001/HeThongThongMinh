package cnpm.model;

import javax.persistence.GeneratedValue;

public class ThongTinChiTietPN {

	@GeneratedValue
	private int maTTCTPN;
	
	private int maSP;
	
	private String tenSP;
	
	private int maSize;
	
	private String tenSize;
	
	private int soLuong;
	
	private float gia;
	
	

	
	public float getGia() {
		return gia;
	}

	public void setGia(float gia) {
		this.gia = gia;
	}

	public int getMaTTCTPN() {
		return maTTCTPN;
	}

	public void setMaTTCTPN(int maTTCTPN) {
		this.maTTCTPN = maTTCTPN;
	}

	public int getMaSP() {
		return maSP;
	}

	public void setMaSP(int maSP) {
		this.maSP = maSP;
	}

	public int getMaSize() {
		return maSize;
	}

	public void setMaSize(int maSize) {
		this.maSize = maSize;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public String getTenSP() {
		return tenSP;
	}

	public void setTenSP(String tenSP) {
		this.tenSP = tenSP;
	}

	public String getTenSize() {
		return tenSize;
	}

	public void setTenSize(String tenSize) {
		this.tenSize = tenSize;
	}
	
}
