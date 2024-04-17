package board.model.dao;

import static common.SemiTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import board.model.dto.BoardInsertDto;
import board.model.dto.BoardListDto;
import board.model.dto.BoardViewDto;
import board.model.dto.FileDto;
import board.model.dto.FileWriteDto;

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
	public int selectTotalCount(Connection conn, String searchSubject) {
		int result = 0;
		String sql = "SELECT COUNT(*) CNT FROM BOARD_COMMUNITY";
		if(searchSubject != null) {
			sql += " WHERE BOARD_TITLE LIKE '%" + searchSubject +"%' "; 
		}
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
	public List<BoardListDto> selectPageList(Connection conn, String searchSubject, int start, int end) {
		List<BoardListDto> result = null;
		String sql = "        select t2.*" + "        from (select t1.*, rownum as rn"
				+ "        from (select board_no, board_title, file_id, board_writer, board_write_time, hit"
				+ "        from board_community left join board_file on b_no = board_no";
//		String sql = "        select t2.*\r\n" + "        from (select t1.*, rownum rn\r\n"
//				+ "        from (select board_no, board_title, file_id, board_writer, board_write_time, hit\r\n"
//				+ "        from board_community left join board_file on b_no = board_no order by 1 desc) t1 ) t2\r\n"
//				+ "        where rn between ?   and ?\r\n";
		if(searchSubject != null) {
			sql += " WHERE BOARD_TITLE LIKE '%" + searchSubject + "%' ";
		}
			sql += " order by 1 desc) t1 ) t2 where rn between ? and ?";
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
	
	// update - hit
	public int updateHit(Connection conn, Integer boardNo) {
		int result = 0;
		String sql = "UPDATE BOARD_COMMUNITY SET HIT=HIT+1 WHERE BOARD_NO=?";
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
	// file
	// select file list
	public List<FileDto> selectFileList(Connection conn, Integer bNo){
		List<FileDto> result = null;
		String sql = "SELECT FILE_ID, B_NO, FILE_PATH, FILE_ORIGINAL_NAME FROM BOARD_FILE WHERE B_NO=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, bNo);
			rs = pstmt.executeQuery();
			// ResultSet 처리
			result = new ArrayList<FileDto>();
			while(rs.next()) {
				FileDto dto = new FileDto(rs.getInt("B_NO"), rs.getInt("FILE_ID"), 
						rs.getString("FILE_PATH"), rs.getString("FILE_ORIGINAL_NAME"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}
	
	
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
		System.out.println("boardDao Insert() param : " + dto);
		int result = 0;
		String sql = "INSERT ALL";
			   sql += " INTO BOARD_COMMUNITY (BOARD_NO, BOARD_WRITER, BOARD_TITLE, BOARD_CONTENT, BOARD_WRITE_TIME, HIT, MEMBER_ADMIN)";
			   sql += " VALUES(SEQ_BOARD_ID.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
			  if(dto.getFileList() != null && dto.getFileList().size()>0) {
				  for(FileWriteDto filedto : dto.getFileList()) {
			   sql += " INTO BOARD_FILE (B_NO, FILE_ID, FILE_PATH, ORIGINAL_FILE_NAME)"; 
			   sql += " VALUES(SEQ_BOARD_ID.NEXTVAL, ?, ?, ?)"; 
				  }
			  }
			   sql += " SELECT * FROM DUAL";
			   System.out.println("sql : "  + sql);
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			int i = 1;
			pstmt.setString(i++, dto.getBoardWriter());
			pstmt.setString(i++, dto.getBoardTitle());
			pstmt.setString(i++, dto.getBoardContent());
			if(dto.getFileList() != null && dto.getFileList().size()>0) {
				int fileId = 1;
				for(FileWriteDto fileDto : dto.getFileList()) {
					pstmt.setInt(i++, fileId);
					pstmt.setString(i++, fileDto.getFilePath());
					pstmt.setString(i++, fileDto.getFileOriginalName());
				}
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		close(pstmt);
		System.out.println("boardDao insert() return : " + result);
		return result;

	}
	// listContent

	// deleteList
}
