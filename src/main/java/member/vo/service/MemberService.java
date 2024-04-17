package member.vo.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import member.model.dao.MemberDao;
import member.model.dto.MemberDto;
import member.model.dto.MemberInfoDto;
import member.model.dto.MemberLoginDto;
import static common.SemiTemplate.*;

public class MemberService {
	private MemberDao dao = new MemberDao();

	public MemberInfoDto loginGetInfo(MemberLoginDto dto) {
		MemberInfoDto result = null;
		Connection conn = getConnection(true);
		result = dao.loginGetInfo(conn, dto);
		
		close(conn);
		return result;
	}
	
	public int login(MemberLoginDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.login(conn, dto);
		
		close(conn);
		return result;
	}
	
	public int selectCheckId(String memId) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.selectCheckId(conn, memId);
		
		close(conn);
		return result;
	}

	//전체 회원 조회 및 검색
	public Map<String, Object> selectMemberSearch(int pageSize, int pageBlockSize, int currentPageNum, String category, String keyword) {
		Map<String, Object> result = null;
		Connection conn = getConnection(true);
		int start = pageSize*(currentPageNum-1)+1;
		int end = pageSize*currentPageNum;
		int totalCount = dao.selectTotalCount(conn, category, keyword);
		int totalPageCount = (totalCount%pageSize == 0) ? totalCount/pageSize : totalCount/pageSize + 1;
		
		
		int startPageNum = (currentPageNum%pageBlockSize == 0) ? ((currentPageNum/pageBlockSize)-1)*pageBlockSize + 1 : ((currentPageNum/pageBlockSize))*pageBlockSize + 1;
		int endPageNum = (startPageNum+pageBlockSize > totalPageCount) ? totalPageCount : startPageNum + pageBlockSize - 1;
		
		List<MemberDto> dtoList = dao.selectMemberSearch(conn, start, end, category, keyword);
		result = new HashMap<String, Object>();
		result.put("dtoList", dtoList);
		result.put("totalPageCount", totalPageCount);
		result.put("startPageNum", startPageNum);
		result.put("endPageNum", endPageNum);
		result.put("currentPageNum", currentPageNum);
		
		close(conn);
		return result;
	}
	//select one
	public MemberDto selectOne(String memId) {
		MemberDto result = null;
		Connection conn = getConnection(true);
		result = dao.selectOne(conn, memId);
		
		close(conn);
		return result;
	}
	//insert
	public int insert(MemberDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.insert(conn, dto);
		close(conn);
		return result;
	}
	//회원 개인정보 update
	public int mypageUpdate(String mem_id, String mem_pwd, String mem_email, String mem_address, String currentId) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.update(conn, mem_id, mem_pwd, mem_email, mem_address, currentId);
		close(conn);
		return result;
	}
	//회원 등급 update
	public int adminUpdate(String mem_id, int admin) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.adminUpdate(conn, mem_id, admin);
		close(conn);
		return result;
	}
	//deletes
	public int delete(String memId) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.delete(conn, memId);
		close(conn);
		return result;
	}
}
