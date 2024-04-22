package weather.model.dto;

public class WeatherSKYDto {

	private String date;
    private String time;
    private String sky;
    
	public WeatherSKYDto() {
		super();
	}
	
	public WeatherSKYDto(String date, String time, String sky) {
		super();
		this.date = date;
		this.time = time;
		this.sky = sky;
	}
	
	@Override
	public String toString() {
		return "WeatherSKYDto [date=" + date + ", time=" + time + ", sky=" + sky + "]";
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
	public String getSky() {
		return sky;
	}
	public void setSky(String sky) {
		this.sky = sky;
	}
    
    
	
}
