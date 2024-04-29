package education.book.model.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import education.book.model.dto.EduBookDto;
import education.book.model.dto.EduBookInfoDto;
import education.book.model.dto.EduBookListDto;
import oracle.sql.DATE;

public class EduBookDao {
	
	// 교육 신청 여부
	public int selectBookCnt(SqlSession session, String mem_id, Integer eduId) {
		System.out.println("EduBookDao selectBookCnt()");
		int result = -1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("eduId", eduId);
		result = session.selectOne("edubook.selectBookCnt", map);
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 신청 현황
	public List<EduBookListDto> selectList(SqlSession session) {
		System.out.println("EduBookDao selectList()");
		List<EduBookListDto> result = null;
		result = session.selectList("edubook.selectList");
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 신청 정보 출력
	public EduBookInfoDto selectBookInfo(SqlSession session, String eduBookSchool, String eduStart) {
		System.out.println("EduBookDao selectBookInfo()");
		EduBookInfoDto result = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("eduBookSchool", eduBookSchool);
		map.put("eduStart", eduStart);
		result = session.selectOne("edubook.selectBookInfo", map);
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 신청
	public int insert(SqlSession session, EduBookDto dto) {
		System.out.println("EduBookDao insert()");
		int result = 0;
		result = session.insert("edubook.insert", dto);
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 취소
	public int delete(SqlSession session, String mem_id, Integer eduId) {
		System.out.println("EduBookDao delete()");
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("eduId", eduId);
		result = session.delete("edubook.delete", map);
		System.out.println("result : " + result);
		return result;
	}
	
}
