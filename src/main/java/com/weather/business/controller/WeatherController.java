package com.weather.business.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.weather.business.res.BaseResource;
import com.weather.business.service.WeatherService;

@Controller
@RequestMapping(value="/")
public class WeatherController extends BaseResource{

	private static final Logger logger = Logger.getLogger(WeatherService.class);
	
	@Autowired
	private WeatherService weatherService;
	/**
	 * Get the fist weather Info return index.jsp 
	 * @return ModelAndView
	 */
	@RequestMapping(value="/weather",method=RequestMethod.GET)
	public ModelAndView  getWeatherList() throws Exception{
		logger.info("getWeacherList ..start");
		Map<String, Object> weatherMap = weatherService.getCityListAndFirstCityDetail();
		
		ModelAndView mode = new ModelAndView();
		mode.addObject("weatherList", weatherMap.get("cityList"));
		mode.addObject("weatherEntity", weatherMap.get("weatherEntity"));
		mode.setViewName("index");
		return mode;
	}
	
	@RequestMapping(value="/weather/{city_name}",method=RequestMethod.POST)
	@ResponseBody
	public Object  getWeatherListByCityName(HttpServletRequest request, HttpServletResponse response,@PathVariable(value="city_name") String cityName) throws Exception{
		try {
			logger.info("getWeatherListByCityName ..start");
			logger.info("city_name: "+ cityName);
			String jsonObject = weatherService.getWeatherByCityName(cityName);
			return jsonObject;
		 } catch (Exception e) {
	         logger.error("getWeatherListByCityName exception:", e);
	         return message(500, e.getMessage(), cityName, request, response, e);
	     }
	}
	
	
}
