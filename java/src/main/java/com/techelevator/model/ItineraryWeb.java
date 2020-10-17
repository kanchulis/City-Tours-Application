package com.techelevator.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ItineraryWeb {

	private Long itineraryId;
	private String name;
	private String startingLocation;
	private List<Long> destinations = new ArrayList<>();
	private LocalDate date;
	private Long userId;
	private String username;
	private Long share;
	
	public Long getItineraryId() {
		return itineraryId;
	}
	public void setItineraryId(Long itineraryId) {
		this.itineraryId = itineraryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartingLocation() {
		return startingLocation;
	}
	public void setStartingLocation(String startingLocation) {
		this.startingLocation = startingLocation;
	}
	public List<Long> getDestinations() {
		return destinations;
	}
	public void setDestinations(List<Long> destinations) {
		this.destinations = destinations;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public Long getShare() {
		return share;
	}
	public void setShare(Long share) {
		this.share = share;
	}
	
}
