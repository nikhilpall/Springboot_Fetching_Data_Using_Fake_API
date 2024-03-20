package com.nikhil.main.others;

public class AllJspMethods {
	
	public int prevPage(int currPage, int total_pages){
		if(currPage == 1){
			return total_pages;
		}
		return currPage-1;
	}
	
	public int nextPage(int currPage, int total_pages){
		if(currPage == total_pages){
			return 1;
		}
		return currPage+1;
	}
}
