<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Global Weather</title>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<%
		String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();

		List<String> cityList = (List<String>)request.getAttribute("weatherList");
	%>
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/bootstrap.css">
	<script type="text/javascript" src="<%=path %>/static/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/static/js/bootstrap.js"></script>




</head>
<body>
    <h1>Global Weather</h1>


	<div class="dropdown">
		<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
			Dropdown
			<span class="caret"></span>
		</button>
		<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
			<li><a href="#">Action</a></li>
			<li><a href="#">Another action</a></li>
			<li><a href="#">Something else here</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="#">Separated link</a></li>
		</ul>
	</div>
    
    <div>
    
	    <select id ="selector">
	    	<c:forEach  var="cityName" items="<%=cityList %>">
			    <option >${cityName}</li>
			</c:forEach>
	    </select>
    </div>
	    
    <table id="weather_table" class="datalist">
    	<tr>
    		<td>City</td>
    		<td id="city">${weatherEntity.city}</td>
   		</tr>
    	<tr>
    		<td>Updated time</td>
    		<td id="update_time">${weatherEntity.updated_time}</td>
   		</tr>
    	<tr>
    		<td>Weather</td>
    		<td id="weather">${weatherEntity.weather}</td>
    	</tr>
 	    <tr>
 	    	<td>Temperature</td>
 	    	<td id="temperature">${weatherEntity.temperature} °C</td>
 	    </tr>
    	<tr>
 	    	<td>Wind</td>
 	    	<td id="wind">${weatherEntity.wind} km/h</td>
 	    </tr>
    </table>

<script type="text/javascript">

var path = '<%=path%>'


$("#selector").change(function(){
	
	var url = path +'/weather/'+this.value;
	$.post(url,{},function(result,status){
		var json = eval('(' + result + ')');
		
		$("#update_time").html(json.updated_time);
		$("#weather").html(json.weather);
		$("#temperature").html(json.temperature+' °C');
		$("#wind").html(json.wind+' km/h');
		$("#city").html(json.city);
		
     })
     .error(function(error) { 
    	 alert('code:'+ error.responseJSON.code+
    			', more_info:'+ error.responseJSON.more_info
    				+', msg:'+ error.responseJSON.msg)
     })

});

</script>
</body>
</html>
