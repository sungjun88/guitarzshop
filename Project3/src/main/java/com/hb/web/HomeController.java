

package com.hb.web;
import java.io.File;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hb.mybatis.BVO;
import com.hb.mybatis.DAO;
import com.hb.mybatis.PVO;
import com.hb.mybatis.UVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private DAO dao;
	public DAO getDao() {return dao;}
	public void setDao(DAO dao) {this.dao = dao;}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("index");
		return mv;
	}
	
	
	@RequestMapping(value = "/main.do")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		return mv;
	}
	
	//admin
	@RequestMapping(value = "/adminpage.do")
	public ModelAndView adminpage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("adminpage");
		return mv;
	}
	
	@RequestMapping(value = "/addproductpage.do")
	public ModelAndView addproductpage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("addproductpage");
		return mv;
	}
	
	@RequestMapping(value="/addproductok", method=RequestMethod.GET)
	public ModelAndView addproductok(HttpServletRequest request){
		return new ModelAndView("alllist");
	}
	@RequestMapping(value="/addproductok", method=RequestMethod.POST)
	public ModelAndView addproductok(
									@RequestParam("pro_category") String pro_category,
									@RequestParam("pro_code") String pro_code,
									@RequestParam("pro_name") String pro_name,
									@RequestParam("pro_company") String pro_company,
									@RequestParam("pro_price") String pro_price,
									@RequestParam("pro_saleprice") String pro_saleprice,
									@RequestParam("pro_thum")MultipartFile pro_thum,
									@RequestParam("pro_img1")MultipartFile pro_img1,
									@RequestParam("pro_img2")MultipartFile pro_img2,
									@RequestParam("pro_img3")MultipartFile pro_img3,
									@RequestParam("pro_img4")MultipartFile pro_img4,
									@RequestParam("pro_img5")MultipartFile pro_img5,
									@RequestParam("pro_img6")MultipartFile pro_img6,
									@RequestParam("pro_img7")MultipartFile pro_img7,
									@RequestParam("pro_content") String pro_content,
									@RequestParam("pro_quantity") String pro_quantity,
									HttpServletRequest request){
	try {
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/upload");
		PVO pvo = new PVO();
		pvo.setPro_category(pro_category);
		pvo.setPro_code(pro_code);
		pvo.setPro_name(pro_name);
		pvo.setPro_company(pro_company);
		pvo.setPro_price(pro_price);
		pvo.setPro_saleprice(pro_saleprice);
		pvo.setPro_content(pro_content);
		pvo.setPro_quantity(pro_quantity);
		+++++++++++++++++++++++++++
		++++++
		// 첨부파일 없을때
		if(pro_thum.getOriginalFilename()== null){
			pvo.setFile_name("");	
		}else{
			pvo.setFile_name(pro_thum.getOriginalFilename());
		}
		int res = dao.getInsert(pvo);
		if(res>0){
			byte[] in = pro_thum.getBytes();
			File out = new File(path,bvo.getFile_name());
			FileCopyUtils.copy(in, out);
		}
		
	} catch (Exception e) {
	}
		return new ModelAndView("redirect:/list.hb");
	}
	
	
	
	// top of topnav
	
	@RequestMapping(value = "/loginpage.do")
	public ModelAndView loginpage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("loginpage");
		return mv;
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "menu")  //for include
	   public String newItem(Model model) {
	       return "menu";
	   }
	@RequestMapping(method = RequestMethod.POST, value = "menu")  //for include
	public String newItem1(Model model) {
		return "menu";
	}
	
	
	@RequestMapping(value = "/login.do")
	public ModelAndView getLogin(HttpServletRequest request){
		UVO uvo = new UVO();
		uvo.setCus_id(request.getParameter("cus_id"));
		uvo.setCus_pw(request.getParameter("cus_pw"));
		UVO uvo2 = dao.getLogin(uvo);
		HttpSession session = request.getSession();
		if(uvo2!=null){
			session.setAttribute("uvo", uvo2);
			session.setAttribute("login", 1);			
			return new ModelAndView("main");
		}else{
			session.setAttribute("login", -1);			
			return new ModelAndView("loginpage");
		}
		
	}
	
	@RequestMapping(value = "/logout.do")
	public ModelAndView getLogout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		ModelAndView mv = new ModelAndView("main");
		return mv;
	}
	
	@RequestMapping(value = "/joinPage.do")
	public ModelAndView getJoinPage(HttpServletRequest request){
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("joinpage");
		return mv;
	}
	
	@RequestMapping(value = "/join.do")
	public ModelAndView getJoin(HttpServletRequest request){
		UVO uvo = new UVO();
		uvo.setCus_name(request.getParameter("cus_name"));
		uvo.setCus_id(request.getParameter("cus_id"));
		uvo.setCus_pw(request.getParameter("cus_pw"));
		uvo.setCus_birth(request.getParameter("cus_birth"));
		uvo.setCus_gender(request.getParameter("cus_gender"));
		uvo.setCus_email(request.getParameter("cus_email"));
		uvo.setCus_phone(request.getParameter("cus_phone"));
		uvo.setCus_addr(request.getParameter("cus_addr"));
		uvo.setCus_recomm(request.getParameter("cus_recomm"));
		uvo.setCus_point("0");
		HttpSession session = request.getSession();
		session.setAttribute("join", 0);
		if(dao.getJoin(uvo)==1){
			session.setAttribute("uvo", uvo);
			return new ModelAndView("joinok");
		}else{
			session.setAttribute("join", -1);			
			return new ModelAndView("loginpage");
		}
		
	}
	
	
	//bottom of topnav
	
	@RequestMapping(value = "/elec.do")
	public ModelAndView elecpage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("elecpage");
		HttpSession session = request.getSession();
		
		List<PVO> eleclist = dao.getElecList(); 
		mv.addObject("eleclist", eleclist);
		System.out.println(eleclist);
		int res = eleclist.size();
		mv.addObject("eleclistsize", res);
		
		
		return mv;
	}
	
	 
	
	
	
	
	
}
