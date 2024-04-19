package board.model.dto;

public class BoardReplyListDto {
	private Integer bReplyId;
	private String bReplyWriter;
	private String bReplyContent;
	private String bReplyWriteTime;
	private Integer bReplyLevel;
	private Integer bReplyRef;
	private Integer bReplyStep;
	@Override
	public String toString() {
		return "BoardReplyListDto [bReplyId=" + bReplyId + ", bReplyWriter=" + bReplyWriter + ", bReplyContent="
				+ bReplyContent + ", bReplyWriteTime=" + bReplyWriteTime + ", bReplyLevel=" + bReplyLevel
				+ ", bReplyRef=" + bReplyRef + ", bReplyStep=" + bReplyStep + "]";
	}
	public BoardReplyListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardReplyListDto(Integer bReplyId, String bReplyWriter, String bReplyContent, String bReplyWriteTime,
			Integer bReplyLevel, Integer bReplyRef, Integer bReplyStep) {
		super();
		this.bReplyId = bReplyId;
		this.bReplyWriter = bReplyWriter;
		this.bReplyContent = bReplyContent;
		this.bReplyWriteTime = bReplyWriteTime;
		this.bReplyLevel = bReplyLevel;
		this.bReplyRef = bReplyRef;
		this.bReplyStep = bReplyStep;
	}
	public Integer getBReplyId() {
		return bReplyId;
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
	
	
}
