package com.hb.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
	

public class CART {
	private List<OIVO> list;
	private int total;
	OIVO oivo = new OIVO();
	
	@Autowired
	private DAO dao;
	public DAO getDao() {return dao;}
	public void setDao(DAO dao) {this.dao = dao;}

	public CART() {
		list = new ArrayList<>();
	}

	public OIVO findProduct(String pro_no, List<OIVO> sessionlist) {
		oivo = null;
		list.clear();
		list = sessionlist;
		
		for (OIVO k : list) {
			if (k.getPro_no().equals(pro_no)) {
				oivo = k;
			}
		}	
		return oivo;
	}

	public List<OIVO> addProduct(String prono, int procount, String saleprice, String price, List<OIVO> sessionlist) {
		OIVO oivo = findProduct(prono, sessionlist);
		PVO pvo = dao.getContent(prono);
		if (oivo != null) {// 있을때
			oivo.setPro_no(prono);
			oivo.setOi_pvo(pvo);
			oivo.setOi_procount(oivo.getOi_procount() + procount); // 수량 업데이트
			oivo.setOi_price(Integer.parseInt(price) * oivo.getOi_procount());
			oivo.setOi_saleprice(Integer.parseInt(saleprice) * oivo.getOi_procount());
			total = total + procount * Integer.parseInt(saleprice);
		} else {
			OIVO oivo2 = new OIVO();
			oivo2.setPro_no(prono);
			oivo2.setOi_pvo(pvo);
			oivo2.setOi_procount(procount);
			oivo2.setOi_price(Integer.parseInt(price) * oivo2.getOi_procount());
			oivo2.setOi_saleprice(Integer.parseInt(saleprice) * oivo2.getOi_procount());
			total = total + procount * Integer.parseInt(saleprice);
			list.add(oivo2);
		}
		int k = list.get(0).getOi_procount();

		return list;
	}

	public List<OIVO> getList() {
		return list;
	}
	

}
