package com.skilldistillery.fursurance.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="plan_tier")
public class PlanTier {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="coverage_adjustment")
	private Double coverageAdjustment;
	
	@Column(name="deductible_adjustment")
	private Double deductibleAdjustment;
	
	public PlanTier() {
		
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

	public double getCoverageAdjustment() {
		return coverageAdjustment;
	}

	public void setCoverageAdjustment(double coverageAdjustment) {
		this.coverageAdjustment = coverageAdjustment;
	}

	public double getDeductibleAdjustment() {
		return deductibleAdjustment;
	}

	public void setDeductibleAdjustment(double deductibleAdjustment) {
		this.deductibleAdjustment = deductibleAdjustment;
	}

	@Override
	public String toString() {
		return "PlanTier [id=" + id + ", name=" + name + ", coverageAdjustment=" + coverageAdjustment
				+ ", deductibleAdjustment=" + deductibleAdjustment + "]";
	}
	
	

}
