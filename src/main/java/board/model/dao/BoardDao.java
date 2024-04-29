package board.model.dao;

import static common.SemiTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import board.model.dto.BoardDto;
import board.model.dto.BoardFileDto;
import board.model.dto.BoardInsertDto;
import board.model.dto.BoardListDto;
import board.model.dto.BoardReplyDto;
import board.model.dto.BoardReplyListDto;
import board.model.dto.BoardReplyWriteDto;
import board.model.dto.BoardViewDto;
import board.model.dto.FileDto;
import board.model.dto.FileWriteDto;
import oracle.jdbc.proxy.annotation.Pre;

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
		if (searchSubject != null) {
			sql += " WHERE BOARD_TITLE LIKE '%" + searchSubject + "%' ";
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

	// 댓글 개수 count
	public int selectTotalReply(Connection conn, Integer boardNo) {
		int result = 0;
		String sql = "SELECT COUNT(*) CNT FROM BOARD_REPLY WHERE BOARD_NO = ?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	// 페이징 리스트
	public List<BoardListDto> selectPageList(Connection conn, String searchSubject, int start, int end) {
		List<BoardListDto> result = null;
//		String sqlAdmin =
		
		
		String sql = "SELECT * FROM (" + 
	             "    SELECT BOARD_NO, BOARD_TITLE, COUNT(FILE_ID) AS FILE_CNT, BOARD_WRITER, BOARD_WRITE_TIME, HIT, MEMBER_ADMIN," + 
	             "           ROW_NUMBER() OVER (PARTITION BY MEMBER_ADMIN ORDER BY BOARD_NO DESC) AS RN" + 
	             "    FROM BOARD_COMMUNITY LEFT JOIN BOARD_FILE ON B_NO = BOARD_NO ";
		if (searchSubject != null) {
			   sql += "    WHERE BOARD_TITLE LIKE '%" + searchSubject + "%' ";
			}
			   sql += "    GROUP BY BOARD_NO, BOARD_TITLE, BOARD_WRITER, BOARD_WRITE_TIME, HIT, MEMBER_ADMIN " + 
					  "    ORDER BY MEMBER_ADMIN DESC, BOARD_NO DESC) T1 " + 
					  "    WHERE (MEMBER_ADMIN = 1 AND RN <= 3) OR (MEMBER_ADMIN <> 1 AND MEMBER_ADMIN <> 2) AND RN BETWEEN ? AND ?";



		
//		String sql = "SELECT t2.* FROM "
//				+ " (SELECT t1.*, rownum AS rn "
//				+ " FROM (SELECT board_no, board_title, COUNT(file_id) AS FILE_CNT, board_writer, board_write_time, hit, MEMBER_ADMIN "
//				+ "        FROM board_community LEFT JOIN board_file ON b_no = board_no ";
//		if (searchSubject != null) {
//			sql += "        WHERE BOARD_TITLE LIKE '%" + searchSubject + "%' ";
//				}
//			sql += " GROUP BY board_no, board_title, board_writer, board_write_time, hit, MEMBER_ADMIN "
//				+ " ORDER BY 1 DESC) t1) t2 WHERE rn BETWEEN ? AND ?";

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
						rs.getInt("FILE_CNT"), rs.getString("BOARD_WRITER"), rs.getString("BOARD_WRITE_TIME"),
						rs.getInt("HIT"), rs.getInt("MEMBER_ADMIN"));
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

	// selectOne
	public BoardViewDto selectOne(Connection conn, Integer boardNo) {
		BoardViewDto result = null;
		String sql = "SELECT BOARD_NO, BOARD_TITLE, BOARD_WRITER, BOARD_WRITE_TIME, HIT, BOARD_CONTENT, MEMBER_ADMIN FROM board_community WHERE BOARD_NO = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			System.out.println("boardDao boardNo" + boardNo);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new BoardViewDto(rs.getInt("BOARD_NO"), rs.getString("BOARD_TITLE"),
						rs.getString("BOARD_WRITER"), rs.getString("BOARD_WRITE_TIME"), rs.getInt("HIT"),
						rs.getString("BOARD_CONTENT"),rs.getInt("MEMBER_ADMIN"));
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
	public List<FileDto> selectFileList(Connection conn, Integer bNo) {
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
			while (rs.next()) {
				FileDto dto = new FileDto(rs.getInt("B_NO"), rs.getInt("FILE_ID"), rs.getString("FILE_PATH"),
						rs.getString("FILE_ORIGINAL_NAME"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}

	// insertList
	public int insert(Connection conn, BoardInsertDto dto) {
		System.out.println("boardDao Insert() param : " + dto);
		int result = 0;
		String sql = "INSERT ALL";
		sql += " INTO BOARD_COMMUNITY (BOARD_NO, BOARD_WRITER, BOARD_TITLE, BOARD_CONTENT, BOARD_WRITE_TIME, HIT, MEMBER_ADMIN)";
		sql += " VALUES(SEQ_BOARD_ID.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, ?)";
		if (dto.getFileList() != null && dto.getFileList().size() > 0) {
			for (FileWriteDto filedto : dto.getFileList()) {
				sql += " INTO BOARD_FILE (B_NO, FILE_ID, FILE_PATH, FILE_ORIGINAL_NAME)";
				sql += " VALUES(SEQ_BOARD_ID.NEXTVAL, ?, ?, ?)";
			}
		}
		sql += " SELECT * FROM DUAL";
		System.out.println("sql : " + sql);
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			int i = 1;
			pstmt.setString(i++, dto.getBoardWriter());
			pstmt.setString(i++, dto.getBoardTitle());
			pstmt.setString(i++, dto.getBoardContent());
			pstmt.setInt(i++, dto.getMemberAdmin());
			if (dto.getFileList() != null && dto.getFileList().size() > 0) {
				int fileId = 1;
				for (FileWriteDto fileDto : dto.getFileList()) {
					pstmt.setInt(i++, fileId++);
					pstmt.setString(i++, fileDto.getFilePath());
					pstmt.setString(i++, fileDto.getFileOriginalName());
				}
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("boardDado title" + dto.getBoardTitle());
		close(pstmt);
		System.out.println("boardDao insert() return : " + result);
		return result;

	}

	// update
	public int update(Connection conn, BoardDto dto) {
		int result = 0;
		String sql = "UPDATE BOARD_COMMUNITY SET BOARD_TITLE=?, BOARD_CONTENT=? WHERE BOARD_NO=?";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoardTitle());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setInt(3, dto.getBoardNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAO 게시글 업데이트 result : " + result);
		close(pstmt);
		return result;
	}

	// File Update
	/*
	 * public int fileUpdate(Connection conn, BoardFileDto dto) { int result = 0;
	 * String sql =
	 * "UPDATE BOARD_FILE SET FILE_ID=?, FILE_PATH=?, FILE_ORIGINAL_NAME WHERE B_NO"
	 * ; PreparedStatement pstmt = null;
	 * 
	 * try { pstmt = conn.prepareStatement(sql); result = pstmt.executeUpdate(); }
	 * catch (SQLException e) { e.printStackTrace(); } close(pstmt); return result;
	 * }
	 */

	// deleteList
	public int delete(Connection conn, Integer boardNo) {
		int result = 0;
	    String sql = "DELETE FROM BOARD_REPLY WHERE BOARD_NO = ?";
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setInt(1, boardNo);
	        result += pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("dao 댓글 삭제 안됨");
	    }
	    
	    String sql2 = "DELETE FROM BOARD_FILE WHERE B_NO = ?";
	    try (PreparedStatement pstmt2 = conn.prepareStatement(sql2)) {
	        pstmt2.setInt(1, boardNo);
	        result += pstmt2.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("dao 파일 삭제 안됨");
	    }
	    
	    String sql3 = "DELETE FROM BOARD_COMMUNITY WHERE BOARD_NO = ?";
	    try (PreparedStatement pstmt3 = conn.prepareStatement(sql3)) {
	        pstmt3.setInt(1, boardNo);
	        result += pstmt3.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("dao 글 삭제 안됨");
	    }
		return result;
	}

	// -------board reply 댓글
	// select list - board reply : board_id
	public List<BoardReplyListDto> selectBoardReplyList(Connection conn, Integer boardNo) {
		List<BoardReplyListDto> result = null;
		String sql = "		select B_REPLY_ID, BOARD_NO," + "		B_REPLY_WRITER ,B_REPLY_CONTENT,"
				+ "		to_char(b_reply_write_time, 'MM.DD HH24:MI') AS B_REPLY_WRITE_TIME,"
				+ "		B_REPLY_LEVEL, B_REPLY_REF, B_REPLY_STEP" + "		from board_reply"
				+ "		where BOARD_NO = ? order by B_REPLY_ref desc," + "		B_REPLY_step";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			// rs 처리
			result = new ArrayList<BoardReplyListDto>();
			while (rs.next()) {
				BoardReplyListDto dto = new BoardReplyListDto(rs.getInt("B_REPLY_ID"), rs.getString("B_REPLY_WRITER"),
						rs.getString("B_REPLY_CONTENT"), rs.getString("B_REPLY_WRITE_TIME"), rs.getInt("B_REPLY_LEVEL"),
						rs.getInt("B_REPLY_REF"), rs.getInt("B_REPLY_STEP"));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);

		return result;

	}

	// insert - reply 댓글 원본글
	public int insertReply(Connection conn, BoardReplyWriteDto dto) {
		int result = 0;
		String sql = "INSERT INTO BOARD_REPLY VALUES ((SELECT NVL(MAX(B_REPLY_ID),0)+1 FROM BOARD_REPLY),"
				+ " ?, ?, ?, DEFAULT, 1," + " (SELECT NVL(MAX(B_REPLY_ID),0)+1 FROM BOARD_REPLY), 1, DEFAULT)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, dto.getBoardNo());
			pstmt.setString(2, dto.getBReplyWriter());
			pstmt.setString(3, dto.getBReplyContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;

	}

	// insert - reply 댓글 대댓글
	public int insertReReply(Connection conn, BoardReplyWriteDto dto) {
		int result = 0; // 1 정상 : 0 비정상
		String sql = "INSERT INTO BOARD_REPLY VALUES((SELECT NVL(MAX(B_REPLY_ID),0)+1 FROM BOARD_REPLY),"
				+ " ?, ?, ?, DEFAULT," + " (SELECT B_REPLY_LEVEL+1 FROM BOARD_REPLY WHERE B_REPLY_ID = ?) ,"
				+ " (SELECT B_REPLY_REF FROM BOARD_REPLY WHERE B_REPLY_ID = ?) ,"
				+ " (SELECT B_REPLY_STEP+1 FROM BOARD_REPLY WHERE B_REPLY_ID = ?), DEFAULT )";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, dto.getBoardNo());
			pstmt.setString(2, dto.getBReplyWriter());
			pstmt.setString(3, dto.getBReplyContent());
			pstmt.setInt(4, dto.getBReplyId());
			pstmt.setInt(5, dto.getBReplyId());
			pstmt.setInt(6, dto.getBReplyId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}

	// update - reply step
	public int updateReplySetp(Connection conn, Integer bReplyId) {
		int result = -1; // 0~n 정상이므로 비정상인 경우 -1
		String sql = "UPDATE BOARD_REPLY SET B_REPLY_STEP = B_REPLY_STEP+1 WHERE"
				+ " B_REPLY_REF = (SELECT B_REPLY_REF FROM BOARD_REPLY WHERE B_REPLY_ID = ?)" + "	AND"
				+ "	B_REPLY_STEP > (SELECT B_REPLY_STEP FROM BOARD_REPLY WHERE B_REPLY_ID = ?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, bReplyId);
			pstmt.setInt(2, bReplyId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(pstmt);
		return result;

	}
	
	// board reply update
	public int replyUpdate(Connection conn, BoardReplyListDto dto) {
		int result = 0;
		String sql = "UPDATE BOARD_REPLY SET B_REPLY_CONTENT=? WHERE B_REPLY_ID=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBReplyContent());
			pstmt.setInt(2, dto.getBReplyId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("DAO 댓글 업데이트 result : " + result);
		close(pstmt);
		return result;
	}
	
	// board reply delete
	public int replyDelete(Connection conn, Integer bReplyId) {
		int result = 0;
		String sql = "DELETE FROM BOARD_REPLY WHERE B_REPLY_ID=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bReplyId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		close(pstmt);
		return result;
	}
	
	// board delete

	// listContent

}
