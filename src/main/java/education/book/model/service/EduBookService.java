package education.book.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.MybatisTemplate;
import education.book.model.dao.EduBookDao;
import education.book.model.dto.EduBookDto;
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

	// 교육 신청
	public int insert(EduBookDto dto) {
		int result = 0;
		int resultUpdate = 0;
		SqlSession session = MybatisTemplate.getSqlSession(false);
		resultUpdate = ebd.plusNum(session, dto);
		if(resultUpdate > -1) {
			result = ebd.insert(session, dto);
		}
		if(resultUpdate > -1 && result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

	// delete
	public int delete(String mem_id, Integer eduId) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = ebd.delete(session, mem_id, eduId);
		session.close();
		return result;
	}

}
