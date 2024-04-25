package board.model.service;

import static common.SemiTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import board.model.dao.BoardDao;
import board.model.dto.BoardDto;
import board.model.dto.BoardInsertDto;
import board.model.dto.BoardListDto;
import board.model.dto.BoardReplyDto;
import board.model.dto.BoardReplyListDto;
import board.model.dto.BoardReplyWriteDto;
import board.model.dto.BoardViewDto;
import board.model.dto.FileDto;

public class BoardService {

	private BoardDao dao = new BoardDao();

	// select totalCount - conn을 재연결 하지 않도록 함.
//	public int selectTotalCount() {
//		int result = 0;
//		Connection conn = getSemiConnection(true);
//		result = dao.selectTotalCount(conn);
//		close(conn);
//		return result;
//	}

	// selectAllList
	public Map<String, Object> selectPageList(String searchSubject, int pageSize, int pageBlockSize,
			int currentPageNum) {
		Map<String, Object> result = null;

		Connection conn = getConnection(true);
		System.out.println("currentPageNum : " + currentPageNum);
		int start = pageSize * (currentPageNum - 1) + 1;
		int end = pageSize * currentPageNum;
//		"SELECT T2.* FROM (SELECT T1.*ROWNUM RN FROM"
//		" (SELECT board_no, board_title, file_id, board_writer, board_write_time, hit "
//		" from board_community left join board_file on b_no = board_no order by 1 desc)T1)T2 "
//		" WHERE RN BETWEEN ? AND ?";

//		총 글 개수 
//		select count(*) cnt from board;
		int totalCount = dao.selectTotalCount(conn, searchSubject);
		System.out.println("totalCount : " + totalCount);
//		전체 페이지수 = ceil(총글개수/한페이지당글수) = (총글개수%한페이지당글수== 0)?(총글개수/한페이지당글수):(총글개수/한페이지당글수+1)
		int totalPageCount = (totalCount % pageSize == 0) ? totalCount / pageSize : totalCount / pageSize + 1;

//		시작페이지 startPageNum = (현재페이지%페이지수 == 0) ? ((현재페이지/페이지수)-1)*페이지수 + 1  :((현재페이지/페이지수))*페이지수 + 1
//		끝페이지 endPageNum =  (endPageNum > 전체페이지수) ? 전체페이지수 : startPageNum+페이지수 - 1;
		int startPageNum = (currentPageNum % pageBlockSize == 0)
				? ((currentPageNum / pageBlockSize) - 1) * pageBlockSize + 1
				: ((currentPageNum / pageBlockSize)) * pageBlockSize + 1;
		int endPageNum = (startPageNum + pageBlockSize > totalPageCount) ? totalPageCount
				: startPageNum + pageBlockSize - 1;

		List<BoardListDto> dtolist = dao.selectPageList(conn, searchSubject, start, end);
		close(conn);

		result = new HashMap<String, Object>();
		result.put("dtolist", dtolist);
		result.put("totalPageCount", totalPageCount);
		result.put("startPageNum", startPageNum);
		result.put("endPageNum", endPageNum);
		result.put("currentPageNum", currentPageNum);
//		System.out.println("selectPageList() : "+result);
//		System.out.println("여긴 서비스"+dtolist);
		return result;
	}

//	// selecAllList
//	public List<BoardListDto> selectAllList() {
//		List<BoardListDto> result = null;
//		Connection conn = getConnection(true);
//		try {
//			System.out.println("selectAllList 메서드 호출됨.");
//			result = dao.selectAllList(conn);
//			System.out.println("dao.selectAllList() 결과: " + result);
//		} catch (Exception e) {
//			System.out.println("selectAllList 메서드에서 예외 발생: " + e.getMessage());
//			// 예외 처리 추가
//		} finally {
//			close(conn);
//		}
//		System.out.println("selectAllList 메서드 실행 완료, 결과: " + result);
//		return result;
////	}

//	
//	public List<BoardListDto> selectAllList() {
//		List<BoardListDto> result = null;
//		Connection conn = getSemiConnection(true);
//		result = dao.selectAllList(conn);
//		close(conn);
//		return result;

//	}

	// selectOne
	public BoardViewDto selectOne(Integer boardNo) {
		BoardViewDto result = null;
		Connection conn = getConnection(true);
		result = dao.selectOne(conn, boardNo);
		if (result != null) {
			dao.updateHit(conn, boardNo);
		}
		List<FileDto> filelist = dao.selectFileList(conn, boardNo);
		result.setFiledtolist(filelist);
//		result = selectOne(boardNo);

		close(conn);
		return result;
	}
	
	public int selectReplyCount(Integer boardNo) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.selectTotalReply(conn, boardNo);
		
		close(conn);
		return result;
	}

	// insertList
	public int insert(BoardInsertDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
//		int sequenceNum = dao.getSequenceNum(conn);
		result = dao.insert(conn, dto);
		System.out.println(result);
		close(conn);
		return result;
	}
	
	// update 
	public int update(BoardDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.update(conn, dto);
		System.out.println("서비스 게시글 업데이트 result : " + result);
		close(conn);
		return result;
	}
	
	// delete 
	public int delete(Integer boardNo) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.delete(conn, boardNo);
		close(conn);
		return result;
	}

	// -------board reply 댓글
	// select reply list - list
	public List<BoardReplyListDto> selectReplyList() {
		List<BoardReplyListDto> result = null;
		Connection conn = getConnection(true);
		result = dao.selectBoardReplyList(conn, null);
		close(conn);
		return result;
	}

	// select list -
	public List<BoardReplyListDto> selectBoardReplyList(Integer boardNo) {
		List<BoardReplyListDto> result = null;
		Connection conn = getConnection(true);
		result = dao.selectBoardReplyList(conn, boardNo);
		close(conn);
		return result;
	}

	// insert - boardreply
	public int insertReply(BoardReplyWriteDto dto) {
		int result = 0;
		int resultupdate = 0;
		Connection conn = getConnection(true);
		autocommit(conn, false);
		if (dto.getBReplyId() != 0) {
			resultupdate = dao.updateReplySetp(conn, dto.getBReplyId());
			if (resultupdate > -1) {
				result = dao.insertReReply(conn, dto);
			}
		} else {
			result = dao.insertReply(conn, dto);
		}
		if (resultupdate > -1 && result > 0) {
			commit(conn);

		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// board update
	public int replyUpdate(BoardReplyDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.replyUpdate(conn, dto);
		System.out.println("서비스 댓글 업데이트 result : " + result);
		close(conn);
		return result;
	}

	// listContent

	// deleteList
}
