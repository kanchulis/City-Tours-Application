package com.techelevator.model;

import java.util.List;

public class Review {

	private Long id;
	private String title;
	private String description;
	private boolean thumbsUp;
	private boolean thumbsDown;
	private Long landmarkId;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean getThumbsUp() {
		return thumbsUp;
	}
	public void setThumbsUp(boolean thumbsUp) {
		this.thumbsUp = thumbsUp;
	}
	public boolean getThumbsDown() {
		return thumbsDown;
	}
	public void setThumbsDown(boolean thumbsDown) {
		this.thumbsDown = thumbsDown;
	}
	public Long getLandmarkId() {
		return landmarkId;
	}
	public void setLandmarkId(Long landmarkId) {
		this.landmarkId = landmarkId;
	}
	
}
