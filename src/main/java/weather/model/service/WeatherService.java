package weather.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.MybatisTemplate;
import weather.model.dao.WeatherDao;
import weather.model.dto.WeatherDto;
import weather.model.dto.WeatherPTYDto;
import weather.model.dto.WeatherSKYDto;
import weather.model.dto.WeatherT1HDto;

public class WeatherService {
	private WeatherDao wd = new WeatherDao();
	private WeatherT1HDto wt = new WeatherT1HDto();
	private WeatherSKYDto ws = new WeatherSKYDto();
	private WeatherPTYDto wp = new WeatherPTYDto();
	
	//날씨 종합 정보 표시
	public List<WeatherDto> selectAllList() {
		List<WeatherDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession(true);
		result = wd.selectAllList(session);
		return result;
	}
	
	//좌표에 따른 최신 날씨정보 서버에 업데이트
	public void update(int x, int y) {
		SqlSession session = MybatisTemplate.getSqlSession(true);
		try {
			wd.update(session, x, y);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
