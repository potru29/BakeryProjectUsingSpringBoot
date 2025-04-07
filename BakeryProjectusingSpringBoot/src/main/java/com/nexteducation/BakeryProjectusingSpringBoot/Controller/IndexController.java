package com.nexteducation.BakeryProjectusingSpringBoot.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class IndexController {
	@GetMapping("/login")
	public String loginpage() {
		return "login";
	}
	@GetMapping("/register")
	public String registerPage() {
		return "register";
	}
	@GetMapping("/Home")
	public String homepage() {
		return "Home";
	}
	


}
