package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.ReviewDAO;
import com.techelevator.model.Review;

@CrossOrigin
@RestController
@RequestMapping("/reviews")
public class ReviewController {
	
	@Autowired
	ReviewDAO reviewDAO;
	
	@RequestMapping(path="/{id}", method=RequestMethod.GET)
	public List<Review> landmarkReviews(@PathVariable Long id) {
		List<Review> output = reviewDAO.landmarkReviews(id);
		return output;
	}
	
	@RequestMapping(path="/add", method=RequestMethod.POST)
	public void addLandmarkReview(@RequestBody Review review) {
		reviewDAO.addReview(review);
	}

}
