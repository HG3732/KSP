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

// BOARD_TITLE BOARD_CONTENT FILE_ID 
public class BoardInsertDto {
	private String boardWriter;
	private String boardTitle;
	private String boardContent;
	@Override
	public String toString() {
		return "BoardInsertDto [boardWriter=" + boardWriter + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + "]";
	}
	
	public BoardInsertDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardInsertDto(String boardWriter, String boardTitle, String boardContent) {
		super();
		this.boardWriter = boardWriter;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
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
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
	
}


