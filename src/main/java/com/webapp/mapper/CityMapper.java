package com.webapp.mapper;

import java.util.List;

import com.webapp.model.City;

public interface CityMapper {
	
	List<String> selectDistricts(String countryCode);
	
	int insert(City city);
}
