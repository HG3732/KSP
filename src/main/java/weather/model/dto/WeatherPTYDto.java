package weather.model.dto;

public class WeatherPTYDto {
	private String date;
	private String time;
	private double pty;

	public WeatherPTYDto() {
		super();
	}

	public WeatherPTYDto(String date, String time, double pty) {
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

	public double getPty() {
		return pty;
	}

	public void setPty(double pty) {
		this.pty = pty;
	}

}
