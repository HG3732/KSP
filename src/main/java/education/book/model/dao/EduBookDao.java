package education.book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import education.book.model.dto.EduBookDto;
import education.book.model.dto.EduBookListDto;
import education.model.dto.EduOneDto;

import static common.SemiTemplate.*;

public class EduBookDao {
	// selectList
	public List<EduBookListDto> selectList(Connection con) {
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
	
	// insert
	public int insert(Connection con, EduBookDto dto) {
//		EDU_BOOK_ID     NOT NULL VARCHAR2(15) 
//		EDU_ID          NOT NULL NUMBER       
//		EDU_BOOK_PHONE  NOT NULL VARCHAR2(11) 
//		EDU_PART_LEVEL  NOT NULL VARCHAR2(10) 
//		EDU_PART_NAME   NOT NULL VARCHAR2(10) 
//		EDU_PART_SCHOOL NOT NULL VARCHAR2(30)
		int result = 0;
		String sql = "INSERT INTO EDU_BOOK VALUES (?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			// ? 자리
			pstmt.setString(1, dto.getEduBookId());
			pstmt.setInt(2, dto.getEduId());
			pstmt.setString(3, dto.getEduBookPhone());
			pstmt.setString(4, dto.getEduPartLevel());
			pstmt.setString(5, dto.getEduPartLevel());
			pstmt.setString(6, dto.getEduPartName());
			pstmt.setString(7, dto.getEduPartSchool());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}
	
	// delete
	public int delete(Connection con, String mem_id) {
		int result = 0;
		String sql = "DELETE FROM EDU_BOOK WHERE EDU_BOOK_ID = ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			// ? 자리
			pstmt.setString(1, mem_id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}
	
//	// update
//	public int update(Connection con, EduOneDto dto) {
//		int result = 0;
//		String sql = "UPDATE EDU_LIST SET EDU_SUBJECT = ?, EDU_CONTENT = ?, EDU_ADDRESS = ?, EDU_PARTICIPANT = ?, "
//				+ " EDU_DAY = ?, EDU_BOOK_START = ?, EDU_BOOK_END = ?, EDU_START = ?, EDU_END = ? WHERE EDU_ID = ? ";
//		PreparedStatement pstmt = null;
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, dto.getEduSubject());
//			pstmt.setString(2, dto.getEduContent());
//			pstmt.setString(3, dto.getEduAddress());
//			pstmt.setString(4, dto.getEduParticipant());
//			pstmt.setString(5, dto.getEduDay());
//			pstmt.setString(6, dto.getEduBookStart());
//			pstmt.setString(7, dto.getEduBookEnd());
//			pstmt.setString(8, dto.getEduStart());
//			pstmt.setString(9, dto.getEduEnd());
//			pstmt.setInt(10, dto.getEduId());
//			
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		close(pstmt);
//		return result;
//	}
//	
}
