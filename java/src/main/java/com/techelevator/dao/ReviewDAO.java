package com.techelevator.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.techelevator.model.Review;

public interface ReviewDAO {

	public List<Review> landmarkReviews(Long landmarkID);
	
	public void addReview(Review review);
	
}
