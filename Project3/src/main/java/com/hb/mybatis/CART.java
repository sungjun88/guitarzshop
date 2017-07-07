package com.hb.mybatis;

import java.util.ArrayList;
import java.util.List;

public class CART {
	private List<OIVO> list;
	private int total;
	
	public CART() {list = new ArrayList<>();}
	
	public OIVO findProduct(String pro_no){
		OIVO oivo = null;
		for(OIVO k: list){
			if(k.getPro_no().equals(pro_no)){
				oivo = k;
			}
		}
		return oivo;
	}
	
	public List<OIVO> addProduct(String prono,int procount,String saleprice, String price){
		OIVO oivo = new OIVO();
		oivo = findProduct(prono);
		DAO dao = new DAO();
		if(oivo != null){//있을때
			oivo.setOi_procount(oivo.getOi_procount()+procount); //수량 업데이트
			oivo.setOi_price(Integer.parseInt(price)*oivo.getOi_procount());
			oivo.setOi_saleprice(Integer.parseInt(saleprice)*oivo.getOi_procount());
			total = total + procount*Integer.parseInt(saleprice);
		}else{
			OIVO oivo2 = new OIVO();
			oivo2.setOi_procount(procount);
			oivo2.setOi_price(Integer.parseInt(price)*oivo2.getOi_procount());
			oivo2.setOi_saleprice(Integer.parseInt(saleprice)*oivo2.getOi_procount());
			total = total + procount*Integer.parseInt(saleprice);
			list.add(oivo2);
			
		}
			
			
		return list;
	}

	
	
	
	
}
