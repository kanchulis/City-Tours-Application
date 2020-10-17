package com.techelevator.dao;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

import com.techelevator.model.Itinerary;
import com.techelevator.model.ItineraryWeb;
import com.techelevator.model.Landmark;

@Component
public class JDBCItineraryDAO implements ItineraryDAO {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private LandmarkDAO landmarkDAO;
	
	public JDBCItineraryDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public void createItinerary(ItineraryWeb itinerary) {
		String name = itinerary.getName();
		String startingLocation = itinerary.getStartingLocation();
		LocalDate date = itinerary.getDate();
		
		//works if the logged in user creates a itinerary, otherwise need a new way to retrieve the logged in user's name to get the id
		Long currentUserId = (long) userDAO.findIdByUsername(itinerary.getUsername());
		
		String sql = "INSERT INTO itinerary(name, starting_point, date_of, user_id)"
				+ " VALUES (?, ?, ?, ?) RETURNING itinerary_id";
		SqlRowSet itinerarySql = jdbcTemplate.queryForRowSet(sql, name, startingLocation, date, currentUserId);
		System.out.println("*******HERE****" + name + startingLocation +  date +  currentUserId);
		Long itineraryId = 0L;
		
		if (itinerarySql.next()) {
			itineraryId = itinerarySql.getLong("itinerary_id");
		}
		System.out.println(itineraryId);
		String destinationInsert = "INSERT INTO destinations(itinerary_id, landmark_id) VALUES (? ,?)";
		
		for (Long landmark : itinerary.getDestinations()) {
			jdbcTemplate.update(destinationInsert, itineraryId, landmark);
			System.out.println(landmark);
		}
		System.out.println("***NOW HERE***");
		
	}

	@Override
	public List<Itinerary> retrieveAllUserItinerary(String username) {
		String sql = "SELECT * FROM itinerary WHERE user_id = ?";
		Long currentUserId = (long) userDAO.findIdByUsername(username);
		SqlRowSet result = jdbcTemplate.queryForRowSet(sql, currentUserId);
		List<Itinerary> output = new ArrayList<>();
		
		while(result.next()) {
			Itinerary itinerary = mapRowToItinerary(result);
			output.add(itinerary);
		}
		return output;
	}
	
	@Override
	public List<Itinerary> retrieveSharedItineraries(String username) {
		List<Itinerary> output = new ArrayList<>();
		List<Long> itineraryIds = new ArrayList<>();
		Long currentUserId = (long) userDAO.findIdByUsername(username);
		
		String sql = "SELECT * FROM accessibility WHERE user_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sql, currentUserId);
		
		while (result.next() ) {
			Long id = result.getLong("itinerary_id");
			itineraryIds.add(id);
		}
		
		for (Long id : itineraryIds) {
			output.add(retrieveItinerary(id));
		}
		
		return output;
	}
	
	@Override
	public Itinerary retrieveItinerary(Long id) {
		String sql = "SELECT * FROM itinerary WHERE itinerary_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sql, id);
		Itinerary itinerary = new Itinerary();
		
		if (result.next()) {
			itinerary = mapRowToItinerary(result);
		}
		
		return itinerary;
	}
	
	@Override
	public List<Landmark> retrieveItineraryLandmarks(Long itineraryID){
		List<Landmark> output = new ArrayList<Landmark>();
		String sql = "SELECT landmark_id FROM destinations WHERE itinerary_id = ?";
		
		SqlRowSet row = jdbcTemplate.queryForRowSet(sql, itineraryID);
		
		List<Long> landmarkIDs = new ArrayList<Long>();
		
		while(row.next()) {
			Long landmarkId = row.getLong("landmark_id");
			landmarkIDs.add(landmarkId);
		}
		
		for (Long landmarkId : landmarkIDs) {
			output.add(landmarkDAO.getLandmarkById(landmarkId));
		}
		return output;
	}

	@Override
	public void updateItinerary(Itinerary itinerary, Long id, String username) throws IOException {
		System.out.println(username);
		System.out.println(userDAO.getUserById(retrieveItinerary(itinerary.getItineraryId()).getUserId()).getUsername());
		if (userDAO.getUserById(retrieveItinerary(itinerary.getItineraryId()).getUserId()).getUsername().equals(username)) {
		String sql = "UPDATE itinerary SET name = ?, starting_point = ?, share = ?, date_of = ? WHERE itinerary_id = ?";
		String name = itinerary.getName();
		String startingLocation = itinerary.getStartingLocation();
		LocalDate date = itinerary.getDate();
		
		jdbcTemplate.update(sql, name, startingLocation, itinerary.getShare(), date, id);
		
//		jdbcTemplate.update("DELETE FROM destinations WHERE itinerary_id = ?", id);
		
//		for (Landmark landmark : itinerary.getDestinations()) {
//			String destination = "INSERT INTO destinations(itinerary_id, landmark_id) VALUES (?, ?)";
//			jdbcTemplate.update(destination, id, landmark);
//		}
		} else {
			throw new IOException();
		}
	}

	@Override
	public void removeLandmark(Long itineraryID, Long landmarkID) throws IOException {
		String sql = "DELETE FROM destinations WHERE itinerary_id = ? AND landmark_id = ?";
		jdbcTemplate.update(sql, itineraryID, landmarkID);
	}
	
	@Override
	public void addLandmark(Long itineraryID, Long landmarkID) throws IOException {
		String sql = "INSERT INTO destinations (itinerary_id, landmark_id) VALUES (?, ?)";
		jdbcTemplate.update(sql, itineraryID, landmarkID);
	}

	@Override
	public void deleteItinerary(Long itineraryId, String username) throws IOException {
		if (retrieveItinerary(itineraryId).getUserId() == (userDAO.findIdByUsername(username))) {
		
			String sql = "DELETE FROM itinerary WHERE itinerary_id = ?";
			String destinationDelete = "DELETE FROM destinations WHERE itinerary_id=?";
			String sqlAccessibility = "DELETE FROM accessibility WHERE itinerary_id = ?";
			
			jdbcTemplate.update(destinationDelete, itineraryId);
			jdbcTemplate.update(sqlAccessibility, itineraryId);
			jdbcTemplate.update(sql, itineraryId);
		} else {
			throw new IOException();
		}
	}

	@Override
	public void shareItinerary(Long itineraryId, String shareUsername, String username) throws IOException {
		if (retrieveItinerary(itineraryId).getUserId() == (userDAO.findIdByUsername(username))) {
			String sql = "INSERT INTO accessibility(itinerary_id, user_id)";
			
			jdbcTemplate.update(sql, itineraryId, userDAO.findIdByUsername(shareUsername));
		} else {
			throw new IOException();
		}
	}
	
	@Override
	public void removeSharedItinerary(Long itineraryId, String shareUsername, String username) throws IOException {
		if (retrieveItinerary(itineraryId).getUserId() == (userDAO.findIdByUsername(username))) {
			String sql = "DELETE FROM accessibility WHERE itinerary_id = ? AND user_id = ?";
			
			jdbcTemplate.update(sql, itineraryId, userDAO.findIdByUsername(shareUsername));
		} else {
			throw new IOException();
		}
	}
	
	@Override
	public Itinerary getPublicItinerary(Long itineraryId) throws IOException {
		if (retrieveItinerary(itineraryId).getShare() == 2) {
			return retrieveItinerary(itineraryId);
		} else {
			return null;
		}
	}
	
	public Itinerary mapRowToItinerary(SqlRowSet result) {
		Itinerary itinerary = new Itinerary();
		itinerary.setItineraryId(result.getLong("itinerary_id"));
		itinerary.setName(result.getString("name"));
		itinerary.setStartingLocation(result.getString("starting_point"));
		itinerary.setDestinations(retrieveItineraryLandmarks(result.getLong("itinerary_id")));
		itinerary.setDate(result.getDate("date_of").toLocalDate());
		itinerary.setUserId(result.getLong("user_id"));
		itinerary.setShare(result.getLong("share"));
		
		return itinerary;
	}

	@Override
	public List<Landmark> getLandmarkAddresses(@PathVariable Long id) {
		List<Landmark> LandmarkAddresses = new ArrayList<>();
		
		String sqlStr = "SELECT * FROM itinerary "
				+ "JOIN destinations ON destinations.itinerary_id = itinerary.itinerary_id "
				+ "JOIN landmark ON landmark.landmark_id = destinations.landmark_id "
				+ "WHERE itinerary.itinerary_id = ?";
		
		SqlRowSet output = jdbcTemplate.queryForRowSet(sqlStr, id);
		
		while(output.next()) {
			Landmark landmark = new Landmark();
			landmark.setId(output.getLong("landmark_id"));
			landmark.setAddress(output.getString("address"));
			LandmarkAddresses.add(landmark);
		}
		
		return LandmarkAddresses;
	}
}
