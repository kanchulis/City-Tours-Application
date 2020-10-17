package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

public class Landmark {

	private Long id;
	private List<BusinessHours> businessHours = new ArrayList<BusinessHours>();
	private String address;
	private String name;
	private String description;
	private String venueType;
	private List<Images> images  = new ArrayList<Images>();
	//pendingApproval default should be true until an Admin approves the landmark addition.
	private boolean pendingApproval;
	private Long thumbsUp;
	private Long thumbsDown;
	private Double lat;
	private Double lng;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public List<BusinessHours> getBusinessHours() {
		return businessHours;
	}
	public void setBusinessHours(List<BusinessHours> businessHours) {
		this.businessHours = businessHours;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getVenueType() {
		return venueType;
	}
	public void setVenueType(String venueType) {
		this.venueType = venueType;
	}
	public List<Images> getImages() {
		return images;
	}
	public void setImages(List<Images> images) {
		this.images = images;
	}
	public boolean isPendingApproval() {
		return pendingApproval;
	}
	public void setPendingApproval(boolean pendingApproval) {
		this.pendingApproval = pendingApproval;
	}
	public Long getThumbsUp() {
		return thumbsUp;
	}
	public void setThumbsUp(Long thumbsUp) {
		this.thumbsUp = thumbsUp;
	}
	public Long getThumbsDown() {
		return thumbsDown;
	}
	public void setThumbsDown(Long thumbsDown) {
		this.thumbsDown = thumbsDown;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	
	

}
