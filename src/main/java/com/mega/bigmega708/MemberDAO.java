package com.mega.bigmega708;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void pwupdate(MemberDTO dto) {
		my.update("member.pwupdate", dto);
	}
	
	public int idcheck(MemberDTO dto) {
		int result = 0;
		MemberDTO dto2 = null;
		dto2 = my.selectOne("member.idcheck", dto);
		if (dto2 == null) {
			//없으면 1(가능)
			result = 1;
		} else {
			//있으면 0(불가능)
			result = 0;
		}
		return result;
	}
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO dto2 = null;
		dto2 = my.selectOne("member.login", dto);
		return dto2;
	}
	
	public MemberDTO selectone(MemberDTO dto) {
		MemberDTO dto2 = null;
		dto2 = my.selectOne("member.selectone", dto);
		return dto2;
	}
	
	public void insert(MemberDTO dto) {
		my.insert("member.insert", dto);
	}
	
	
	public void update(MemberDTO dto) {
		my.update("member.update", dto);
	}
	
	public MemberDTO pwCheck(MemberDTO dto) {
		MemberDTO dto2 = null;
		dto2 = my.selectOne("member.selectone", dto);
		return dto2;
	}
	
	public void delete(MemberDTO dto) {
		my.delete("member.delete" , dto);
	}
	
}
