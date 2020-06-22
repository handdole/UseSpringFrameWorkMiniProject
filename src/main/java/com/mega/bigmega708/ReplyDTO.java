package com.mega.bigmega708;

public class ReplyDTO {
	
	int replynum, bbsnum;
	String content, writer, sigan;
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public int getBbsnum() {
		return bbsnum;
	}
	public void setBbsnum(int bbsnum) {
		this.bbsnum = bbsnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSigan() {
		return sigan;
	}
	public void setSigan(String sigan) {
		this.sigan = sigan;
	}	
	
	@Override
	public String toString() {
		return "ReplyDTO [replynum=" + replynum + ", bbsnum=" + bbsnum + ", content=" + content + ", writer=" + writer
				+ ", sigan=" + sigan + "]";
	}
	
}
