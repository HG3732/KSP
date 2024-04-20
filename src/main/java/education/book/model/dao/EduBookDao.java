package education.book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import education.book.model.dto.EduBookDto;
import education.book.model.dto.EduBookListDto;

import static common.SemiTemplate.*;

public class EduBookDao {
	
	// selectBookCnt
	public int selectBookCnt(SqlSession session, String mem_id, Integer eduId) {
		System.out.println("EduBookDao selectBookCnt()");
		int result = -1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("eduId", eduId);
		result = session.selectOne("edubook.selectBookCnt", map);
		System.out.println("result : " + result);
		return result;
	}
	
	// selectList
	public List<EduBookListDto> selectList(SqlSession session) {
		System.out.println("EduBookDao selectList()");
		List<EduBookListDto> result = null;
		result = session.selectList("edubook.selectList");
		System.out.println("result : " + result);
		return result;
	}
	
	// insert
	public int insert(SqlSession session, EduBookDto dto) {
		System.out.println("EduBookDao insert()");
		int result = 0;
		result = session.insert("edubook.insert", dto);
		System.out.println("result : " + result);
		return result;
	}
	
	// delete
	public int delete(Connection con, String mem_id) {
		System.out.println("EduBookDao delete()");
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
		System.out.println("result : " + result);
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
