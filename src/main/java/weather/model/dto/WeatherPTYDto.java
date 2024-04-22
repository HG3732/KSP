package weather.model.dto;

public class WeatherPTYDto {
	private String date;
	private String time;
	private String pty;

	public WeatherPTYDto() {
		super();
	}

	public WeatherPTYDto(String date, String time, String pty) {
		super();
		this.date = date;
		this.time = time;
		this.pty = pty;
	}

	@Override
	public String toString() {
		return "WeatherPTYDto [date=" + date + ", time=" + time + ", pty=" + pty + "]";
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getPty() {
		return pty;
	}

	public void setPty(String pty) {
		this.pty = pty;
	}

}
