package com.techelevator.services;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.Landmark;

@Component
public class GoogleMaps {
	
	public Landmark geoLocate(String placeToGeoLocate) throws JsonMappingException, JsonProcessingException {
		
		String url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + placeToGeoLocate + "CA&key=AIzaSyBwqiIiWzxhNGZ2fxocq1tCHMz17TWEMRA";
		
		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, new HttpEntity<String>(new HttpHeaders()), String.class);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		JsonNode jsonNode = objectMapper.readTree(response.getBody());
		
//		System.out.println(response.getBody());
		System.out.println(jsonNode.path("results/geometry/location/lat"));
		
		String latitude = jsonNode.path("results").path("geometry").path("location").path("lat").asText();
		String longitude =  jsonNode.path("results").path("geometry").path("location").path("lng").asText();
		
		Landmark landmark = new Landmark();
		
		landmark.setLat(Double.parseDouble(latitude));
		landmark.setLng(Double.parseDouble(longitude));
				
		return null;
	}

}
