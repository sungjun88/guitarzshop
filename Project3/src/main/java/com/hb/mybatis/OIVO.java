package com.hb.mybatis;

public class OIVO {
	private String oi_no, ord_no, pro_no;
	private int  oi_procount, oi_price, oi_saleprice;
	private int oi_totalprice;
	
	public OIVO() {	}
	

	
	public OIVO(String oi_no, String ord_no, String pro_no, int oi_procount, int oi_price, int oi_saleprice, int oi_totalprice) {
		super();
		this.oi_no = oi_no;
		this.ord_no = ord_no;
		this.pro_no = pro_no;
		this.oi_procount = oi_procount;
		this.oi_price = oi_price;
		this.oi_saleprice = oi_saleprice;
		this.oi_totalprice = oi_totalprice;
	}


	public String getOi_no() {
		return oi_no;
	}

	public void setOi_no(String oi_no) {
		this.oi_no = oi_no;
	}

	public String getOrd_no() {
		return ord_no;
	}

	public void setOrd_no(String ord_no) {
		this.ord_no = ord_no;
	}

	public String getPro_no() {
		return pro_no;
	}

	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}

	public int getOi_procount() {
		return oi_procount;
	}

	public void setOi_procount(int oi_procount) {
		this.oi_procount = oi_procount;
	}

	public int getOi_price() {
		return oi_price;
	}

	public void setOi_price(int oi_price) {
		this.oi_price = oi_price;
	}

	public int getOi_saleprice() {
		return oi_saleprice;
	}

	public void setOi_saleprice(int oi_saleprice) {
		this.oi_saleprice = oi_saleprice;
	}

	public int getOi_totalprice() {
		return oi_totalprice;
	}

	public void setOi_totalprice(int oi_totalprice) {
		this.oi_totalprice = oi_totalprice;
	}

	@Override
	public String toString() {
		return "OIVO [oi_no=" + oi_no + ", ord_no=" + ord_no + ", pro_no=" + pro_no + ", oi_procount=" + oi_procount
				+ ", oi_price=" + oi_price + ", oi_saleprice=" + oi_saleprice + ", oi_totalprice=" + oi_totalprice
				+ "]";
	}
	
	
}
