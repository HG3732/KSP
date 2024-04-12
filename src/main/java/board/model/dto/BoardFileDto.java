package board.model.dto;

//이름                 널?       유형             
//------------------ -------- -------------- 
//B_NO               NOT NULL NUMBER         
//FILE_PATH                   VARCHAR2(1000) 
//FILE_ORIGINAL_NAME          VARCHAR2(300)  
//FILE_ID                     NUMBER         

public class BoardFileDto {
	private Integer bNo;
	private String filePath;
	private String fileOriginalName;
	private Integer fileId;
	
	
	
	@Override
	public String toString() {
		return "FileDto [bNo=" + bNo + ", filePath=" + filePath + ", fileOriginalName=" + fileOriginalName + ", fileId="
				+ fileId + "]";
	}

	public BoardFileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardFileDto(Integer bNo, String filePath, String fileOriginalName, Integer fileId) {
		super();
		this.bNo = bNo;
		this.filePath = filePath;
		this.fileOriginalName = fileOriginalName;
		this.fileId = fileId;
	}

	public Integer getbNo() {
		return bNo;
	}

	public void setbNo(Integer bNo) {
		this.bNo = bNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileOriginalName() {
		return fileOriginalName;
	}

	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}

	public Integer getFileId() {
		return fileId;
	}

	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	
	
	
	

}

