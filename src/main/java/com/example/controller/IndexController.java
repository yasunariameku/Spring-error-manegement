package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.ErrorListDao;
import com.example.dao.UserDao;
import com.example.form.LoginForm;

@Controller
public class IndexController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	ErrorListDao errorListDao;
	
	@Autowired
	HttpSession session; 
	
	//トップページへ遷移
	@RequestMapping("/index")
	public String index(@ModelAttribute("login") LoginForm loginForm, Model model) {
		return "index";
	}
	
	//ログイン
	@RequestMapping(value = "/login", method = RequestMethod.POST )
	public String login(@Validated @ModelAttribute("login") LoginForm loginForm, BindingResult bindingResult , Model model) {
		
		if (bindingResult.hasErrors()) {
            return "index";
        }
		
		
		var user = userDao.login(loginForm.getLoginId(), loginForm.getPassword());
		
		if (user == null) {
			model.addAttribute("errorMsg","IDまたはパスワードが不正です。");
			return "index";
		}
		
		session.setAttribute("user", user);
		model.addAttribute("name", user.getName());
		//model.addAttribute("errorList", errorListDao.find(""));
		return "menu";
	}
	
	//ログアウト
	@RequestMapping(value= "logout")
	public String logout(@ModelAttribute("loginForm")LoginForm loginForm) {
		session.invalidate();
		return "logout";
	}
	
	//メニュー画面へ遷移
	@RequestMapping(value= "menu")
	public String menu(Model model) {
		//model.addAttribute("errorList", errorListDao.find(""));
		return "menu";
	}
	
	//検索ボタンを押したとき（検索）
	@RequestMapping(value= "search")
	public String search(@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("errorList", errorListDao.find(keyword) );
		return "menu";
	}
	
}
