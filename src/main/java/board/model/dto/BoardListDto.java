package board.model.dto;

//이름               널?       유형             
//---------------- -------- -------------- 
//BOARD_NO         NOT NULL NUMBER         
//BOARD_TITLE      NOT NULL VARCHAR2(20)
//FILE_ID		   			NUMBER
//BOARD_WRITER              VARCHAR2(15)   
//BOARD_WRITE_TIME NOT NULL TIMESTAMP(6)   
//HIT              NOT NULL NUMBER         
//MEMBER_ADMIN     NOT NULL NUMBER(1)      

//BOARD_NO, BOARD_TITLE, FILE_ID, BOARD_WRITER, BOARD_WRITE_TIME, HIT - SELECT ALL

public class BoardListDto {
	
	private Integer boardNo;
	private String boardTitle;
	private Integer fileId;
	private String boardWriter;
	private String boardWriteTime;
	private Integer hit;
	private Integer memberAdmin;
	@Override
	public String toString() {
		return "BoardListDto [boardNo=" + boardNo + ", boardTitle=" + boardTitle +  ", fileId=" + fileId + ", boardWriter=" + boardWriter
				+ ", boardWriteTime=" + boardWriteTime + ", hit=" + hit + ", memberAdmin=" + memberAdmin +"]";
	}
	public BoardListDto(Integer boardNo, String boardTitle, Integer fileId,  String boardWriter, String boardWriteTime, Integer hit, Integer memberAdmin) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.fileId = fileId;
		this.boardWriter = boardWriter;
		this.boardWriteTime = boardWriteTime;
		this.hit = hit;
		this.memberAdmin = memberAdmin;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public Integer getFileId() {
		return fileId;
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
	public Integer getMemberAdmin() {
		return memberAdmin;
	}
}