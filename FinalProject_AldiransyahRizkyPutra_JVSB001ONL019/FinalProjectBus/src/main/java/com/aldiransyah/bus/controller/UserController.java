package com.aldiransyah.bus.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.aldiransyah.bus.model.Agency;
import com.aldiransyah.bus.model.ERole;
import com.aldiransyah.bus.model.Role;
import com.aldiransyah.bus.model.User;
import com.aldiransyah.bus.payload.request.AgencyRequest;
import com.aldiransyah.bus.payload.request.SignupCustomRequest;
import com.aldiransyah.bus.payload.request.UserCustomRequest;
import com.aldiransyah.bus.payload.request.UserPasswordRequest;
import com.aldiransyah.bus.payload.response.MessageResponse;
import com.aldiransyah.bus.repository.AgencyRepository;
import com.aldiransyah.bus.repository.RoleRepository;
import com.aldiransyah.bus.repository.UserRepository;
import com.aldiransyah.bus.security.jwt.JwtUtils;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;

@CrossOrigin(origins = "*", maxAge = 3600, methods = { RequestMethod.PUT, RequestMethod.POST, RequestMethod.GET })
@RestController
@RequestMapping("/api/v1/user")
public class UserController {

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	PasswordEncoder encoder;

	@Autowired
	AgencyRepository agencyRepository;

	@Autowired
	JwtUtils jwtUtils;
	
	@GetMapping("/")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasAnyRole('ADMIN','USER')")
	public ResponseEntity<?> getAll() {
		List<UserCustomRequest> dataArrResult = new ArrayList<>();
		for (User dataArr : userRepository.findAll()) {
			dataArrResult.add(new UserCustomRequest(dataArr.getFirstName(), dataArr.getLastName(),
					dataArr.getMobileNumber()));
		}
		return ResponseEntity.ok(new MessageResponse<UserCustomRequest>(true, "Success Retrieving Data", dataArrResult));
	}

	@PostMapping("/signup")
	public ResponseEntity<?> registerUser(@Valid @RequestBody SignupCustomRequest signupCustomRequest) {
		if (userRepository.existsByUsername(signupCustomRequest.getUsername())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken!"));
		}

		if (userRepository.existsByEmail(signupCustomRequest.getEmail())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Error: Email is already in use!"));
		}

		// Create new user's account
		User user = new User(signupCustomRequest.getFirstName(), signupCustomRequest.getLastName(),
				signupCustomRequest.getMobileNumber(), signupCustomRequest.getUsername(),
				signupCustomRequest.getEmail(), encoder.encode(signupCustomRequest.getPassword()));

		Set<String> strRoles = signupCustomRequest.getRole();
		Set<Role> roles = new HashSet<>();

		if (strRoles == null) {
			Role userRole = roleRepository.findByName(ERole.ROLE_USER)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(userRole);
		} else {
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByName(ERole.ROLE_ADMIN)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(adminRole);
					break;
				default:
					Role userRole = roleRepository.findByName(ERole.ROLE_USER)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(userRole);
				}
			});
		}

		user.setRoles(roles);
		userRepository.save(user);

		Agency agency = new Agency(signupCustomRequest.getCode(), signupCustomRequest.getDetails(),
				signupCustomRequest.getName(), user);
		agencyRepository.save(agency);

		return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
	}

	@PutMapping("/{id}")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
	public ResponseEntity<?> updateUser(@PathVariable(value = "id") Long id,
			@Valid @RequestBody UserCustomRequest userCustomRequest) {
		User user = userRepository.findById(id).get();
		if (user == null) {
			return ResponseEntity.notFound().build();
		}
		user.setFirstName(userCustomRequest.getFirstName());
		user.setLastName(userCustomRequest.getLastName());
		user.setMobileNumber(userCustomRequest.getMobileNumber());

		User updatedUser = userRepository.save(user);

		return ResponseEntity.ok(updatedUser);
	}

	@PutMapping("/password/{id}")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
	public ResponseEntity<?> updatePassword(@PathVariable(value = "id") Long id,
			@Valid @RequestBody UserPasswordRequest userPasswordRequest) {
		User user = userRepository.findById(id).get();
		if (user == null) {
			return ResponseEntity.notFound().build();
		}

		user.setPassword(encoder.encode(userPasswordRequest.getPassword()));

		User updatedUser = userRepository.save(user);

		return ResponseEntity.ok(updatedUser);
	}
	
	@GetMapping("/{id}")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> getUserById(@PathVariable(value = "id") Long id) {
		User user = userRepository.findById(id).get();
		if (user == null) {
			return ResponseEntity.notFound().build();
		} else {
			UserCustomRequest dataResult = new UserCustomRequest(user.getFirstName(), user.getLastName(),
					user.getMobileNumber());
			return ResponseEntity.ok(new MessageResponse<UserCustomRequest>(true, "Success Retrieving Data", dataResult));
		}
	}
	
	@DeleteMapping("/{id}")
	@ApiOperation(value = "", authorizations = { @Authorization(value = "apiKey") })
	@PreAuthorize("hasRole('ADMIN')")
	public ResponseEntity<?> deleteUser(@PathVariable(value = "id") Long id) {
		String result = "";
		try {
			userRepository.findById(id).get();

			result = "Success Deleting Data with Id: " + id;
			userRepository.deleteById(id);

			return ResponseEntity.ok(new MessageResponse<User>(true, result));
		} catch (Exception e) {
			result = "Data with Id: " + id + " Not Found";
			return ResponseEntity.ok(new MessageResponse<User>(false, result));
		}
	}
}
