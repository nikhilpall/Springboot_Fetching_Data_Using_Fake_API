package com.nikhil.main.services;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nikhil.main.beans.Products;

@Service
public class ProductsServices {
	
	public List<Products> allProductList(){
		
		String url = "https://dummyjson.com/products?limit=100";
		
		RestTemplate restTemplate = new RestTemplate();
		String jsonStr = restTemplate.getForObject(url, String.class);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false); // IMP ******
		
		List<Products> list = new ArrayList<>();
		
		try {
			JsonNode jsonNode = mapper.readTree(jsonStr);
			
			JsonNode rootNode = jsonNode.get("products");
			
			list = mapper.readValue(rootNode.toString(), new TypeReference<List<Products>>() {});
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
