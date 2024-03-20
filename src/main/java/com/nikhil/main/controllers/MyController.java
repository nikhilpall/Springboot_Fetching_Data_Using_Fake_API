package com.nikhil.main.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nikhil.main.beans.Products;
import com.nikhil.main.services.ProductsServices;


@Controller
public class MyController {
	
	@Autowired
	ProductsServices productsServices;
	
	@GetMapping("/")
	public String openIndexPage() {
		return "index";
	}
	
	@GetMapping("/Products")
	public String openAllProductsPage(Model model, @RequestParam(defaultValue = "1") int page) {
		
		List<Products> list = productsServices.allProductList();
		int total_pages = list.size()/10;
		
		int si = (page - 1) * 10;
		int ei = page * 10;
		
		model.addAttribute("m_products_obj_list", list.subList(si, ei));
		model.addAttribute("m_total_pages", total_pages);
		
		return "products";
	}
}
