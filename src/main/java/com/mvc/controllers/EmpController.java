package com.mvc.controllers;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.mvc.beans.Emp;
import com.mvc.dao.EmpDao;

@Controller
public class EmpController {
	@Autowired
	EmpDao dao;// will inject dao from xml file

	@RequestMapping("/empform")
	public String showform(Model m) {
		m.addAttribute("command", new Emp());
		return "empform";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("emp") Emp emp) {
		dao.save(emp);
		return "redirect:/viewemp";
	}

	@RequestMapping("/viewemp")
	public String viewemp(Model m) {
		
		//prints all the list in the table format 
		List<Emp> list = dao.getEmployees();
		
		//prints the employee which have an designation
		List<Emp> listdrp = dao.getEmployees();
		listdrp.removeIf(item -> item.getDesignation().equals(""));
				
		//prints the employee which have an designation
		List<Emp> unlist = dao.getEmployees();
		List<Emp> emptyFields = new ArrayList<>();
		for (Emp person : unlist) {
			if (person.getDesignation().equals("") || person.getDesignation().equals("")) {
				emptyFields.add(person);
			}
		}
		
		// viewing the lists in the jsp
		m.addAttribute("unlist_dropdown", emptyFields);
		m.addAttribute("list", list);
		m.addAttribute("list_dropdown", listdrp);

		return "viewemp";
	}

	@RequestMapping(value = "/editemp/{id}")
	public String edit(@PathVariable int id, Model m) {
		Emp emp = dao.getEmpById(id);
		m.addAttribute("command", emp);
		return "empeditform";
	}

	@RequestMapping(value = "/editsave", method = RequestMethod.POST)
	public String editsave(@ModelAttribute("emp") Emp emp) {
		dao.update(emp);
		return "redirect:/viewemp";
	}

	@RequestMapping(value = "/deleteemp/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		dao.delete(id);
		return "redirect:/viewemp";
	}

}