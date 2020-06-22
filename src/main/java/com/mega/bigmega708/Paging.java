package com.mega.bigmega708;


public class Paging {
	
	int page;
	int totalCount;
	int countList =9;
	int totalPage;
	int countPage = 10;
	int startPage;
	int endPage;	
	int pageNo;
	
	public Paging() {
		this.endPage = startPage + countPage - 1;
		if(endPage>totalPage){
			this.endPage = totalPage;
		}
		
	}
	
	
	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		if(page<1) {
			this.page = 1;
		}else if(page > getTotalPage()){
			this.page = getTotalPage();

		}else {
			this.page = page;
		}
		
	}


	public int getTotalCount() {
		
		
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getCountList() {
		return countList;
	}


	public void setCountList(int countList) {
		this.countList = countList;
	}


	public int getTotalPage() {
		totalPage = totalCount / countList;	
		
		if(totalCount%countList>0)
		{
			totalPage++;
		}

		if(totalPage<page)
		{
			page = totalPage;
		}
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getCountPage() {
		return countPage;
	}


	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}


	public int getStartPage() {
		startPage = ((page - 1) / countPage) * countPage + 1;
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {	
		this.endPage = getStartPage() + getCountPage() - 1;
		if(endPage>getTotalPage()){
			this.endPage = getTotalPage();
		}
		
		return endPage;
	}
	
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getPageNo() {
		return pageNo;
	}


	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	
	
}
