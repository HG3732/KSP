package main.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import weather.model.dto.WeatherDto;
import weather.model.service.WeatherService;

@WebServlet("/location/weather.ajax")
public class LocationWeatherController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	WeatherService ws = new WeatherService();
	Gson gson = new Gson();
       
    public LocationWeatherController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String locStr = request.getParameter("loc");
		int loc = Integer.parseInt(locStr);
		int x = 0;
		int y = 0;
		
		
		switch (loc) {
		case 1:
			x = 55;
			y = 127;
			break;
		case 2:
			x = 55;
			y = 125;
			break;
		case 3:
			x = 92;
			y = 132;
			break;
		case 4:
			x = 73;
			y = 134;
			break;
		case 5:
			x = 91;
			y = 106;
			break;
		case 6:
			x = 67;
			y = 101;
			break;
		case 7:
			x = 89;
			y = 91;
			break;
		case 8:
			x = 58;
			y = 74;
			break;
		case 9:
			x = 98;
			y = 76;
			break;
		case 10:
			x = 54;
			y = 36;
			break;
		}
		ws.update(x, y);
		List<WeatherDto> result = ws.selectAllList();
		response.getWriter().append(gson.toJson(result));
		
	}

}
