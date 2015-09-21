package com.webapp.command;

import com.webapp.model.City;
import com.webapp.model.Country;

public class CityCommand {
	String  name;
	String  countryCode;
	String  district;
	int  population;
	
	public City getCity() {
		City city = new City();
		city.setName(name);
		
		Country c = new Country();
		c.setCode(countryCode);
		
		city.setCountry(c);
		city.setDistrict(district);
		city.setPopulation(population);
		
		return city;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public int getPopulation() {
		return population;
	}
	public void setPopulation(int population) {
		this.population = population;
	}
	
	
}
