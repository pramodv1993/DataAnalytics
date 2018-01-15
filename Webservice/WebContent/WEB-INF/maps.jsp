<html>
<head>
<title>Distance finder</title>
<meta type="description" content="Find the distance between two places on the map and the shortest route."/>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript">
	var location1;
	var location2;
	
	var address1;
	
	var latlng;
	var geocoder;
	var map;
	
	var distance;
	
	// finds the coordinates for the two locations and calls the showMap() function
	function initialize()
	{
		geocoder = new google.maps.Geocoder(); // creating a new geocode object
		
		// getting the two address values
		address1 = document.getElementById("address1").value;
		
		
		// finding out the coordinates
		if (geocoder) 8
		{
			geocoder.geocode( { 'address': address1}, function(results, status) 
			{
				if (status == google.maps.GeocoderStatus.OK) 
				{
					//location of first address (latitude + longitude)
					location1 = results[0].geometry.location;showMap();
				}
			});
		}
	}
	
	function showMap()
	{
		latlng = new google.maps.LatLng(location1.lat(),location1.lng());
		
		var mapOptions = 
		{
			zoom:15,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.hybrid};
		map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
		var marker1 = new google.maps.Marker({
			map: map, 
			position: location1,
			title: "First location",
				animation:google.maps.Animation.BOUNCE
		});
		marker.setMap(map);
	
		
	
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);
	</script>
	</head>
	<body bgcolor="#eeeeee">
	<input type="text" id="address1">
	<input type="submit" onclick="initialize()">
	<center > <div id="map_canvas" style="width:100%; height:100%"> </div></center>
	</body>
	</html>
	
		