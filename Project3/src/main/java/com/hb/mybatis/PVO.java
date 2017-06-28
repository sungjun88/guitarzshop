package com.hb.mybatis;

public class PVO {
	private String pro_no,pro_category,pro_code,pro_name,pro_company,pro_price,pro_saleprice,pro_thum,pro_img1,pro_img2,pro_img3,pro_img4,pro_img5,pro_img6,pro_img7,pro_content,pro_date;
	public PVO() {	}
	public PVO(String pro_no, String pro_category, String pro_code, String pro_name, String pro_company,
			String pro_price, String pro_saleprice, String pro_thum, String pro_img1, String pro_img2, String pro_img3,
			String pro_img4, String pro_img5, String pro_img6, String pro_img7, String pro_content, String pro_date) {
		super();
		this.pro_no = pro_no;
		this.pro_category = pro_category;
		this.pro_code = pro_code;
		this.pro_name = pro_name;
		this.pro_company = pro_company;
		this.pro_price = pro_price;
		this.pro_saleprice = pro_saleprice;
		this.pro_thum = pro_thum;
		this.pro_img1 = pro_img1;
		this.pro_img2 = pro_img2;
		this.pro_img3 = pro_img3;
		this.pro_img4 = pro_img4;
		this.pro_img5 = pro_img5;
		this.pro_img6 = pro_img6;
		this.pro_img7 = pro_img7;
		this.pro_content = pro_content;
		this.pro_date = pro_date;
	}
	public String getPro_no() {
		return pro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_category() {
		return pro_category;
	}
	public void setPro_category(String pro_category) {
		this.pro_category = pro_category;
	}
	public String getPro_code() {
		return pro_code;
	}
	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_company() {
		return pro_company;
	}
	public void setPro_company(String pro_company) {
		this.pro_company = pro_company;
	}
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_saleprice() {
		return pro_saleprice;
	}
	public void setPro_saleprice(String pro_saleprice) {
		this.pro_saleprice = pro_saleprice;
	}
	public String getPro_thum() {
		return pro_thum;
	}
	public void setPro_thum(String pro_thum) {
		this.pro_thum = pro_thum;
	}
	public String getPro_img1() {
		return pro_img1;
	}
	public void setPro_img1(String pro_img1) {
		this.pro_img1 = pro_img1;
	}
	public String getPro_img2() {
		return pro_img2;
	}
	public void setPro_img2(String pro_img2) {
		this.pro_img2 = pro_img2;
	}
	public String getPro_img3() {
		return pro_img3;
	}
	public void setPro_img3(String pro_img3) {
		this.pro_img3 = pro_img3;
	}
	public String getPro_img4() {
		return pro_img4;
	}
	public void setPro_img4(String pro_img4) {
		this.pro_img4 = pro_img4;
	}
	public String getPro_img5() {
		return pro_img5;
	}
	public void setPro_img5(String pro_img5) {
		this.pro_img5 = pro_img5;
	}
	public String getPro_img6() {
		return pro_img6;
	}
	public void setPro_img6(String pro_img6) {
		this.pro_img6 = pro_img6;
	}
	public String getPro_img7() {
		return pro_img7;
	}
	public void setPro_img7(String pro_img7) {
		this.pro_img7 = pro_img7;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
	public String getPro_date() {
		return pro_date;
	}
	public void setPro_date(String pro_date) {
		this.pro_date = pro_date;
	}
	@Override
	public String toString() {
		return "PVO [pro_no=" + pro_no + ", pro_category=" + pro_category + ", pro_code=" + pro_code + ", pro_name="
				+ pro_name + ", pro_company=" + pro_company + ", pro_price=" + pro_price + ", pro_saleprice="
				+ pro_saleprice + ", pro_thum=" + pro_thum + ", pro_img1=" + pro_img1 + ", pro_img2=" + pro_img2
				+ ", pro_img3=" + pro_img3 + ", pro_img4=" + pro_img4 + ", pro_img5=" + pro_img5 + ", pro_img6="
				+ pro_img6 + ", pro_img7=" + pro_img7 + ", pro_content=" + pro_content + ", pro_date=" + pro_date + "]";
	}
	
}
