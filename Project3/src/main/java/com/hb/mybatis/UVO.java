package com.hb.mybatis;

public class UVO {
	private String cus_name, cus_id, cus_pw, cus_birth, cus_gender, cus_email, cus_phone, cus_addr, cus_recomm, cus_point ;
	public UVO() {	}
	public UVO(String cus_name, String cus_id, String cus_pw, String cus_birth, String cus_gender, String cus_email,
			String cus_phone, String cus_addr, String cus_recomm, String cus_point) {
		super();
		this.cus_name = cus_name;
		this.cus_id = cus_id;
		this.cus_pw = cus_pw;
		this.cus_birth = cus_birth;
		this.cus_gender = cus_gender;
		this.cus_email = cus_email;
		this.cus_phone = cus_phone;
		this.cus_addr = cus_addr;
		this.cus_recomm = cus_recomm;
		this.cus_point = cus_point;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getCus_id() {
		return cus_id;
	}
	public void setCus_id(String cus_id) {
		this.cus_id = cus_id;
	}
	public String getCus_pw() {
		return cus_pw;
	}
	public void setCus_pw(String cus_pw) {
		this.cus_pw = cus_pw;
	}
	public String getCus_birth() {
		return cus_birth;
	}
	public void setCus_birth(String cus_birth) {
		this.cus_birth = cus_birth;
	}
	public String getCus_gender() {
		return cus_gender;
	}
	public void setCus_gender(String cus_gender) {
		this.cus_gender = cus_gender;
	}
	public String getCus_email() {
		return cus_email;
	}
	public void setCus_email(String cus_email) {
		this.cus_email = cus_email;
	}
	public String getCus_phone() {
		return cus_phone;
	}
	public void setCus_phone(String cus_phone) {
		this.cus_phone = cus_phone;
	}
	public String getCus_addr() {
		return cus_addr;
	}
	public void setCus_addr(String cus_addr) {
		this.cus_addr = cus_addr;
	}
	public String getCus_recomm() {
		return cus_recomm;
	}
	public void setCus_recomm(String cus_recomm) {
		this.cus_recomm = cus_recomm;
	}
	public String getCus_point() {
		return cus_point;
	}
	public void setCus_point(String cus_point) {
		this.cus_point = cus_point;
	}
	
	@Override
	public String toString() {
		return "UVO [cus_name=" + cus_name + ", cus_id=" + cus_id + ", cus_pw=" + cus_pw + ", cus_birth=" + cus_birth
				+ ", cus_gender=" + cus_gender + ", cus_email=" + cus_email + ", cus_phone=" + cus_phone + ", cus_addr="
				+ cus_addr + ", cus_recomm=" + cus_recomm + ", cus_point=" + cus_point + "]";
	}
	
}
