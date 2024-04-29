package education.book.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.MybatisTemplate;
import education.book.model.dao.EduBookDao;
import education.book.model.dto.EduBookDto;
import education.book.model.dto.EduBookInfoDto;
import education.book.model.dto.EduBookListDto;
import education.model.dao.EduDao;
import education.model.dto.EduListDto;

public class EduBookService {
	private EduBookDao ebd = new EduBookDao();
	private EduDao ed = new EduDao();

	// selectBookCnt
	public int selectBookCnt(String mem_id, Integer eduId) {
		int result = -1;
		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = ebd.selectBookCnt(session, mem_id, eduId);
		return result;
	}
	
	// selectMemList
	public List<EduListDto> selectMemList(String mem_id) {
		List<EduListDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = ed.selectMemList(session, mem_id);
		session.close();
		return result;
	}
	
	// selectList
	public List<EduBookListDto> selectList() {
		List<EduBookListDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = ebd.selectList(session);
		session.close();
		return result;
	}
	
	// 교육 신청 정보 출력
	public EduBookInfoDto selectBookInfo(String eduPartSchool, String eduStart) {
		EduBookInfoDto result = null;
		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = ebd.selectBookInfo(session, eduPartSchool, eduStart);
		session.close();
		return result;
	}

	// 교육 신청
	public int insert(EduBookDto dto) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = ebd.insert(session, dto);
		session.close();
		return result;
	}

	// 교육 취소
	public int delete(String mem_id, Integer eduId) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession(false);
		result = ebd.delete(session, mem_id, eduId);
		session.close();
		return result;
	}

}
