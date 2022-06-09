package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.CategoryDao;
import com.example.dao.ErrorListDao;
import com.example.dao.UserDao;
import com.example.entity.ErrorList;
import com.example.form.ErrorListForm;
import com.example.form.LoginForm;

@Controller
public class IndexController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	ErrorListDao errorListDao;
	
	@Autowired
	CategoryDao categoryDao;
	
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
		model.addAttribute("errorList", errorListDao.find(""));
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
		model.addAttribute("errorList", errorListDao.find(""));
		return "menu";
	}
	
	//検索ボタンを押したとき（検索）
	@RequestMapping(value= "search")
	public String search(@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("errorList", errorListDao.find(keyword) );
		return "menu";
	}
	
	//新規登録画面へ遷移
	@GetMapping(value= "insert")
	public String insert(@ModelAttribute("errorListForm")ErrorListForm eForm, Model model) {
		var categoryList = categoryDao.findAll();
		model.addAttribute("categoryList", categoryList);
		return "insert";
	}
	
	//新規登録
	@PostMapping(value= "insert")
	public String insertProduct(@Validated @ModelAttribute("errorListForm")ErrorListForm eForm,BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			return "insert";
		}
		
		System.out.println(eForm.getCategory_Id());
		
		ErrorList errorList = new ErrorList();
		this.FormToErrorList(eForm, errorList);
		
		var count = errorListDao.insert(errorList);
		
		if(count == 1) {
			model.addAttribute("msg","登録に成功しました");
		}else {
			model.addAttribute("msg","登録に失敗しました");
		}
		
		model.addAttribute("errorList", errorListDao.find(""));
		
		return "menu";

	}
	
	//詳細ページに移動
	@GetMapping(value= "detail")
	public String detail(@RequestParam("id")Integer id,@ModelAttribute("detail") ErrorListForm eForm,  Model model) {
		//System.out.println(id);
		
		ErrorList errorList = errorListDao.findById(id);
		model.addAttribute("errorList", errorList);
		
		var categoryList = categoryDao.findAll();
		model.addAttribute("categoryList", categoryList);
		return "detail";
	}
	
	//削除
	@RequestMapping(value = "detail", params = "delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") int id, Model model) {
		var count = errorListDao.delete(id);
		
		if(count == 1) {
			model.addAttribute("msg","登録に成功しました");
		}else {
			model.addAttribute("msg","登録に失敗しました");
		}
		
		model.addAttribute("errorList", errorListDao.find(""));
		return "menu";
	}
	
	//詳細ページに移動
	@GetMapping(value= "update")
	public String update(@RequestParam("id")Integer id,@ModelAttribute("update") ErrorListForm eForm,  Model model) {
		//System.out.println(id);
		
		ErrorList errorList = errorListDao.findById(id);
		model.addAttribute("errorList", errorList);
		
		var categoryList = categoryDao.findAll();
		model.addAttribute("categoryList", categoryList);
		return "updateInput";
	}
	
	//更新
	
	 @RequestMapping(value= "update",params = "update", method = RequestMethod.POST)
	 public String update(@Validated @ModelAttribute("errorListForm")ErrorListForm eForm,BindingResult bindingResult, Model model) {
		 if(bindingResult.hasErrors()) {
				return "insert";
			}
		 
		 var errorList = new ErrorList();
		 errorList.setId(eForm.getId());
		 
		 this.FormToErrorList(eForm, errorList);
		 var count = errorListDao.update(errorList);
		 
		 if(count == 1) {
				model.addAttribute("msg","更新に成功しました");
		 }else {
			model.addAttribute("msg","更新に失敗しました");
		 }
		 
		 model.addAttribute("errorList", errorListDao.find(""));
		 
		 return "menu";

	 }
	 
	
	private void FormToErrorList(ErrorListForm eForm, ErrorList errorList) {
		errorList.setCategory_Id(eForm.getCategory_Id());		
		errorList.setErrorList(eForm.getErrorList());
		errorList.setCause(eForm.getCause());
		errorList.setSolution(eForm.getSolution());
	}
	

	
}
