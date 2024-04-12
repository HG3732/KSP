package board.model.dto;

//이름               널?       유형             
//---------------- -------- -------------- 
//BOARD_NO         NOT NULL NUMBER         
//BOARD_WRITER              VARCHAR2(15)   
//BOARD_TITLE      NOT NULL VARCHAR2(20)   
//BOARD_CONTENT    NOT NULL VARCHAR2(4000) 
//BOARD_WRITE_TIME NOT NULL TIMESTAMP(6)   
//HIT              NOT NULL NUMBER         
//MEMBER_ADMIN     NOT NULL NUMBER(1)      
      
public class BoardDto {
	private Integer boardNo;
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	private String boardWriteTime;
	private Integer hit;
	private Integer memberAdmin;
	
	
	@Override
	public String toString() {
		return "BoardDto [boardNo=" + boardNo + ", boardWriter=" + boardWriter + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardWriteTime=" + boardWriteTime + ", hit=" + hit + ", memberAdmin=" + memberAdmin
				+ "]";
	}


	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public BoardDto(Integer boardNo, String boardWriter, String boardTitle, String boardContent, String boardWriteTime,
			Integer hit, Integer memberAdmin) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriteTime = boardWriteTime;
		this.hit = hit;
		this.memberAdmin = memberAdmin;
	}


	public Integer getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
	}


	public String getBoardWriter() {
		return boardWriter;
	}


	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public String getBoardWriteTime() {
		return boardWriteTime;
	}


	public void setBoardWriteTime(String boardWriteTime) {
		this.boardWriteTime = boardWriteTime;
	}


	public Integer getHit() {
		return hit;
	}


	public void setHit(Integer hit) {
		this.hit = hit;
	}


	public Integer getMemberAdmin() {
		return memberAdmin;
	}


	public void setMemberAdinm(Integer memberAdmin) {
		this.memberAdmin = memberAdmin;
	}
	
	
	
	
	
}

