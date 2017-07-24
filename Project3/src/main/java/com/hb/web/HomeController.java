

package com.hb.web;
import java.io.File;
import java.util.ArrayList;
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
import com.hb.mybatis.CART;
import com.hb.mybatis.DAO;
import com.hb.mybatis.OIVO;
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
		
		List<PVO> productlist = dao.getProductList(); 
		mv.addObject("productlist", productlist);
		int res = productlist.size();
		mv.addObject("productlistsize", res);
		
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
		
		
		String path = request.getSession().getServletContext().getRealPath("resources/upload/"+pro_category);
		PVO pvo = new PVO();
		pvo.setPro_category(pro_category);
		pvo.setPro_code(pro_code);
		pvo.setPro_name(pro_name);
		pvo.setPro_company(pro_company);
		pvo.setPro_price(pro_price);
		pvo.setPro_saleprice(pro_saleprice);
		pvo.setPro_content(pro_content);
		pvo.setPro_quantity(pro_quantity);
		pvo.setPro_thum(pro_thum.getOriginalFilename());
		pvo.setPro_img1(pro_img1.getOriginalFilename());
		
		//첨부파일 없을때
		if(pro_img2.getOriginalFilename()== null){
			pvo.setPro_img2("");
		}else{
			pvo.setPro_img2(pro_img2.getOriginalFilename());
		}
		if(pro_img3.getOriginalFilename()== null){
			pvo.setPro_img3("");	
		}else{
			pvo.setPro_img3(pro_img3.getOriginalFilename());
		}
		if(pro_img4.getOriginalFilename()== null){
			pvo.setPro_img4("");	
		}else{
			pvo.setPro_img4(pro_img4.getOriginalFilename());
		}
		if(pro_img5.getOriginalFilename()== null){
			pvo.setPro_img5("");	
		}else{
			pvo.setPro_img5(pro_img5.getOriginalFilename());
		}
		if(pro_img6.getOriginalFilename()== null){
			pvo.setPro_img6("");	
		}else{
			pvo.setPro_img6(pro_img6.getOriginalFilename());
		}
		if(pro_img7.getOriginalFilename()== null){
			pvo.setPro_img7("");	
		}else{
			pvo.setPro_img7(pro_img7.getOriginalFilename());
		}
		///////
		System.out.println(pvo);
		
		int res = dao.getAddProduct(pvo);
		///////
		System.out.println(res);
		
		if(res>0){
			byte[] in = pro_thum.getBytes();
			File out = new File(path,pvo.getPro_thum());
			FileCopyUtils.copy(in, out);
		}
		
		
	} catch (Exception e) {
	}
		return new ModelAndView("redirect:/productlistpage.do");
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
	
	@RequestMapping(method = RequestMethod.GET, value = "productlistpage")  //for include
	public String newItem2(Model model) {
		return "productlistpage";
	}
	@RequestMapping(method = RequestMethod.POST, value = "productlistpage")  //for include
	public String newItem3(Model model) {
		return "productlistpage";
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
			String pwhint = uvo2.getCus_pw().charAt(0)+"";
			for (int i = 1; i < uvo2.getCus_pw().length(); i++) pwhint = pwhint+"*";
			session.setAttribute("pwhint", pwhint);
			session.setAttribute("login", 1);			
			return new ModelAndView("main");
		}else{
			request.setAttribute("login", -1);			
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
		
		if(dao.getDupJoin(uvo)==null){
			if(dao.getJoin(uvo)==1){
				session.setAttribute("uvo", uvo);
				return new ModelAndView("joinok");
			}else{
				request.setAttribute("join", -1);		//리퀘스트로 바꿔도 될것 같다.	
				return new ModelAndView("loginpage");
			}
		}else{
			request.setAttribute("join", -1);		//리퀘스트로 바꿔도 될것 같다.	
			return new ModelAndView("joinpage");
		}
		
		
		
	}
	
	
	//bottom of topnav
	
	@RequestMapping(value = "/productlistpage.do")
	public ModelAndView productList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("productlistpage");
		HttpSession session = request.getSession();
		String protype = request.getParameter("protype");
		List<PVO> productlist;
		
		if(protype==null){
			productlist = dao.getProductList(); 
		}else {
			productlist = dao.getProductOneList(protype); 
		}
		
		mv.addObject("productlist", productlist);
		int res = productlist.size();
		mv.addObject("productlistsize", res);
		
		
		return mv;
	}
		
	//contentpage
	
	@RequestMapping(value = "/contentpage.do")
	public ModelAndView contentPage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("contentpage");
		HttpSession session = request.getSession();
		
		PVO content = dao.getContent(request.getParameter("proidx")	); 
		mv.addObject("pvo", content);
		
		return mv;
	}
	
	@RequestMapping(value = "/cart.do")
	public ModelAndView cart(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("contentpage");
		HttpSession session = request.getSession();
		CART cart = new CART();
		cart.setDao(dao);
		String prono = request.getParameter("prono");
		String procount = request.getParameter("procount");
		String saleprice = request.getParameter("saleprice");
		String price = request.getParameter("price");
		List<OIVO> sessionlist = (List<OIVO>)session.getAttribute("cartlist");
		if(sessionlist == null) sessionlist = new ArrayList<>();
		List<OIVO> cartlist = cart.addProduct(prono, Integer.parseInt(procount),saleprice,price,sessionlist);
		session.setAttribute("cartlist", cartlist);
		
		PVO content = dao.getContent(request.getParameter("prono"));
		mv.addObject("pvo", content);
				
		if(request.getParameter("retVal").equals("true")){
			session = request.getSession();
			session.getAttribute("cart");
			mv = new ModelAndView("cartpage");
			return mv;
		}
		return mv;
	}

	
	@RequestMapping(value = "/cartpage.do")
	public ModelAndView cartPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("cart");
		ModelAndView mv = new ModelAndView("cartpage");
		return mv;
	}
	
	@RequestMapping(value = "/profilePage.do")
	public ModelAndView profilePage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv;
		String login;
		if(session.getAttribute("login") == null){
			login = "";
		}else{
			login = session.getAttribute("login").toString();
		}
		if(login.equals("1")){
			
			
			mv = new ModelAndView("profilePage");
		}else{
			request.setAttribute("login2", true);
			mv = new ModelAndView("loginpage");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "/modify.do")
	public ModelAndView getModify(HttpServletRequest request){
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
			request.setAttribute("join", -1);			
			return new ModelAndView("loginpage");
		}
		
	}
	
	
}
