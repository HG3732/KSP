package weather.model.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import weather.model.dto.WeatherDto;
import weather.model.dto.WeatherPTYDto;
import weather.model.dto.WeatherSKYDto;
import weather.model.dto.WeatherT1HDto;

public class WeatherDao {
	
	public void wether(int x, int y) throws IOException {
		LocalDateTime today = LocalDateTime.now().minusMinutes(30);
		String nowDay = today.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		String nowHour = today.format(DateTimeFormatter.ofPattern("HHmm"));
		
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=wDDeL0LFjIoRuO317GpfgOEgr%2B399wsB0qnv3gaKz6aQxDMz%2BOT9u1%2FMYEye0pW8EN9QZJdlN4cfyE2lI9SPkw%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("XML", "UTF-8")); /*요청자료형식(XML/JSON) Default: XML*/
        urlBuilder.append("&" + URLEncoder.encode("base_date","UTF-8") + "=" + URLEncoder.encode(nowDay, "UTF-8")); /*‘21년 6월 28일 발표*/
        urlBuilder.append("&" + URLEncoder.encode("base_time","UTF-8") + "=" + URLEncoder.encode(nowHour, "UTF-8")); /*06시 발표(정시단위) */
        urlBuilder.append("&" + URLEncoder.encode("nx","UTF-8") + "=" + URLEncoder.encode(String.valueOf(x), "UTF-8")); /*예보지점의 X 좌표값*/
        urlBuilder.append("&" + URLEncoder.encode("ny","UTF-8") + "=" + URLEncoder.encode(String.valueOf(y), "UTF-8")); /*예보지점의 Y 좌표값*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        String result = sb.toString();

	    
        try {
        	DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        	DocumentBuilder db = dbf.newDocumentBuilder();
        	InputSource is = new InputSource(new StringReader(result));
        	Document document = db.parse(is);
        	
        	document.getDocumentElement().normalize();
        	NodeList nList = document.getElementsByTagName("item");
        	for(int temp = 0; temp < nList.getLength(); temp++) {
        		Node nNode = nList.item(temp);
        		if(nNode.getNodeType() == Node.ELEMENT_NODE) {
        			Element eElement = (Element) nNode;
        			
        			String category = eElement.getElementsByTagName("category").item(0).getTextContent();
        			if(category.equals("PTY")) {
        				String fcstDate = eElement.getElementsByTagName("fcstDate").item(0).getTextContent();
        				String fcstTime = eElement.getElementsByTagName("fcstTime").item(0).getTextContent();
        				String value = eElement.getElementsByTagName("fcstValue").item(0).getTextContent();
        				
        				WeatherPTYDto pty = new WeatherPTYDto(fcstDate, fcstTime, Integer.parseInt(value));
        			} else if (category.equals("SKY")) {
        				String fcstDate = eElement.getElementsByTagName("fcstDate").item(0).getTextContent();
        				String fcstTime = eElement.getElementsByTagName("fcstTime").item(0).getTextContent();
        				String value = eElement.getElementsByTagName("fcstValue").item(0).getTextContent();
        				
        				WeatherSKYDto sky = new WeatherSKYDto(fcstDate, fcstTime, Integer.parseInt(value));
        			} else if (category.equals("T1H"))
        				{
        				String fcstDate = eElement.getElementsByTagName("fcstDate").item(0).getTextContent();
        				String fcstTime = eElement.getElementsByTagName("fcstTime").item(0).getTextContent();
        				String value = eElement.getElementsByTagName("fcstValue").item(0).getTextContent();
        				
        				WeatherT1HDto t1h = new WeatherT1HDto(fcstDate, fcstTime, Integer.parseInt(value));
        			} else continue;
        		}
        	}
        } catch (Exception e) {
        	e.printStackTrace();
        }
	 }
}
