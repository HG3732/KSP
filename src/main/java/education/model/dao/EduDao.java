package education.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import education.model.dto.EduBookDto;
import education.model.dto.EduListDto;

import static common.SemiTemplate.*;

public class EduDao {
	// selectTotalCount
	public int selectTotalCount(Connection con, String searchSubject) {
		int result = 0;
		String sql = "select count(*) cnt from edu_list ";
		if(searchSubject != null) {
			sql += " where edu_subject like '%" + searchSubject + "%'";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
//	EDU_ID          NOT NULL NUMBER        
//	EDU_SUBJECT     NOT NULL VARCHAR2(100) 
//	EDU_PARTICIPANT NOT NULL VARCHAR2(30)  
//	EDU_BOOK_START  NOT NULL DATE          
//	EDU_BOOK_END    NOT NULL DATE          
//	EDU_START       NOT NULL DATE          
//	EDU_END         NOT NULL DATE          
//	EDU_WRITE_TIME  NOT NULL TIMESTAMP(6)
	// selectPageList
	public List<EduListDto> selectPageList(Connection con, String searchSubject, int start, int end) {
		List<EduListDto> result = null;
		String sql = "SELECT E2.*"
				+ " FROM (SELECT E1.*, ROWNUM RN FROM (SELECT EDU_ID ,EDU_SUBJECT ,EDU_PARTICIPANT ,"
				+ " TO_CHAR(EDU_BOOK_START, 'YYYY-MM-DD') BS ,TO_CHAR(EDU_BOOK_END, 'YYYY-MM-DD') BE ,TO_CHAR(EDU_START, 'YYYY-MM-DD') ES ,TO_CHAR(EDU_END, 'YYYY-MM-DD') EE ,EDU_WRITE_TIME FROM EDU_LIST ";
		if(searchSubject != null) {
			sql += " WHERE EDU_SUBJECT LIKE '%" + searchSubject + "%' ";
		}
		sql +=  " ORDER BY EDU_ID) E1) E2 WHERE RN BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			// ResultSet 처리
			if(rs.next()) {
				result = new ArrayList<EduListDto>();
				do {
					EduListDto dto = new EduListDto(
							rs.getInt("EDU_ID")
							, rs.getString("EDU_SUBJECT")
							, rs.getString("EDU_PARTICIPANT")
							, rs.getString("BS")
							, rs.getString("BE")
							, rs.getString("ES")
							, rs.getString("EE")
							, rs.getString("EDU_WRITE_TIME")
							);
					result.add(dto);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
	// eduListInsert
//	public int eduListInsert(Connection con, EduListDto dto) {
//		int result = -1;
////		INSERT INTO MEMBER VALUES('kh'||K, 'pwd'||K, 'kh'||K||'@a.com', '이름'||K);
//		String sql = "INSERT INTO EDU_LIST (EDU_ID, EDU_SUBJECT, EDU_PARTICIPANT, EDU_MONTH, EDU_BOOK_PERIOD, EDU_PERIOD, EDU_WRITE_TIME) "
//								+ "VALUES((SELECT NVL(MAX(EDU_ID), 0) + 1), ?, ?, ?, ?, ?, DEFAULT)";
//		PreparedStatement pstmt = null;
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			// ? 자리
//			pstmt.setString(1, dto.getEduSubject());
//			pstmt.setString(2, dto.getEduParticipant());
//			pstmt.setString(3, dto.getEduMonth());
//			pstmt.setString(4, dto.getEduBookPeriod());
//			pstmt.setString(5, dto.getEduPeriod());
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		close(pstmt);
//		return result;
//	}
	
//	// update
//	public int update(Connection con, EduListDto dto) {
//		int result = -1;
//		String sql = "UPDATE EDU_LIST SET EDU_SUBJECT = ?, EDU_BOOK_PERIOD = ?, EDU_PERIOD = ?"; // TODO
//		PreparedStatement pstmt = null;
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, dto.getEduSubject());
//			pstmt.setString(2, dto.getEduBookPeriod());
//			pstmt.setString(3, dto.getEduPeriod());
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		close(pstmt);
//		return result;
//	}
//	// delete
//	public int delete(Connection con, int eduId) {
//		int result = 0;
//		String sql = "DELETE FROM EDU_LIST WHERE EDU_ID = ?";
//		PreparedStatement pstmt = null;
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			// ? 자리
//			pstmt.setInt(1, eduId);
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		close(pstmt);
//		return result;
//	}
	
	// calendarBookList
	public List<EduBookDto> calendarBookList(Connection con) {
		List<EduBookDto> result = null;
		String sql = "select el.edu_subject, m.member_name, eb.edu_part_school from edu_book eb "
				+ " join edu_list el on eb.edu_id = el.edu_id "
				+ " join member m on eb.edu_book_id = m.member_id ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// ResultSet 처리
			if(rs.next()) {
				result = new ArrayList<EduBookDto>();
				do {
					EduBookDto dto = new EduBookDto(
							rs.getString("edu_subject")
							, rs.getString("member_name")
							, rs.getString("edu_part_school")
							);
					result.add(dto);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
}
