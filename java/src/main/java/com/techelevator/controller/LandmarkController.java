package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.techelevator.dao.LandmarkDAO;
import com.techelevator.model.Landmark;

@PreAuthorize("permitAll()")
@CrossOrigin
@RestController
@RequestMapping("/landmarks")
public class LandmarkController {
	
	@Autowired
	LandmarkDAO landmarkDAO;
	
	@RequestMapping(path="/all", method=RequestMethod.GET)
	public List<Landmark> allLandmarks() {
		List<Landmark> output = landmarkDAO.getAllLandmarks();
		return output;
	}
	
	@RequestMapping(path="/{id}", method=RequestMethod.GET)
	public Landmark landmarkDetails(@PathVariable Long id) {
		Landmark landmark = landmarkDAO.getLandmarkById(id);
		return landmark;
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(path="/add", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void addLandmark(@RequestBody Landmark landmark) throws JsonMappingException, JsonProcessingException {
		landmarkDAO.addLandmark(landmark);
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(path="/pending", method=RequestMethod.GET)
	public List<Landmark> pendingLandmarks() {
		return landmarkDAO.getPendingLandmarks();
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(path="/pending/{id}/approve", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.ACCEPTED)
	public void approvePendingLandmark(@PathVariable Long id) {
		landmarkDAO.approveLandmark(id);
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(path="/pending/{id}/deny", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void denyPendingLandmark(@PathVariable Long id) {
		landmarkDAO.deleteLandmark(id);
	}
	
}
