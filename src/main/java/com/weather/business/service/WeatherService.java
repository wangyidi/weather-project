package com.weather.business.service;

import java.util.Map;

public interface WeatherService {

	public Map<String,Object> getCityListAndFirstCityDetail() throws Exception;
	
	public String getWeacherByCityName(String cityName) throws Exception;
}
