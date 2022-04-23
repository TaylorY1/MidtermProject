package com.skilldistillery.fursurance.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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

	public Quote() {
		super();
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
				+ couponCode + ", premium=" + premium + ", quoteDate=" + quoteDate + ", coverage=" + coverage + "]";
	}
	
	
	

}
