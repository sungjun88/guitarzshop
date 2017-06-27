

package com.hb.web;

import java.util.Locale;

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
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public void main(Locale locale, Model model) {
	}
	
	@RequestMapping(value = "/loginpage.do", method = RequestMethod.GET)
	public void loginpage(Locale locale, Model model) {
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "menu")  //인클루드용
	   public String newItem(Model model) {
	       return "menu";
	   }
	
	@RequestMapping(value = "/login.do")
	public ModelAndView login(@ModelAttribute("uvo")UVO uvo){
		uvo = dao.getList(uvo);
		
		System.out.println(uvo);
		return new ModelAndView("loginok");
	}
	
	 /*  //로그인 메소드
	   @RequestMapping("/login.hb")
	   public ModelAndView getLogin(HttpServletRequest request){
	      System.out.println("hello");
	      String u_email = request.getParameter("u_email");
	      String u_pwd = request.getParameter("u_pwd");
	      UVO uvo = new UVO();
	      uvo.setU_email(u_email);
	      uvo.setU_pwd(u_pwd);
	      UVO uvo2 = dao.getlogin(uvo);
	      System.out.println("kk");
	      
	      if(uvo2!=null){
	         System.out.println("loginsuccess");
	         HttpSession session = request.getSession();
	         session.setAttribute("uvo", uvo2);
	         session.setAttribute("login", false);
	         return new ModelAndView("redirect:/");
	      }else{
	         System.out.println("loginfail");
	         return new ModelAndView("redirect:/");
	      }
	   
	   }
	}*/
	
	
	
	
	
}
