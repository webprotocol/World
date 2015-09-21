package com.webapp.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webapp.command.CityCommand;
import com.webapp.command.Code;
import com.webapp.command.District;
import com.webapp.mapper.CityMapper;
import com.webapp.mapper.CountryMapper;
import com.webapp.model.City;
import com.webapp.validator.CityCommandValidator;

@Controller
@RequestMapping("/city")
public class CityController {
	static Log log = LogFactory.getLog(CityController.class);
	
	@Autowired
	CountryMapper countryMapper;
	@Autowired
	CityMapper cityMapper;
	
	@Autowired
	CityCommandValidator validator;
	
	@RequestMapping("/district/{countrycode:[A-Z]{3}}")
	String getDistricts(@PathVariable String countrycode, Model model) {
		log.info("getDistricts()... countryCode =" + countrycode);
		
		List<String> districts = cityMapper.selectDistricts(countrycode);
		
		model.addAttribute("districts", districts);
		
		return "city/districts";
	}
	
	@RequestMapping
	String listByParameter(String countrycode, Model model) {
		model.addAttribute("countrycode", countrycode);
		
		List<Code> list = countryMapper.selectCodes();
		
		for (Code c : list) {
			log.info("code = " + c.getCode() + " " + 
					 "name = " + c.getName());
		}
		
		return "city/list";
	}
	
	@RequestMapping("/list")
	void listByParameter(HttpServletRequest request, Model model) {
		String countrycode = request.getParameter("countrycode");
		log.info("requestURI = " + request.getRequestURI());
		model.addAttribute("countrycode", countrycode);
	}
	
	
	@ModelAttribute("countryCode")
	List<Code> getCountryCode() {
		List<Code> model = countryMapper.selectCodes();
		log.info("getCountryCode()... size = " + model.size());
		return model;
	}
	
	@ModelAttribute("districts")
	List<String> getDistricts(String countryCode) {
		
		List<String> model = cityMapper.selectDistricts(countryCode);
		log.info("getDistricts()... size = " + model.size());
		return model;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	String registerForm(@ModelAttribute("city") CityCommand command) {
		log.info("registerForm()...");
		return "city/registerForm";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	String register(@ModelAttribute("city") CityCommand command, Errors errors, Model model) {
		log.info("register()... POST");
		
		log.info("name = "+ command.getName());
		/*
		 * CityCommand Validation
		 */
		validator.validate(command, errors);
		
		if (errors.hasFieldErrors("name")) {
			FieldError e = errors.getFieldError("name");
			String[] codes = e.getCodes();
			for (String s : codes)
				log.info("[" + s + "]");
		}
		
		if (errors.hasErrors()) {
			errors.reject("city.register", new Object[] {command.getName()}, "City Global error");	// Global Error
			return "city/registerForm";
		}
		
		/*
		 * DB Register ==> Service를 사용해서 처리
		 */
		
		City city = command.getCity();
		cityMapper.insert(city);
		model.addAttribute("city", city);
		
		return "city/registerSuccess";
	}
	
	
	@RequestMapping("/modify")
	String modify(@ModelAttribute("city") CityCommand command, Errors errors) {
		
		if (errors.hasFieldErrors()) {
			List<FieldError> fieldErrors = errors.getFieldErrors();
			for (FieldError fe : fieldErrors) {
				log.info("field = " + fe.getField());
				log.info("objectName = " + fe.getObjectName());
				log.info("code = " + Arrays.toString(fe.getCodes()));
				log.info("rejectedValue = " + fe.getRejectedValue());
			}
		}
		
		return "city/modify";
	}
	
}




