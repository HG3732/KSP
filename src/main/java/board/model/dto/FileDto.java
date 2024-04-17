package board.model.dto;
//이름                 널?       유형             
//------------------ -------- -------------- 
//FILE_ID                     NUMBER      
//B_NO               NOT NULL NUMBER         
//FILE_PATH                   VARCHAR2(1000) 
//FILE_ORIGINAL_NAME          VARCHAR2(300)  
public class FileDto {
	private Integer fileId;
	private Integer bNo;
	private String filePath;
	private String fileOriginalName;
	@Override
	public String toString() {
		return "FileDto [fileId=" + fileId + ", bNo=" + bNo + ", filePath=" + filePath + ", fileOriginalName="
				+ fileOriginalName + "]";
	}
	public FileDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FileDto(Integer fileId, Integer bNo, String filePath, String fileOriginalName) {
		super();
		this.fileId = fileId;
		this.bNo = bNo;
		this.filePath = filePath;
		this.fileOriginalName = fileOriginalName;
	}
	public Integer getFileId() {
		return fileId;
	}
	public Integer getbNo() {
		return bNo;
	}
	public String getFilePath() {
		return filePath;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	
	
}
