package com.entity;

public class Specialist {
	
	private int id;
	private String specialistName;
	
	public Specialist() {
		
	}

	public Specialist(String specialistName) {
		
		this.specialistName = specialistName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}
	
	
}
