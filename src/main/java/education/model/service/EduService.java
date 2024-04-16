package education.model.service;

import static common.SemiTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import education.model.dao.EduDao;
import education.model.dto.EduBookDto;
import education.model.dto.EduBookListDto;
import education.model.dto.EduDetailDto;
import education.model.dto.EduDto;
import education.model.dto.EduListDto;
import education.model.dto.EduRecentDto;

public class EduService {
	private EduDao dao = new EduDao();
		// selectPageList
		public Map<String, Object> selectPageList(String searchSubject, int pageSize, int pageBlockSize, int currentPageNum) {
			Map<String, Object> result = null;
			Connection con = getConnection(true);
			
			int start = pageSize * (currentPageNum - 1) + 1;
			int end = pageSize * currentPageNum;
			
			// 총글수 289
			int totalCount = dao.selectTotalCount(con, searchSubject);
			
			int totalPageCount = (totalCount % pageSize == 0) ? totalCount / pageSize : totalCount / pageSize + 1;
			
			int startPageNum = (currentPageNum % pageBlockSize == 0) ? ((currentPageNum / pageBlockSize) - 1) * pageBlockSize + 1 : (currentPageNum / pageBlockSize) * pageBlockSize + 1;
			int endPageNum = (startPageNum + pageBlockSize > totalPageCount) ? totalPageCount : startPageNum + pageBlockSize - 1;
			
			List<EduListDto> dtolist = dao.selectPageList(con, searchSubject, start, end);
			close(con);
			
			result = new HashMap<String, Object>();
			result.put("dtolist", dtolist);
			result.put("totalPageCount", totalPageCount);
			result.put("startPageNum", startPageNum);
			result.put("endPageNum", endPageNum);
			result.put("currentPageNum", currentPageNum);
			
			return result;
		}
		
		// selectRecent
		public EduRecentDto selectRecent() {
			EduRecentDto result = null;
			Connection con = getConnection(true);
			result = dao.selectRecent(con);
			close(con);
			return result;
		}
		
		// selectDetail
		public EduDetailDto selectDetail(Integer eduId) {
			EduDetailDto result = null;
			Connection con = getConnection(true);
			result = dao.selectDetail(con, eduId);
			close(con);
			return result;
		}
		
		// insertDetail
		public int insertDetail(EduDetailDto dto) {
			int result = 0;
			Connection con = getConnection(true);
			result = dao.insertDetail(con, dto);
			close(con);
			return result;
		}
		
		// insertEduBook
		public int insertEduBook(EduBookDto dto) {
			int result = 0;
			Connection con = getConnection(true);
			result = dao.insertEduBook(con, dto);
			close(con);
			return result;
		}
		
		// updateDetail
		public int updateDetail(EduDetailDto dto) {
			int result = 0;
			Connection con = getConnection(true);
			result = dao.update(con, dto);
			close(con);
			return result;
		}
		// delete
		public int delete(int eduId) {
			int result = 0;
			Connection con = getConnection(true);
			result = dao.delete(con, eduId);
			close(con);
			return result;
		}
		
		
		
		// calendarBookList
		public List<EduBookListDto> calendarBookList() {
			List<EduBookListDto> result = null;
			Connection con = getConnection(true);
			result = dao.calendarBookList(con);
			close(con);
			return result;
		}
}
