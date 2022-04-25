package com.skilldistillery.fursurance.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Quote {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private double deductible;
	
	@Column(name="risk_score")
	private double riskScore;
	
	@Column(name="coupon_code")
	private String couponCode;
	
	private double premium;
	
	@Column(name="quote_date")
	private LocalDateTime quoteDate;
	
	private Integer coverage;
	
	@ManyToOne
	@JoinColumn(name= "plan_id")
	private Plan plan;
	
	@ManyToOne
	@JoinColumn(name = "plan_tier_id")
	private PlanTier tier;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "pet_id")
	private Pet pet;
	

	
	//methods
	public Quote() {
		super();
	}

	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public PlanTier getTier() {
		return tier;
	}

	public void setTier(PlanTier tier) {
		this.tier = tier;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public void setCoverage(Integer coverage) {
		this.coverage = coverage;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getDeductible() {
		return deductible;
	}

	public void setDeductible(double deductible) {
		this.deductible = deductible;
	}

	public double getRiskScore() {
		return riskScore;
	}

	public void setRiskScore(double riskScore) {
		this.riskScore = riskScore;
	}

	public String getCouponCode() {
		return couponCode;
	}

	public void setCouponCode(String couponCode) {
		this.couponCode = couponCode;
	}

	public double getPremium() {
		return premium;
	}

	public void setPremium(double premium) {
		this.premium = premium;
	}

	public LocalDateTime getQuoteDate() {
		return quoteDate;
	}

	public void setQuoteDate(LocalDateTime quoteDate) {
		this.quoteDate = quoteDate;
	}

	public int getCoverage() {
		return coverage;
	}

	public void setCoverage(int coverage) {
		this.coverage = coverage;
	}

	@Override
	public String toString() {
		return "Quote [id=" + id + ", deductible=" + deductible + ", riskScore=" + riskScore + ", couponCode="
				+ couponCode + ", premium=" + premium + ", quoteDate=" + quoteDate + ", coverage=" + coverage
				+ ", plan=" + plan + ", tier=" + tier + ", user=" + user + ", pet=" + pet + "]";
	}
	
	
	

}
