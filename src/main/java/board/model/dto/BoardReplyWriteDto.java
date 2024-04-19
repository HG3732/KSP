package board.model.dto;

public class BoardReplyWriteDto {
	private Integer bReplyId;
	private Integer boardNo;
	private String bReplyWriter;
	private String bReplyContent;
	private String bReplyWriteTime;
	@Override
	public String toString() {
		return "BoardReplyWriteDto [bReplyId=" + bReplyId + ", boardNo=" + boardNo + ", bReplyWriter=" + bReplyWriter
				+ ", bReplyContent=" + bReplyContent + ", bReplyWriteTime=" + bReplyWriteTime + "]";
	}
	
	
	public BoardReplyWriteDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public BoardReplyWriteDto(Integer bReplyId, Integer boardNo, String bReplyWriter, String bReplyContent,
			String bReplyWriteTime) {
		super();
		this.bReplyId = bReplyId;
		this.boardNo = boardNo;
		this.bReplyWriter = bReplyWriter;
		this.bReplyContent = bReplyContent;
		this.bReplyWriteTime = bReplyWriteTime;
	}


	public Integer getBReplyId() {
		return bReplyId;
	}


	public void setBReplyId(Integer bReplyId) {
		this.bReplyId = bReplyId;
	}


	public Integer getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(Integer bReplyNo) {
		this.boardNo = bReplyNo;
	}


	public String getBReplyWriter() {
		return bReplyWriter;
	}


	public void setBReplyWriter(String bReplyWriter) {
		this.bReplyWriter = bReplyWriter;
	}


	public String getBReplyContent() {
		return bReplyContent;
	}


	public void setBReplyContent(String bReplyContent) {
		this.bReplyContent = bReplyContent;
	}


	public String getBReplyWriteTime() {
		return bReplyWriteTime;
	}


	public void setBReplyWriteTime(String bReplyWriteTime) {
		this.bReplyWriteTime = bReplyWriteTime;
	}
	
	
}
