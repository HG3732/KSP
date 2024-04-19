package board.model.dto;
//이름                 널?       유형             
//------------------ -------- -------------- 
//B_REPLY_ID         NOT NULL NUMBER         
//B_REPLY_NO         NOT NULL NUMBER         
//B_REPLY_WRITER     NOT NULL VARCHAR2(15)   
//B_REPLY_CONTENT    NOT NULL VARCHAR2(2000) 
//B_REPLY_WRITE_TIME NOT NULL TIMESTAMP(6)   
//B_REPLY_LEVEL      NOT NULL NUMBER(2)      
//B_REPLY_REF                 NUMBER         
//B_REPLY_STEP       NOT NULL NUMBER(3)      
//MEMBER_ADMIN       NOT NULL NUMBER(1)   
public class BoardReplyDto {
	private Integer bReplyId;
	private Integer boardNo;
	private String bReplyWriter;
	private String bReplyContent;
	private String bReplyWriteTime;
	private Integer bReplyLevel;
	private Integer bReplyRef;
	private Integer bReplyStep;
	private Integer memberAdmin;
	@Override
	public String toString() {
		return "BoardReplyDto [bReplyId=" + bReplyId + ", boardNo=" + boardNo + ", bReplyWriter=" + bReplyWriter
				+ ", bReplyContent=" + bReplyContent + ", bReplyWriteTime=" + bReplyWriteTime + ", bReplyLevel="
				+ bReplyLevel + ", bReplyRef=" + bReplyRef + ", bReplyStep=" + bReplyStep + ", memberAdmin="
				+ memberAdmin + "]";
	}
	public BoardReplyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardReplyDto(Integer bReplyId, Integer boardNo, String bReplyWriter, String bReplyContent,
			String bReplyWriteTime, Integer bReplyLevel, Integer bReplyRef, Integer bReplyStep, Integer memberAdmin) {
		super();
		this.bReplyId = bReplyId;
		this.boardNo = boardNo;
		this.bReplyWriter = bReplyWriter;
		this.bReplyContent = bReplyContent;
		this.bReplyWriteTime = bReplyWriteTime;
		this.bReplyLevel = bReplyLevel;
		this.bReplyRef = bReplyRef;
		this.bReplyStep = bReplyStep;
		this.memberAdmin = memberAdmin;
	}
	public Integer getBReplyId() {
		return bReplyId;
	}
	public Integer getBoardNo() {
		return boardNo;
	}
	public String getBReplyWriter() {
		return bReplyWriter;
	}
	public String getBReplyContent() {
		return bReplyContent;
	}
	public String getBReplyWriteTime() {
		return bReplyWriteTime;
	}
	public Integer getBReplyLevel() {
		return bReplyLevel;
	}
	public Integer getBReplyRef() {
		return bReplyRef;
	}
	public Integer getBReplyStep() {
		return bReplyStep;
	}
	public Integer getMemberAdmin() {
		return memberAdmin;
	}
	
	
}
