package education.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import education.book.model.dto.EduBookDto;
import education.book.model.dto.EduBookListDto;
import education.model.dto.EduOneDto;
import education.model.dto.EduDto;
import education.model.dto.EduListDto;
import education.model.dto.EduRecentDto;

import static common.SemiTemplate.*;

public class EduDao {
	
	// selectTotalCount
	public int selectTotalCount(Connection con, String searchSubject) {
		int result = 0;
		String sql = "SELECT COUNT(*) CNT FROM EDU_LIST ";
		if(searchSubject != null) {
			sql += " WHERE EDU_SUBJECT LIKE '%" + searchSubject + "%'";
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("CNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
	// selectPageList
	public List<EduListDto> selectPageList(Connection con, String searchSubject, int start, int end) {
		List<EduListDto> result = null;
		String sql = "SELECT E2.*"
				+ " FROM (SELECT E1.*, ROWNUM RN FROM (SELECT EDU_ID ,EDU_SUBJECT ,EDU_PARTICIPANT ,"
				+ " TO_CHAR(EDU_BOOK_START, 'YYYY-MM-DD') BS ,TO_CHAR(EDU_BOOK_END, 'YYYY-MM-DD') BE ,TO_CHAR(EDU_START, 'YYYY-MM-DD') ES ,TO_CHAR(EDU_END, 'YYYY-MM-DD') EE ,EDU_WRITE_TIME FROM EDU_LIST ";
		if(searchSubject != null) {
			sql += " WHERE EDU_SUBJECT LIKE '%" + searchSubject + "%' ";
		}
		sql +=  " ORDER BY EDU_ID DESC) E1) E2 WHERE RN BETWEEN ? AND ?";
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
	
	// selectMemList
	public List<EduListDto> selectMemList(Connection con, String mem_id) {
		List<EduListDto> result = null;
		String sql = "SELECT EDU_ID ,EDU_SUBJECT ,EDU_PARTICIPANT ,TO_CHAR(EDU_BOOK_START, 'YYYY-MM-DD') BS ,TO_CHAR(EDU_BOOK_END, 'YYYY-MM-DD') BE ,TO_CHAR(EDU_START, 'YYYY-MM-DD') ES ,TO_CHAR(EDU_END, 'YYYY-MM-DD') EE ,EDU_WRITE_TIME FROM EDU_LIST "
				+ " WHERE EDU_ID = (SELECT EDU_ID FROM EDU_BOOK WHERE EDU_BOOK_ID = ?)";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			
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
	
	
	
	// selectRecent
	public EduRecentDto selectRecent(Connection con) {
		EduRecentDto result = null;
		String sql = "SELECT T1.* FROM (SELECT EDU_SUBJECT FROM EDU_LIST ORDER BY EDU_ID DESC) T1 WHERE ROWNUM = 1";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// ResultSet 처리
			if(rs.next()) {
				result = new EduRecentDto(rs.getString("EDU_SUBJECT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
	// selectOne
	public EduOneDto selectOne(Connection con, Integer eduId) {
		EduOneDto result = null;
		String sql = "SELECT EDU_ID "
				+ " , EDU_SUBJECT "
				+ " , EDU_CONTENT "
				+ " , EDU_ADDRESS "
				+ " , EDU_PARTICIPANT "
				+ " , EDU_DAY "
				+ " , TO_CHAR(EDU_BOOK_START, 'YYYY-MM-DD') BS "
				+ " , TO_CHAR(EDU_BOOK_END, 'YYYY-MM-DD') BE "
				+ " , TO_CHAR(EDU_START, 'YYYY-MM-DD') ES "
				+ " , TO_CHAR(EDU_END, 'YYYY-MM-DD') EE "
				+ " , EDU_WRITE_TIME "
				+ " FROM EDU_LIST WHERE EDU_ID = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, eduId);
			
			rs = pstmt.executeQuery();
			
			// ResultSet 처리
			if(rs.next()) {
				result = new EduOneDto(
						rs.getInt("EDU_ID")
						, rs.getString("EDU_SUBJECT")
						, rs.getString("EDU_CONTENT")
						, rs.getString("EDU_ADDRESS")
						, rs.getString("EDU_PARTICIPANT")
						, rs.getString("EDU_DAY")
						, rs.getString("BS")
						, rs.getString("BE")
						, rs.getString("ES")
						, rs.getString("EE")
						, rs.getString("EDU_WRITE_TIME")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
	// insert
	public int insert(Connection con, EduOneDto dto) {
		int result = 0;
		String sql = "INSERT INTO EDU_LIST "
				+ " VALUES( "
				+ " (SELECT NVL(MAX(EDU_ID), 0) + 1 FROM EDU_LIST)"
				+ " , ?, ?, ?, ?, ?, ?, ?, ?, ? "
				+ " , DEFAULT) ";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			// ? 자리
			pstmt.setString(1, dto.getEduSubject());
			pstmt.setString(2, dto.getEduContent());
			pstmt.setString(3, dto.getEduAddress());
			pstmt.setString(4, dto.getEduParticipant());
			pstmt.setString(5, dto.getEduDay());
			pstmt.setString(6, dto.getEduBookStart());
			pstmt.setString(7, dto.getEduBookEnd());
			pstmt.setString(8, dto.getEduStart());
			pstmt.setString(9, dto.getEduEnd());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}
	
	// update
	public int update(Connection con, EduOneDto dto) {
		int result = 0;
		String sql = "UPDATE EDU_LIST SET EDU_SUBJECT = ?, EDU_CONTENT = ?, EDU_ADDRESS = ?, EDU_PARTICIPANT = ?, "
				+ " EDU_DAY = ?, EDU_BOOK_START = ?, EDU_BOOK_END = ?, EDU_START = ?, EDU_END = ? WHERE EDU_ID = ? ";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEduSubject());
			pstmt.setString(2, dto.getEduContent());
			pstmt.setString(3, dto.getEduAddress());
			pstmt.setString(4, dto.getEduParticipant());
			pstmt.setString(5, dto.getEduDay());
			pstmt.setString(6, dto.getEduBookStart());
			pstmt.setString(7, dto.getEduBookEnd());
			pstmt.setString(8, dto.getEduStart());
			pstmt.setString(9, dto.getEduEnd());
			pstmt.setInt(10, dto.getEduId());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}
	
	// delete
	public int delete(Connection con, Integer eduId) {
		int result = 0;
		String sql = "DELETE FROM EDU_LIST WHERE EDU_ID = ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			// ? 자리
			pstmt.setInt(1, eduId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}
	
	// calendarBookList
	public List<EduBookListDto> calendarBookList(Connection con) {
//		EDU_PART_SCHOOL NOT NULL VARCHAR2(30)
//		EDU_SUBJECT     NOT NULL VARCHAR2(15) 
//		MEMBER_NAME    NOT NULL VARCHAR2(10)  
//		EDU_ADDRESS     NOT NULL VARCHAR2(300) 
//		EDU_START       NOT NULL DATE           
//		EDU_END         NOT NULL DATE    
		List<EduBookListDto> result = null;
		String sql = "SELECT EB.EDU_PART_SCHOOL, EL.EDU_SUBJECT, M.MEMBER_NAME, EL.EDU_ADDRESS, TO_CHAR(EL.EDU_START, 'YYYY-MM-DD') ES, TO_CHAR(EL.EDU_END, 'YYYY-MM-DD') EE FROM EDU_BOOK EB "
				+ " JOIN EDU_LIST EL ON EB.EDU_ID = EL.EDU_ID "
				+ " JOIN MEMBER M ON EB.EDU_BOOK_ID = M.MEMBER_ID ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// ResultSet 처리
			if(rs.next()) {
				result = new ArrayList<EduBookListDto>();
				do {
					EduBookListDto dto = new EduBookListDto(
							rs.getString("EDU_PART_SCHOOL")
							, rs.getString("EDU_SUBJECT")
							, rs.getString("MEMBER_NAME")
							, rs.getString("EDU_ADDRESS")
							, rs.getString("ES")
							, rs.getString("EE")
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
