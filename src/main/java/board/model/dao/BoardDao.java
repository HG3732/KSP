package board.model.dao;

import static common.SemiTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.model.dto.BoardInsertDto;
import board.model.dto.BoardListDto;
import board.model.dto.BoardViewDto;

//이름               널?       유형             
//---------------- -------- -------------- 
//BOARD_NO         NOT NULL NUMBER         
//BOARD_WRITER              VARCHAR2(15)   
//BOARD_TITLE      NOT NULL VARCHAR2(20)   
//BOARD_CONTENT    NOT NULL VARCHAR2(4000) 
//BOARD_WRITE_TIME NOT NULL TIMESTAMP(6)   
//HIT              NOT NULL NUMBER         
//MEMBER_ADMIN     NOT NULL NUMBER(1)      

public class BoardDao {

	// select total count
	public int selectTotalCount(Connection conn) {
		int result = 0;
		String sql = "SELECT COUNT(*) CNT FROM BOARD_COMMUNITY";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			// ResetSet 처리
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}

	// 페이징 리스트
	public List<BoardListDto> selectPageList(Connection conn, int start, int end) {
		List<BoardListDto> result = null;
		String sql = "        select t2.*\r\n" + "        from (select t1.*, rownum rn\r\n"
				+ "        from (select board_no, board_title, file_id, board_writer, board_write_time, hit\r\n"
				+ "        from board_community left join board_file on b_no = board_no order by 1 desc) t1 ) t2\r\n"
				+ "        where rn between ?   and ?\r\n";
//		String sql = "select t2.*"
//				+" from (select t1.*, rownum rn" 
//			    +" from (select board_no, board_title, file_id, board_writer, board_write_time, hit"
//			    +" from board_community left join board_file on b_no = board_no order by 1 desc) t1 ) t2"
//			    +" where rn between ?   and ?"
//			    ;

//				"SELECT T2.* FROM (SELECT T1.*ROWNUM RN FROM"
//				+ " (SELECT board_no, board_title, file_id, board_writer, board_write_time, hit "
//				+ " from board_community left join board_file on b_no = board_no order by 1 desc)T1)T2 "
//				+ " WHERE RN BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, start); // 한 페이지당 글 수 * (현재페이지-1)+1
			pstmt.setInt(2, end); // 한 페이지당 글 수 * (현재페이지)
			rs = pstmt.executeQuery();
			// ResetSet 처리
			result = new ArrayList<BoardListDto>();
			while (rs.next()) {
				BoardListDto dto = new BoardListDto(rs.getInt("BOARD_NO"), rs.getString("BOARD_TITLE"),
						rs.getInt("FILE_ID"), rs.getString("BOARD_WRITER"), rs.getString("BOARD_WRITE_TIME"),
						rs.getInt("HIT"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;

	}

	// selecAllList
//	public List<BoardListDto> selectAllList(Connection conn) {
//		List<BoardListDto> result = null;
////		String sql = "SELECT BOARD_NO, BOARD_TITLE, BOARD_WRITER, BOARD_WRITE_TIME, HIT FROM BOARD_COMMUNITY";
//		String sql = "select board_no, board_title, file_id, board_writer, board_write_time, hit"
//				+ " from board_community left join board_file on b_no = board_no order by 1 desc";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			// ResultSet 처리
//			result = new ArrayList<>();
//			while (rs.next()) {
//				BoardListDto dto = new BoardListDto(rs.getInt("BOARD_NO"), rs.getString("BOARD_TITLE"),
//						rs.getInt("FILE_ID"), rs.getString("BOARD_WRITER"), rs.getString("BOARD_WRITE_TIME"),
//						rs.getInt("HIT"));
//				result.add(dto);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return result;
//	}

//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			// ResultSet 처리
//			if (rs.next()) {
//				result = new ArrayList<BoardListDto>();
//				do {
//					BoardListDto dto = new BoardListDto(rs.getInt("BOARD_NO"), rs.getString("BOARD_TITLE"),
//							rs.getString("BOARD_WRITER"), rs.getString("BOARD_WRITE_TIME"), rs.getInt("HIT"));
//					result.add(dto);
//				} while (rs.next());
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		close(rs);
//		close(pstmt);
//		return result;
//
//	}

	// selectOne
	public BoardViewDto selectOne(Connection conn, Integer boardNo) {
		BoardViewDto result = null;
		String sql = "SELECT BOARD_NO, BOARD_TITLE, BOARD_WRITER, BOARD_WRITE_TIME, HIT, BOARD_CONTENT FROM board_community WHERE BOARD_NO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			System.out.println(boardNo);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = new BoardViewDto(
						rs.getInt("BOARD_NO"), rs.getString("BOARD_TITLE"), rs.getString("BOARD_WRITER"), rs.getString("BOARD_WRITE_TIME"),
						rs.getInt("HIT"), rs.getString("BOARD_CONTENT")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
		
	}
	
	// selectSearch 검색
//	public List<BoardListDto> selectSearch(Connection conn, )
	
	// select
//	public int getSequenceNum(Connection conn) {
//		int result = 0;
//		String sql = "SELECT SEQ_BOARD_ID.nextval FROM DUAL";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			// ? 처리
//			rs = pstmt.executeQuery();
//			// ResetSet처리
//			if (rs.next()) {
//				result = rs.getInt(1);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		close(rs);
//		close(pstmt);
//		return result;
//	}

	// insertList
	public int insert(Connection conn, BoardInsertDto dto) {
		int result = 0;
		String sql = "INSERT INTO BOARD_COMMUNITY "
				+ " (BOARD_NO, BOARD_WRITER, BOARD_TITLE, BOARD_CONTENT, BOARD_WRITE_TIME, HIT, MEMBER_ADMIN)"
				+ " VALUES(SEQ_BOARD_ID.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setString(1, dto.getBoardWriter());
			pstmt.setString(2, dto.getBoardTitle());
			pstmt.setString(3, dto.getBoardContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(pstmt);
		return result;

	}
	// listContent
	
	// update
	
	// update - hit
	public int updateHit(Connection conn, Integer boardNo) {
		int result = 0;
		String sql = "UPDATE BOARD_COMMUNITY SET HIT = HIT+1 WHERE BOARD_NO=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	// deleteList
}
