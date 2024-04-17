package board.model.dto;

public class FileWriteDto {
	private String filePath;
	private String fileOriginalName;

	@Override
	public String toString() {
		return "FileWriteDto [filePath=" + filePath + ", fileOriginalName=" + fileOriginalName + "]";
	}

	public FileWriteDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FileWriteDto(String filePath, String fileOriginalName) {
		super();
		this.filePath = filePath;
		this.fileOriginalName = fileOriginalName;
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

}
