package board.model.service;

import static common.SemiTemplate.*;

import java.sql.Connection;
import java.util.List;

import board.model.dao.BoardDao;
import board.model.dto.BoardInsertDto;
import board.model.dto.BoardListDto;

public class BoardService {

	private BoardDao dao = new BoardDao();

	// selecAllList
	public List<BoardListDto> selectAllList() {
		List<BoardListDto> result = null;
		Connection conn = getConnection(true);
		try {
			System.out.println("selectAllList 메서드 호출됨.");
			result = dao.selectAllList(conn);
			System.out.println("dao.selectAllList() 결과: " + result);
		} catch (Exception e) {
			System.out.println("selectAllList 메서드에서 예외 발생: " + e.getMessage());
			// 예외 처리 추가
		} finally {
			close(conn);
		}
		System.out.println("selectAllList 메서드 실행 완료, 결과: " + result);
		return result;
//	}

//	
//	public List<BoardListDto> selectAllList() {
//		List<BoardListDto> result = null;
//		Connection conn = getSemiConnection(true);
//		result = dao.selectAllList(conn);
//		close(conn);
//		return result;

	}

	// selectOne

	// insertList
	public int insert(BoardInsertDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		int sequenceNum = dao.getSequenceNum(conn);
		result = dao.insert(conn, dto, sequenceNum);
		System.out.println(result);
		close(conn);
		return result;
	}
	// listContent

	// deleteList
}