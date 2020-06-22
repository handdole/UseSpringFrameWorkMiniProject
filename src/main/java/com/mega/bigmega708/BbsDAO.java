package com.mega.bigmega708;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class BbsDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(BbsDTO dto) {
		System.out.println(dto);
		my.insert("bbs.insert", dto);
	}
	
	public List<BbsDTO> list() {
		List<BbsDTO> list= my.selectList("bbs.list");
		return list;
	}
	public BbsDTO select(BbsDTO dto) {
		BbsDTO select= my.selectOne("bbs.select",dto);
		return select;
	}
	public void update(BbsDTO dto) {
		my.update("bbs.update", dto);
	}
	public void delete(BbsDTO dto) {
		my.delete("bbs.delete",dto);
	}
}
