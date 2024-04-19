package weather.model.dto;

public class WeatherT1HDto {

	private String date;
    private String time;
    private double t1h;
	public WeatherT1HDto() {
		super();
	}
	
	public WeatherT1HDto(String date, String time, double t1h) {
		super();
		this.date = date;
		this.time = time;
		this.t1h = t1h;
	}
	
	@Override
	public String toString() {
		return "WeatherT1HDto [date=" + date + ", time=" + time + ", t1h=" + t1h + "]";
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
	public double getT1h() {
		return t1h;
	}
	public void setT1h(double t1h) {
		this.t1h = t1h;
	}
    
    
}
