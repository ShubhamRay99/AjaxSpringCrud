package com.inputController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.User;
import com.repository.UserRepository;

@Controller
public class BasicInputController {

	@Autowired
	UserRepository userRepository;
	
	
	
	@RequestMapping(value= {"/","NameAndEmail"})
	public String takeInput(Model model) {
		
		List<User> allUsers =  (List<User>) userRepository.findAll();
		model.addAttribute("allUsers",allUsers);
		
		return "NameAndEmail";
	}
	
	@PostMapping("/addToTable")
	public String addToTable(@ModelAttribute User user) {
		
		userRepository.save(user);
		
		return "redirect:/NameAndEmail";
	}

	@PostMapping("/deleteThroughAjax/{id}")
	public ResponseEntity<?> addToTableThroughAjax(@PathVariable("id") Integer id){
		
		userRepository.deleteById(id); 			//after deleting the information, show all the remaining records 
		List<User> allUsers =  (List<User>) userRepository.findAll();
		
		return ResponseEntity.status(200).body(allUsers);
	}

}
