package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.UserDAO;
import com.techelevator.model.User;

@CrossOrigin
@RestController
public class UserController {
	
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(path="/users", method=RequestMethod.GET)
	public List<User> retrieveAll () {
		return userDAO.findAll();
	}

}
