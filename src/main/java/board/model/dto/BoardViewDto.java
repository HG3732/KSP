package board.model.dto;

import java.util.List;

//이름               널?       유형             
//---------------- -------- -------------- 
//BOARD_NO         NOT NULL NUMBER         
//BOARD_WRITER              VARCHAR2(15)   
//BOARD_TITLE      NOT NULL VARCHAR2(20)   
//BOARD_CONTENT    NOT NULL VARCHAR2(4000) 
//BOARD_WRITE_TIME NOT NULL TIMESTAMP(6)   
//HIT              NOT NULL NUMBER         
//MEMBER_ADMIN     NOT NULL NUMBER(1)    
//FILE_ORIGINAL_NAME          VARCHAR2(300)
public class BoardViewDto {
	private Integer boardNo;
	private String boardTitle;
	private String boardWriter;
	private String boardWriteTime;
	private Integer hit;
//	private String fileOriginalName;
	private String boardContent;
	private List<FileDto> filedtolist;
	private Integer memberAdmin;

	@Override
	public String toString() {
		return "BoardViewDto [boardNo=" + boardNo + ",boardTitle=" + boardTitle + ", boardWriter=" + boardWriter + ", boardWriteTime="
				+ boardWriteTime + ", hit=" + hit + ", boardContent=" + boardContent + ",filedtolist=" + filedtolist + ", memberAdmin=" + memberAdmin + "]";

	}

	public BoardViewDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardViewDto(Integer boardNo, String boardTitle, String boardWriter, String boardWriteTime, Integer hit,
			String boardContent, Integer memberAdmin) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.boardWriteTime = boardWriteTime;
		this.hit = hit;
		boardContent = boardContent.replaceAll("\\r?\\n", "<br>");
		boardContent = boardContent.replaceAll(" ", "&nbsp;");
		this.boardContent = boardContent;
		this.memberAdmin = memberAdmin;
	}
	

	public Integer getBoardNo() {
		return boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public String getBoardWriteTime() {
		return boardWriteTime;
	}

	public Integer getHit() {
		return hit;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public List<FileDto> getFiledtolist() {
		return filedtolist;
	}

	public void setFiledtolist(List<FileDto> filedtolist) {
		this.filedtolist = filedtolist;
	}
	
	public Integer getMemberAdmin() {
		return memberAdmin;
	}
}
