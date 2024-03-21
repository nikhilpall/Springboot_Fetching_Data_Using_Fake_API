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
	
	private static final int noOfProductsToDisplay = 15;
	
	@Autowired
	ProductsServices productsServices;
	
	@GetMapping("/")
	public String openIndexPage() {
		return "index";
	}
	
	@GetMapping("/Products")
	public String openAllProductsPage(Model model, @RequestParam(defaultValue = "1") int page) {
		
		List<Products> list = productsServices.allProductList();
		int total_pages = (int) Math.ceil((double) list.size()/noOfProductsToDisplay);
		
		int si = (page - 1) * noOfProductsToDisplay;
		int ei = page * noOfProductsToDisplay;
		
		int list_last_index = Math.min(ei, list.size());
		
		model.addAttribute("m_products_obj_list", list.subList(si, list_last_index));
		model.addAttribute("m_total_pages", total_pages);
		
		return "products";
	}
}
