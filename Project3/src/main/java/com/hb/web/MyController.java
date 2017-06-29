package com.hb.web;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hb.mybatis.BVO;
import com.hb.mybatis.CVO;
import com.hb.mybatis.DAO;
import com.hb.mybatis.Pageing;

@Controller
public class MyController {
	@Autowired
	private DAO dao;
	@Autowired
	private Pageing pageing;
	
	public DAO getDao() {
		return dao;
	}
	public void setDao(DAO dao) {
		this.dao = dao;
	}
	public Pageing getPageing() {
		return pageing;
	}
	public void setPageing(Pageing pageing) {
		this.pageing = pageing;
	}
	@RequestMapping("/list.hb")
	public ModelAndView getList(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("list");
		String cPage = request.getParameter("cPage");
		if(cPage != null) pageing.setNowPage(Integer.parseInt(cPage));
		
		// 전체게시물의 수 구하기
		pageing.setTotalRecord(dao.getTotalCount());
		pageing.setTotalPage();
		
		// 해당 페이지의 시작번호, 끝번호
		pageing.setBegin((pageing.getNowPage()-1)*pageing.getNumPerPage()+1);
		pageing.setEnd((pageing.getBegin()-1)+pageing.getNumPerPage());
		
		// 블록의 시작페이지와 블록의 끝페이지 구하기
		pageing.setBeginPage(
		(int)(((pageing.getNowPage()-1)/pageing.getPagePerBlock())*pageing.getPagePerBlock()+1));
		pageing.setEndPage(pageing.getBeginPage()+pageing.getPagePerBlock()-1);
		
		// 주의 사항 : endpage와 totalPage 크기가 틀릴 겨우 (endPage>totalPage)
		if(pageing.getEndPage() > pageing.getTotalPage()){
			pageing.setEndPage(pageing.getTotalPage());
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin",pageing.getBegin());
		map.put("end", pageing.getEnd());
		
		List<BVO> list = dao.getList(map);
		mv.addObject("list", list);
		mv.addObject("pvo", pageing);
		return mv;
	}
	
	@RequestMapping("/write.hb")
	public ModelAndView getWrite(){
		return new ModelAndView("write");
	}
	
	@RequestMapping(value="/write_ok", method=RequestMethod.GET)
	public ModelAndView getWrite_ok1(HttpServletRequest request){
		return new ModelAndView("wirte");
	}
	@RequestMapping(value="/write_ok", method=RequestMethod.POST)
	public ModelAndView getWrite_ok(@RequestParam("file_name")MultipartFile file,
									@RequestParam("subject") String subject,
									@RequestParam("writer") String writer,
									@RequestParam("content") String content,
									@RequestParam("pwd") String pwd,
									HttpServletRequest request){
	try {
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
		BVO bvo = new BVO();
		bvo.setSubject(subject);
		bvo.setWriter(writer);
		bvo.setContent(content);
		bvo.setPwd(pwd);
		bvo.setIp(request.getRemoteAddr());
		// 첨부파일 없을때
		if(file.getOriginalFilename()== null){
			bvo.setFile_name("");	
		}else{
			bvo.setFile_name(file.getOriginalFilename());
		}
		int res = dao.getInsert(bvo);
		if(res>0){
			byte[] in = file.getBytes();
			File out = new File(path,bvo.getFile_name());
			FileCopyUtils.copy(in, out);
		}
		
	} catch (Exception e) {
	}
		return new ModelAndView("redirect:/list.hb");
	}
	
	@RequestMapping("/view.hb")
	public ModelAndView getView(HttpServletRequest request){
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		
		// 원글 상세보기 
		BVO bvo = dao.getOnelist(b_idx);
		
		// 히트수 증가
		int hit = Integer.parseInt(bvo.getHit())+1;
		bvo.setHit(String.valueOf(hit));
		
		// 히트수 업데이트
		dao.getHitUpdate(bvo);
		
		// 댓글 가져오기
		List<CVO> c_list = dao.getCommList(b_idx);
		
		// 수정,삭제를 위해서 session에 담자
		HttpSession session = request.getSession();
		session.setAttribute("bvo", bvo);
		
		// 업로드 파일에 대한 정보 담기
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
	    path = path +"/"+bvo.getFile_name();
	    session.setAttribute("upPath", path);
	   	
	    // 댓글
		request.setAttribute("c_list", c_list);
		request.setAttribute("cPage", cPage);
		
		return new ModelAndView("view");
	}
	@RequestMapping("/down.hb")
	public void getFileDown(HttpServletRequest request, HttpServletResponse response){
		try {
			String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
			String file_name = request.getParameter("file_name");
			String encoded_path = URLEncoder.encode(file_name, "utf-8");
			
			// 브라우저 설정
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename="+encoded_path);
			
			// 실제 IO
			File file = new File(path+"/"+new String(file_name.getBytes("utf-8")));
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream in = new BufferedInputStream(fis);
			
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(in, out);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@RequestMapping("modify.hb")
	public ModelAndView getModify(HttpServletRequest request){
		String cPage = request.getParameter("cPage");
		request.setAttribute("cPage", cPage);
		return new ModelAndView("modify");
	}
	
	@RequestMapping(value="/modify_ok.hb", method=RequestMethod.POST)
	public ModelAndView getModify_ok(@RequestParam("file_name")MultipartFile file,
									@RequestParam("subject") String subject,
									@RequestParam("writer") String writer,
									@RequestParam("content") String content,
									@RequestParam("pwd") String pwd,
									@RequestParam("b_idx")String b_idx,
									@RequestParam("cPage")String cPage,
									HttpServletRequest request){
	try {
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
		BVO bvo = new BVO();
		bvo.setSubject(subject);
		bvo.setWriter(writer);
		bvo.setContent(content);
		bvo.setPwd(pwd);
		bvo.setB_idx(b_idx);
		bvo.setIp(request.getRemoteAddr());

		// 첨부파일 없을때
		if(file.getOriginalFilename() == ""){
			// 파일 업데이트 안함
			int res = dao.getUpdate2(bvo);
		}else{
			// 파일 업데이트함
			bvo.setFile_name(file.getOriginalFilename());
			int res = dao.getUpdate(bvo);
			if(res>0){
				byte[] in = file.getBytes();
				File out = new File(path,bvo.getFile_name());
				FileCopyUtils.copy(in, out);
			}
		}
		
	} catch (Exception e) {
	}
		return new ModelAndView("redirect:/view.hb?cPage="+cPage+"&b_idx="+b_idx);
	}
	
	@RequestMapping("delete.hb")
	public ModelAndView getDelete(){
		return new ModelAndView("delete");
	}
	@RequestMapping("delete_ok.hb")
	public ModelAndView getDelete_ok(@RequestParam("b_idx")String b_idx){
		dao.getDelete(b_idx);
		return new ModelAndView("redirect:/list.hb");
	}
	@RequestMapping("ans_write.hb")
	public ModelAndView getAns_write(CVO cvo, HttpServletRequest request){
		String cPage = request.getParameter("cPage");
		cvo.setIp(request.getRemoteAddr());
		dao.getAnswrite(cvo);
		return new ModelAndView("redirect:/view.hb?b_idx="+cvo.getB_idx()+"&cPage="+cPage);
	}
	@RequestMapping("ans_del.hb")
	public ModelAndView getAns_del(HttpServletRequest request){
		String c_idx = request.getParameter("c_idx");
		String b_idx = request.getParameter("b_idx");
		String cPage = request.getParameter("cPage");
		dao.getAnsDelete(c_idx);
		return new ModelAndView("redirect:/view.hb?b_idx="+b_idx+"&cPage="+cPage);
	}
}

















