package education.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import education.model.dto.EduOneDto;
import education.model.dto.EduFileDto;
import education.model.dto.EduListDto;
import education.model.dto.EduRecentDto;

import static common.SemiTemplate.*;

public class EduDao {
	
	// selectAllList
	public List<EduListDto> selectAllList(SqlSession session){
		System.out.println("EduDao selectAllList()");
		List<EduListDto> result = session.selectList("edu.selectAllList");
		System.out.println("result : " + result);
		return result;
	}
	
	// selectTotalCount
	public int selectTotalCount(Connection con, String searchSubject) {
		System.out.println("EduDao selectTotalCount()");
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
		System.out.println("result : " + result);
		return result;
	}
	
	// selectPageList
	public List<EduListDto> selectPageList(Connection con, String searchSubject, int start, int end) {
		System.out.println("EduDao selectPageList()");
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
		System.out.println("result : " + result);
		return result;
	}
	
	// selectMemList
	public List<EduListDto> selectMemList(SqlSession session, String mem_id) {
		System.out.println("EduDao selectMemList()");
		System.out.println("result : " + session.selectList("edubook.selectMemList", mem_id));
		return session.selectList("edubook.selectMemList", mem_id);
	}
	
	// selectRecent
	public EduRecentDto selectRecent(Connection con) {
		System.out.println("EduDao selectRecent()");
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
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 조회시 파일 읽기
	public List<EduFileDto> selectFileList(SqlSession session, Integer eduId) {
		System.out.println("EduDao selectFileList()");
		List<EduFileDto> result = null;
		result = session.selectList("edu.selectFileList", eduId);
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 조회시 정보 읽기
	public EduOneDto selectOne(SqlSession session, Integer eduId) {
		System.out.println("EduDao selectOne()");
		EduOneDto result = null;
		result = session.selectOne("edu.selectOne", eduId);
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 등록
	public int insert(SqlSession session, EduOneDto dto, List<EduFileDto> eduFileDtoList) {
		System.out.println("EduDao insert()");
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		map.put("filelist", eduFileDtoList);
		result = session.insert("edu.insert", map);
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 수정
	public int update(SqlSession session, EduOneDto dto) {
		System.out.println("EduDao update()");
		int result = 0;
		result = session.update("edu.update", dto);
		System.out.println("result : " + result);
		return result;
	}
	
	// 교육 삭제
	public int delete(SqlSession session, Integer eduId) {
		System.out.println("EduDao delete()");
		int result = 0;
		result = session.delete("edu.delete", eduId);
		System.out.println("result : " + result);
		return result;
	}
}
