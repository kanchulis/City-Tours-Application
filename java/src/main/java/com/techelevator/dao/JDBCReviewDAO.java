package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Review;

@Component
public class JDBCReviewDAO implements ReviewDAO {

	private JdbcTemplate jdbc;

	public JDBCReviewDAO(DataSource datasource) {
		jdbc = new JdbcTemplate(datasource);
	}

	@Override
	public List<Review> landmarkReviews(Long landmarkID) {
		List<Review> reviews = new ArrayList<Review>();
		String sql = "SELECT * FROM review WHERE landmark_id = ? AND title IS NOT NULL";
		SqlRowSet row = jdbc.queryForRowSet(sql, landmarkID);
		while (row.next()) {
			Review review = new Review();
			review.setId(row.getLong("review_id"));
			review.setTitle(row.getString("title"));
			review.setDescription(row.getString("description"));
			review.setThumbsUp(row.getBoolean("thumbs_up"));
			review.setThumbsDown(row.getBoolean("thumbs_down"));
			review.setLandmarkId(row.getLong("landmark_id"));
			reviews.add(review);
		}
		return reviews;
	}

	@Override
	public void addReview(Review review) {
		
		if (review.getTitle().length() == 0 || review.getTitle() == null) {
			String sql = "INSERT INTO review(thumbs_up, thumbs_down, landmark_id) VALUES(?, ?, ?)";
			boolean thumbsUp = false;
			boolean thumbsDown = false;
			
			if (review.getThumbsUp()) {
				thumbsUp = true;
			} else {
				thumbsDown = true;
			}
			
			jdbc.update(sql, thumbsUp, thumbsDown, review.getLandmarkId());
		} else {
		String sql = "INSERT INTO review(title, description, thumbs_up, thumbs_down, landmark_id) VALUES(?, ?, ?, ?, ?)";
		jdbc.update(sql, review.getTitle(), review.getDescription(), review.getThumbsUp(), review.getThumbsDown(),
				review.getLandmarkId());
		}
	}

}
