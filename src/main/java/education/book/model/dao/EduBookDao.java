package education.book.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import education.book.model.dto.EduBookDto;
import education.book.model.dto.EduBookListDto;

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
	
	// selectList
	public List<EduBookListDto> selectList(SqlSession session) {
		System.out.println("EduBookDao selectList()");
		List<EduBookListDto> result = null;
		result = session.selectList("edubook.selectList");
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
	// 교육 신청 시 신청 인원 갱신
	public int plusNum(SqlSession session, EduBookDto dto) {
		System.out.println("EduBookDao plusNum()");
		int result = -1;
		result = session.update("edubook.plusNum", dto);
		System.out.println("result : " + result);
		return result;
	}
	
	// delete
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
