package com.mega.bigmega708;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyDAO {
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(ReplyDTO dto) {
		System.out.println(dto);
		my.insert("reply.insert2", dto);
	}
	
	public List<ReplyDTO> list(ReplyDTO dto) {
		List<ReplyDTO> list= my.selectList("reply.reply_list",dto);
		return list;
	}
	public void delete(ReplyDTO dto) {
		my.delete("reply.delete",dto);
	}
	public void all_delete(ReplyDTO dto) {
		my.delete("reply.all_delete",dto);
	}
}
