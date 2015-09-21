package com.webapp.command;

public class Code {
	String code;
	String name;
	
	public Code() {
		
	}
	public Code(String code, String name) {
		this.code = code;
		this.name = name;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String value) {
		this.name = value;
	}

}
