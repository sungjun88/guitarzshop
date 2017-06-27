package com.hb.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

// DB관련된 처리하는 클래스
public class DAO {
	private SqlSessionTemplate template;
	public SqlSessionTemplate getTemplate() {
		return template;
	}
	public void setTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	// DB처리 메소드
	// 전체 게시물의 수
	public int getTotalCount(){
		return template.selectOne("totalCount");
	}
	
	// 로그인
	public UVO getList(UVO uvo){
		return template.selectOne("list", uvo);
	}
	
	// 원글 list
	public List<BVO> getList(Map<String, Integer> map){
		return template.selectList("list", map);
	}
	
	//원글 삽입
	public int getInsert(BVO bvo){
		return template.insert("insert", bvo);
	}
	
	//원글 상세보기
	public BVO  getOnelist(String b_idx){
		return template.selectOne("onelist",b_idx);
	}
	// 원글 히트 업데이트
	public void getHitUpdate(BVO bvo){
		template.update("hit", bvo);
	}
	
	// 댓글
	public List<CVO> getCommList(String b_idx){
		return template.selectList("ans_list", b_idx);
	}
	
	//원글 업데이트
	public int getUpdate(BVO bvo){
		int res = template.update("update", bvo);
		return res;
	}
	//원글 업데이트
	public int getUpdate2(BVO bvo){
		int res = template.update("update2", bvo);
		return res;
	}
	
	//원글삭제
	public void getDelete(String b_idx){
		// 댓글 삭제후 원글 삭제
		template.delete("ans_Delete_all", b_idx);
		template.delete("delete", b_idx);
	}
	
	//댓글 삽입
	public void getAnswrite(CVO cvo){
		template.insert("ans_insert", cvo);
	}
	//댓글 삭제
	public void getAnsDelete(String c_idx){
		template.insert("ans_Delete", c_idx);
	}
}


















