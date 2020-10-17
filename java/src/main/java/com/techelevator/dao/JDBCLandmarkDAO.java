package com.techelevator.dao;

import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.techelevator.model.BusinessHours;
import com.techelevator.model.Images;
import com.techelevator.model.Landmark;
import com.techelevator.services.GoogleMaps;

@Component
public class JDBCLandmarkDAO implements LandmarkDAO {

	private JdbcTemplate jdbcTemplate;
	@Autowired
	private GoogleMaps googleMaps;

	public JDBCLandmarkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Landmark> getAllLandmarks() {
		List<Landmark> allLandmarks = new ArrayList<>();

		// SQL Select to retrieve all the landmarks that have been approved.
		String sql = "SELECT * FROM landmark JOIN coordinates ON coordinates.landmark_id = landmark.landmark_id WHERE landmark.pending_approval = false";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

		// Populate list of landmarks
		while (results.next()) {
			Landmark landmark = mapRowToLandmark(results);
			allLandmarks.add(landmark);
		}

		// Iterate through each item in the landmark list and for each item
		// go ahead and run a query to extract the business hours.
		for (Landmark landmark : allLandmarks) {
			// mapping hours table of respective landmark to landmark object
			mapRowToHours(landmark);
			// mapping image locations of respective landmark to landmark object
			mapRowToImages(landmark);
			//mapping thumbsUp count to landmark
			mapRowToThumbsUp(landmark);
			//mapping thumbsUp count to landmark
			mapRowToThumbsDown(landmark);
		}

		return allLandmarks;
	}

	public Landmark mapRowToLandmark(SqlRowSet results) {
		Landmark landmark = new Landmark();
		landmark.setId(results.getLong("landmark_id"));
		landmark.setAddress(results.getString("address"));
		landmark.setName(results.getString("name"));
		landmark.setDescription(results.getString("description"));
		landmark.setVenueType(results.getString("venue_type"));
		landmark.setPendingApproval(results.getBoolean("pending_approval"));
		landmark.setLat(results.getDouble("lat"));
		landmark.setLng(results.getDouble("lng"));

		return landmark;
	}

	public Landmark mapRowToImages(Landmark landmark) {
		List<Images> images = new ArrayList<>();

		// Sql select to retrieve the associated images with matching landmarkId
		String imagesSql = "SELECT * from images where landmark_id = ?";
		SqlRowSet imageResults = jdbcTemplate.queryForRowSet(imagesSql, landmark.getId());

		// while loop to parse through the results and create images array for landmark
		// object
		while (imageResults.next()) {
			Images image = new Images();
			image.setLandmarkId(imageResults.getLong("landmark_id"));
			image.setImgUrl(imageResults.getString("image_url"));
			images.add(image);
		}
		// modified landmark object with image location array
		landmark.setImages(images);

		return landmark;
	}

	public Landmark mapRowToHours(Landmark landmark) {
		List<BusinessHours> hoursOfOperation = new ArrayList<>();

		// SQL select to retrieve all the hours for a landmark based on id
		String businessHourSQL = "SELECT * FROM business_hours where landmark_id = ?";
		SqlRowSet businessHourResults = jdbcTemplate.queryForRowSet(businessHourSQL, landmark.getId());

		// while loop to create a business hours array and attach to landmark object
		while (businessHourResults.next()) {
			
			BusinessHours hours = new BusinessHours();
			hours.setLandmarkId(businessHourResults.getLong("landmark_id"));
			hours.setDay(dayOfWeek(businessHourResults.getLong("day_of")));
			if (businessHourResults.getTime("open_time") == null) {
				hours.setOpen_time(null);
			} else {
				hours.setOpen_time(businessHourResults.getTime("open_time").toLocalTime());
			}
			if (businessHourResults.getTime("close_time") == null) {
				hours.setClose_time(null);
			} else {
				hours.setClose_time(businessHourResults.getTime("close_time").toLocalTime());
			}

			hoursOfOperation.add(hours);
		}
		// modifying existing landmark object with business hours array added
		landmark.setBusinessHours(hoursOfOperation);

		return landmark;
	}

	public Landmark getLandmarkById(Long id) {
		
		for (Landmark landmark : getAllLandmarks()) {
			if (landmark.getId() == id) {
				return landmark;
			}
		}
		return null;
	}

	public void addLandmark(Landmark landmark) throws JsonMappingException, JsonProcessingException {
		//SQL statement to insert new landmark object from user -- pending_approval is set to true as it needs to be approved before it will be displayed
		String landmarkInsert = "INSERT INTO landmark (name, description, address, venue_type, pending_approval) VALUES (?, ?, ?, ?, true) RETURNING landmark_id";
		SqlRowSet result = jdbcTemplate.queryForRowSet(landmarkInsert, landmark.getName(), landmark.getDescription(),
				landmark.getAddress(), landmark.getVenueType());
		Long landmarkId = 0L;
		
		//the above sqlrowset returns a landmark_id which will get populated below
		if (result.next()) {
			landmarkId = result.getLong("landmark_id");
		}

		//after the above is successful, there is now a new landmark_id that can be used to attach to the business hours
		String landmarkHoursInsert = "INSERT INTO business_hours (landmark_id, day_of, open_time, close_time) VALUES (?, ?, ?, ?)";
		//for each loop runs through the business hours array to insert 7 business hour rows for each day of the week
		for (BusinessHours hours : landmark.getBusinessHours()) {
			jdbcTemplate.update(landmarkHoursInsert, landmarkId, hours.getDay(), hours.getOpen_time(),
					hours.getClose_time());
		}
		
//		Landmark landmarkLatLng = googleMaps.geoLocate(landmark.getAddress());
//		String insertLatLng = "INSERT INTO coordinates (landmark_id, lat, lng) VALUES (?, ?, ?)";
		
//		jdbcTemplate.update(insertLatLng, landmarkId, landmarkLatLng.getLat(), landmarkLatLng.getLng());
	}

	public List<Landmark> getPendingLandmarks() {
		List<Landmark> allLandmarks = new ArrayList<>();
		
		String sql = "SELECT * FROM landmark WHERE pending_approval = true";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

		// Populate list of landmarks
		while (results.next()) {
			Landmark landmark = mapRowToLandmark(results);
			System.out.println(landmark);
			allLandmarks.add(landmark);
		}


		for (Landmark landmark : allLandmarks) {
			mapRowToHours(landmark);
		}

		return allLandmarks;
	}

	public void approveLandmark(Long id) {
		String approveLandmark = "UPDATE landmark SET pending_approval = false WHERE landmark_id = ?";

		jdbcTemplate.update(approveLandmark, id);
	}

	public void deleteLandmark(Long id) {
		String deleteLandmark = "DELETE FROM landmark WHERE landmark_id = ?";
		String deleteHours = "DELETE FROM business_hours WHERE landmark_id = ?";

		jdbcTemplate.update(deleteLandmark, id);
		jdbcTemplate.update(deleteHours, id);
	}

	public Landmark mapRowToThumbsUp(Landmark landmark) {
		String Sql = "SELECT COUNT(thumbs_up) FROM review WHERE landmark_id = ? AND thumbs_up = true";
		SqlRowSet result = jdbcTemplate.queryForRowSet(Sql, landmark.getId());
		
		if (result.next()) {
			landmark.setThumbsUp(result.getLong("count"));
		}
		return landmark;
	}
	
	public Landmark mapRowToThumbsDown(Landmark landmark) {
		String Sql = "SELECT COUNT(thumbs_down) FROM review WHERE landmark_id = ? AND thumbs_down = true";
		SqlRowSet result = jdbcTemplate.queryForRowSet(Sql, landmark.getId());
		
		if (result.next()) {
			landmark.setThumbsDown(result.getLong("count"));
		}
		return landmark;
	}
	
	public String dayOfWeek(Long day) {
		if (day == 1) {
			return "Monday";
		} else if (day == 2) {
			return "Tuesday";
		} else if (day == 3) {
			return "Wednesday";
		} else if (day == 4) {
			return "Thursday";
		} else if (day == 5) {
			return "Friday";
		} else if (day == 6) {
			return "Saturday";
		} else if (day == 7) {
			return "Sunday";
		}
		return null;
	}
}