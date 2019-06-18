# weather-project

## Funcation
We need to build a web application to display current weather for 3 Australian cities: Sydney,Melbourne and Wollongong. There should be a dropdown list on web page for city selection,when city is changed corresponding real-time weather information.

## Requirements & Installation

== Requirements ==

1. Java 1.8+ for versions 
2. Maven 3.6.0+ for versions 
3. Eclipse or other IDE

== Installation ==

1.  Used in eclipse import -> Maven -> Exising maven projects ->Root Directory (Local project directory download from the GitHub )
2.  Configuration jdk version of 1.8+
3.  Right-hand button ( WeatherApplication.java ) -> run as application



# show 

1. Application link: http://47.105.195.101:9090/weather
2. CI/CD Jenkins link: http://47.105.195.101:8088    username/password : root/root

![image](https://github.com/wangyidi/weather-project/blob/master/display.png)



# Design Document

## 1. Design idea

Considering the small amount of data and the need of constantly updating the latest weather information, so I stored the data in the memory and updated the data in the memory with a timer to merge the latest state of the data.

## 2. Entity design - WeatherEntity

name|type
--|:--:
city|String
updated_time|String
weather|String
temperature|String
wind|String


## 3. The getWeacherList method

Parameters: `null` </br>
Request mode: `Get` </br>
Returns type: `index.jsp` </br>
Data returned: `full list of cities, weather details of the first message` </br>

Description: Read the configured weather information list in `application.properties`, and obtain the value in the `static_cityMap` with the city name as the key when obtaining the first weather information. If the value is null, get it from API, and store the information in the `static_cityMap`, and return it to the user by ModelAndView. </br>

## 4. The getWeacherByCityName method

Parameters: `{city_name}` </br>
Request method: `Post` </br>
Return type: `json` </br>
Data returned: `weather details queried` </br>

Description:  According to the weather name of the request parameters, first get from `static_cityMap` by key of cityName. If we can't get it, we will get it from API and store the information in the `static_cityMap`.


