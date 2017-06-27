

package com.hb.web;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hb.mybatis.DAO;
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
	
	@RequestMapping(value = "/loginpage.do")
	public ModelAndView loginpage(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("loginpage");
		return mv;
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "menu")  //인클루드용
	   public String newItem(Model model) {
	       return "menu";
	   }
	@RequestMapping(method = RequestMethod.POST, value = "menu")  //인클루드용
	public String newItem1(Model model) {
		return "menu";
	}
	
	
	@RequestMapping(value = "/login.do")
	public ModelAndView getLogin(HttpServletRequest request){
		UVO uvo = new UVO();
		uvo.setCus_id(request.getParameter("cus_id"));
		uvo.setCus_pw(request.getParameter("cus_pw"));
		UVO uvo2 = dao.getList(uvo);
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
	

	
	 
	
	
	
	
	
}
