package com.nexteducation.BakeryProjectusingSpringBoot.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import jakarta.servlet.http.HttpSession;

import com.nexteducation.BakeryProjectusingSpringBoot.Entity.BakeryEntity;
import com.nexteducation.BakeryProjectusingSpringBoot.Entity.CartItem;
import com.nexteducation.BakeryProjectusingSpringBoot.Entity.UserEntity;
import com.nexteducation.BakeryProjectusingSpringBoot.repository.BakeryRepository;
import com.nexteducation.BakeryProjectusingSpringBoot.service.BakeryService;
import com.nexteducation.BakeryProjectusingSpringBoot.service.UserService;

@Controller
public class BakeryController {
	@Autowired
	private BakeryService service;
	@Autowired
	private BakeryRepository repo;
	@GetMapping("/add")
	public String addpage() {
		return "add";
	}
	@GetMapping("/home")
	public String viewHomePage(HttpSession session,Model model) {
		if(session.getAttribute("userObj") == null) {
            return "redirect:/login";  
        }
	    List<BakeryEntity> list = repo.findAll();
	    model.addAttribute("items", list);
	    return "home";
	}

	@GetMapping("/admin")
	public String showAdminPage(Model model) {
	    model.addAttribute("items", service.getAllItems());
	    return "admin";
	}

	 @PostMapping("/addItem")
	    public String addItem(@RequestParam String name,
	                          @RequestParam int cost,
	                          @RequestParam String description,
	                          RedirectAttributes redirectAttributes) {
	        BakeryEntity item = new BakeryEntity();
	        item.setName(name);
	        item.setCost(cost);
	        item.setDescription(description);

	        service.addItem(item);
	        redirectAttributes.addFlashAttribute("message", "Item added successfully!");

	        return "redirect:/admin";
	 }
	 @GetMapping("/edit/{id}")
	    public String editItem(@PathVariable int id, Model model) {
	        BakeryEntity item = service.getItemById(id);
	        model.addAttribute("item", item);
	        return "edit";
	    }

	    // Handle Update request
	    @PostMapping("/updateItem")
	    public String updateItem(@ModelAttribute BakeryEntity item) {
	        service.updateItem(item);
	        return "redirect:/admin"; 
	    }
	    @GetMapping("/delete/{id}")
	    public String deleteItem(@PathVariable int id, Model model) {
	       service.deleteIntem(id);
	       return "redirect:/admin"; 
	    }
	    @GetMapping("/search")
	    public String searchItems(@RequestParam("keyword") String keyword, Model model) {
	        List<BakeryEntity> result = service.searchBakeryItems(keyword);
	        model.addAttribute("items", result);
	        return "home";
	    }

	    @Autowired
	    private UserService userService;

	    @PostMapping("/registerUser")
	    public String registerUser(@RequestParam String username,
	                               @RequestParam String password,
	                               RedirectAttributes redirectAttributes) {
	        UserEntity user = new UserEntity();
	        user.setUsername(username);
	        user.setPassword(password);

	        String message = userService.registerUser(user);
	        redirectAttributes.addFlashAttribute("msg", message);

	        return "redirect:/register";
	    }

	    @PostMapping("/loginUser")
	    public String loginUser(@RequestParam String username,
	                            @RequestParam String password,
	                            HttpSession session,
	                            RedirectAttributes redirectAttributes) {

	        boolean isValid = userService.loginUser(username, password);

	        if(isValid) {
	        	session.setAttribute("userObj", redirectAttributes);
	            return "redirect:/home"; 
	        } else {
	            redirectAttributes.addFlashAttribute("msg", "Invalid Credentials");
	            return "redirect:/login";
	        }
	    }
	    @PostMapping("/logout")
	    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
	        session.invalidate(); 
	        redirectAttributes.addFlashAttribute("msg", "Logged out Successfully!");
	        return "redirect:/login";
	    }
	    @PostMapping("/addToCart/{id}")
	    public String addToCart(@PathVariable int id, @RequestParam int quantity, HttpSession session) {
	        BakeryEntity item = service.getItemById(id);

	        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

	        if (cart == null) {
	            cart = new java.util.ArrayList<>();
	        }

	        cart.add(new CartItem(item, quantity));
	        session.setAttribute("cart", cart);

	        return "redirect:/cart";
	    }
	    @GetMapping("/cart")
	    public String viewCart(HttpSession session, Model model) {
	        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
	        
	        int total = 0;
	        if (cart != null) {
	            for (CartItem c : cart) {
	                total += c.getTotalPrice();
	            }
	        }
	        
	        model.addAttribute("cart", cart);
	        model.addAttribute("total", total);
	        
	        return "cart";
	    }
	    @PostMapping("/placeOrder")
	    public String placeOrder(HttpSession session, Model model) {
	      
	        session.removeAttribute("cart");

	        model.addAttribute("message", "Your order is ready!");

	        model.addAttribute("total", 0);

	        return "cart";
	    }
	    @PostMapping("/removeFromCart/{id}")
	    public String removeFromCart(@PathVariable int id, HttpSession session) {
	        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

	        if (cart != null) {
	            cart.removeIf(c -> c.getItem().getId() == id);
	        }

	        session.setAttribute("cart", cart);
	        return "redirect:/cart";
	    }

	    @PostMapping("/clearCart")
	    public String clearCart(HttpSession session) {
	        session.setAttribute("cart", new ArrayList<>());
	        return "redirect:/cart";
	    }


 
	    



}
