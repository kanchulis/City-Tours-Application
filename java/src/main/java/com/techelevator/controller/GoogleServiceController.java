package com.techelevator.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.techelevator.model.GeoLocateIn;
import com.techelevator.services.GoogleMaps;

@RestController
@CrossOrigin
public class GoogleServiceController {
	
	@RequestMapping(path="/getGeo", method=RequestMethod.POST)
	public void test(@RequestBody GeoLocateIn body ) throws JsonMappingException, JsonProcessingException {
//		System.out.println(body.getAddresses());
		
		GoogleMaps maps = new GoogleMaps();
//		maps.geoLocate(body.getAddresses());
		
		
		
	}

}
