package com.webapp.model;

import java.util.List;

public class Dept {
	private Integer deptno;
	private String dname;
	private String loc;
	private List<Emp> emps;	// 1:N
	
	public Dept() {
		
	}
	public Dept(Integer deptno, String dname) {
		this.deptno = deptno;
		this.dname = dname;
	}
	
	public Integer getDeptno() {
		return deptno;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public List<Emp> getEmps() {
		return emps;
	}
	public void setEmps(List<Emp> emps) {
		this.emps = emps;
	}
	
}
