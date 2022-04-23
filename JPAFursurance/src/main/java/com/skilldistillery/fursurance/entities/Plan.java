package com.skilldistillery.fursurance.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Plan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private String description;
	
	@Column(name="base_premium")
	private double basePremium;
	
	private double deductible;
	
	@Column(name="base_coverage")
	private double baseCoverage;

	public Plan() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getBasePremium() {
		return basePremium;
	}

	public void setBasePremium(double basePremium) {
		this.basePremium = basePremium;
	}

	public double getDeductible() {
		return deductible;
	}

	public void setDeductible(double deductible) {
		this.deductible = deductible;
	}

	public double getBaseCoverage() {
		return baseCoverage;
	}

	public void setBaseCoverage(double baseCoverage) {
		this.baseCoverage = baseCoverage;
	}

	@Override
	public String toString() {
		return "Plan [id=" + id + ", name=" + name + ", description=" + description + ", basePremium=" + basePremium
				+ ", deductible=" + deductible + ", baseCoverage=" + baseCoverage + "]";
	}
	
	

}
