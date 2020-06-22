package com.mega.bigmega708;

public class BbsDTO {
	int bbsnum;
	String title, writer, content, sigan;
	int pageNo;
	public int getBbsnum() {
		return bbsnum;
	}
	public void setBbsnum(int bbsnum) {
		this.bbsnum = bbsnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSigan() {
		return sigan;
	}
	public void setSigan(String sigan) {
		this.sigan = sigan;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	@Override
	public String toString() {
		return "BbsDTO [bbsnum=" + bbsnum + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", sigan=" + sigan + ", pageNo=" + pageNo + "]";
	}
	
	
}
