package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import common.MybatisTemplate;

import static common.SemiTemplate.*;

import member.model.dto.MemberDto;
import member.model.dto.MemberInfoDto;
import member.model.dto.MemberLoginDto;

public class MemberDao {
	
	//select one login
		public MemberInfoDto loginGetInfo(Connection conn, MemberLoginDto dto) {
			MemberInfoDto result = null;
			String sql = "SELECT MEMBER_ID, MEMBER_ADMIN, MEMBER_NAME, MEMBER_EMAIL, MEMBER_ADDRESS FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PWD = ?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(sql);
				// ? 처리
				pstmt.setString(1, dto.getMem_id());
				pstmt.setString(2, dto.getMem_pwd());
				rs = pstmt.executeQuery();
				// result 처리
				if(rs.next()) {
					result = new MemberInfoDto(rs.getString("MEMBER_ID"), rs.getInt("MEMBER_ADMIN")
							, rs.getString("MEMBER_NAME"), rs.getString("MEMBER_EMAIL")
							, rs.getString("MEMBER_ADDRESS"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(rs);
			close(pstmt);
			return result;
		}
		
	//select one login
		public int login(Connection conn, MemberLoginDto dto) {
			int result = 0;
			String sql = "SELECT COUNT(*) C FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PWD = ?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				// ? 처리
				pstmt.setString(1, dto.getMem_id());
				pstmt.setString(2, dto.getMem_pwd());
				rs = pstmt.executeQuery();
				// result 처리
				if(rs.next()) {
					result = rs.getInt("C");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(rs);
			close(pstmt);
			return result;
		}
		
	//select one check id
		public int selectCheckId(Connection conn, String memId) {
			int result = 0;
			String sql = "SELECT COUNT(*) C FROM MEMBER WHERE MEMBER_ID = ?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				// ? 처리
				pstmt.setString(1, memId);
				rs = pstmt.executeQuery();
				// result 처리
				if(rs.next()) {
					result = rs.getInt("C");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(rs);
			close(pstmt);
			return result;
		}
		
		
//		public int selectTotalCount(Connection conn, String category, String keyword) {
//			int result = 0;
//			String sql = " select count(*) C from Member ";
//			if(keyword != null && !keyword.trim().isEmpty()) {
//				sql += " WHERE " + category + " LIKE '%" + keyword + "%'";
//			}
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			try {
//				pstmt = conn.prepareStatement(sql);
//				rs = pstmt.executeQuery();
//				if(rs.next()) {
//					result = rs.getInt("C");
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			close(rs);
//			close(pstmt);
//			return result;
//		}
		
		public Integer selectTotalCount2(SqlSession session, String category, String keyword) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("category", category);
			map.put("keyword", keyword);
			Integer result = 0;
			result = session.selectOne("member.selectTotalCount2", map);
			System.out.println("dao result : " + result);
			return result;
		}
		
		//select list - All + search ver.Mybatis
		public List<MemberDto> selectMemberSearch2(SqlSession session, int currentPageNum, int pageSize, String category, String keyword, String sort, String val) {
			System.out.println(currentPageNum +":" +pageSize);
			int offset = (currentPageNum - 1) * pageSize;
			RowBounds rowBounds = new RowBounds(offset, pageSize);
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("category", category);
			map.put("keyword", keyword);
			map.put("sort", sort);
			map.put("val", val);
			System.out.println("map: "+map);
			List<MemberDto> dtoList = null;
			dtoList = session.selectList("member.selectMemberSearch2", map, rowBounds);
			System.out.println("dao daoList : " + dtoList);
			return dtoList;
		}
		
//		//select list - All + search
//		public List<MemberDto> selectMemberSearch(Connection conn, int start, int end, String category, String keyword, String sort, String val) {
//			List<MemberDto> result = null;
//			String sql = "select m2.* "
//					+ " from (select m1.*, rownum rn "
//					+ "    from (select MEMBER_ID, MEMBER_ADMIN, MEMBER_NAME, MEMBER_PWD, MEMBER_EMAIL, MEMBER_ADDRESS "
//					+ "        from MEMBER ";
//			if(keyword != null && keyword.trim().length() != 0) {
//				sql += " WHERE " + category + " LIKE '%" + keyword + "%'";
//			}
//			sql += " order by member_id) m1) m2 WHERE rn between ? and ?  ";
//			if(sort != null) {
//				sql += " order by " + sort + " " + val;
//			}
//			
//			System.out.println("dao sort : " + sort);
//			System.out.println("dao val : " + val);
//				
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			try {
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, start);
//				pstmt.setInt(2, end);
//				rs = pstmt.executeQuery();
//				if(rs.next()) {
//					result = new ArrayList<MemberDto>();
//					do {
//						MemberDto dto = new MemberDto(rs.getString("MEMBER_ID"), rs.getInt("MEMBER_ADMIN")
//								, rs.getString("MEMBER_NAME"), rs.getString("MEMBER_PWD")
//								, rs.getString("MEMBER_EMAIL") , rs.getString("MEMBER_ADDRESS"), rs.getInt("MEMBER_FAIL_COUNT"));
//						result.add(dto);
//					} while (rs.next());
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			close(rs);
//			close(pstmt);
//			return result;
//		}
		
		//select one
		public MemberDto selectOne(Connection conn, String memId) {
			MemberDto result = null;
			String sql = "SELECT * FROM MEMBER WHERE MEM_ID = ?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				// ? 처리
				pstmt.setString(1, memId);
				rs = pstmt.executeQuery();
				// result 처리
				if(rs.next()) {
					result = new MemberDto(rs.getString("MEMBER_ID"), rs.getInt("MEMBER_ADMIN"), rs.getString("MEMBER_NAME"), rs.getString("MEMBER_PWD"), rs.getString("MEMBER_EMAIL")
							, rs.getString("MEMBER_ADDRESS"), rs.getInt("MEMBER_FAIL_COUNT"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(rs);
			close(pstmt);
			return result;
		}
		//insert
		public int insert(Connection conn, MemberDto dto) {
			int result = 0;
//			MEMBER_ID      NOT NULL VARCHAR2(15)  
//			MEMBER_ADMIN   NOT NULL NUMBER(1)     
//			MEMBER_NAME    NOT NULL VARCHAR2(10)  
//			MEMBER_PWD     NOT NULL VARCHAR2(20)  
//			MEMBER_EMAIL   NOT NULL VARCHAR2(20)  
//			MEMBER_ADDRESS NOT NULL VARCHAR2(100) 
			String sql = "INSERT INTO MEMBER (MEMBER_ID, MEMBER_ADMIN, MEMBER_NAME, MEMBER_PWD, MEMBER_EMAIL, MEMBER_ADDRESS, MEMBER_FAIL_COUNT) VALUES (?, DEFAULT, ?, ?, ?, ?, default)";
			PreparedStatement pstmt = null;

			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getMem_id());
				pstmt.setString(2, dto.getMem_name());
				pstmt.setString(3, dto.getMem_pwd());
				pstmt.setString(4, dto.getMem_email());
				pstmt.setString(5, dto.getMem_address());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(pstmt);
			return result;
		}
		
		//fail_count update
		public int failCntUpdate(SqlSession session, String mem_id) {
			int result = 0;
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("mem_id", mem_id);
			session.update("member.failCntUpdate", paramMap);
			result = (int)paramMap.get("memFailCnt");
			return result;
		}
		
		//fail_count reset
		public void cntResetUpdate(SqlSession session, String mem_id) {
			session.update("member.resetFailCnt", mem_id);
		}
		
		//MypageUpdate
		public int update(Connection conn, String mem_id, String mem_pwd, String mem_email, String mem_address, String currentId) {
			int result = 0;
			String sql = "UPDATE MEMBER SET MEMBER_ID = ?, "
					+ " MEMBER_PWD = ?, MEMBER_EMAIL = ?, MEMBER_ADDRESS = ? "
					+ " WHERE MEMBER_ID = ? "
					;
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem_id);
				pstmt.setString(2, mem_pwd);
				pstmt.setString(3, mem_email);
				pstmt.setString(4, mem_address);
				pstmt.setString(5, currentId);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(pstmt);
			return result;
		}
		//adminUpdate
		public int adminUpdate(Connection conn, String mem_id, int admin) {
			int result = 0;
			String sql = "UPDATE MEMBER SET MEMBER_ADMIN = ? "
					+ " WHERE MEMBER_ID = ? "
					;
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, admin);
				pstmt.setString(2, mem_id);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(pstmt);
			return result;
		}
		
		//deletes
		public int delete(Connection conn, String memId) {
			int result = 0;
			String sql = "DELETE FROM MEMBER WHERE MEMBER_ID = ?";
			PreparedStatement pstmt = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(pstmt);
			return result;
		}

}
