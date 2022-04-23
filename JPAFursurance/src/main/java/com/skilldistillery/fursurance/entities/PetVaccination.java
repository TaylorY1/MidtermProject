package com.skilldistillery.fursurance.entities;	

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pet_vaccination")
public class PetVaccination {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "vax_date")
	private LocalDateTime vaxDate;
	
	
	@Column(name = "pet_id")
	private Integer petId;
	
	@Column(name = "vaccination_id")
	private Integer vaccinationId;
	
	
	private Integer term;
	

	public LocalDateTime getVaxDate() {
		return vaxDate;
	}
	public PetVaccination() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPetId() {
		return petId;
	}
	public void setPetId(Integer petId) {
		this.petId = petId;
	}
	public Integer getVaccinationId() {
		return vaccinationId;
	}
	public void setVaccinationId(Integer vaccinationId) {
		this.vaccinationId = vaccinationId;
	}
	public Integer getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		this.term = term;
	}
	public void setVaxDate(LocalDateTime vaxDate) {
		this.vaxDate = vaxDate;
	}
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PetVaccination other = (PetVaccination) obj;
		return Objects.equals(id, other.id);
	}
	@Override
	public String toString() {
		return "PetVaccination [id=" + id + ", vaxDate=" + vaxDate + ", petId=" + petId + ", vaccinationId="
				+ vaccinationId + ", term=" + term + "]";
	}




}
