package com.skilldistillery.fursurance.entities;	

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="pet_vaccination")
public class PetVaccination {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "vax_date")
	private LocalDate vaxDate;
	
	private Integer term;
	
	@ManyToOne
	@JoinColumn(name = "vaccination_id")
	private Vaccine vaccine;
	
	@ManyToOne
	@JoinColumn(name = "pet_id")
	private Pet pet;
	
	//methods
	public LocalDate getVaxDate() {
		return vaxDate;
	}
	
	public Pet getPet() {
		return pet;
	}

	public void setPet(Pet pet) {
		this.pet = pet;
	}

	public Vaccine getVaccine() {
		return vaccine;
	}

	public void setVaccine(Vaccine vaccine) {
		this.vaccine = vaccine;
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

	public Integer getTerm() {
		return term;
	}
	public void setTerm(Integer term) {
		this.term = term;
	}
	public void setVaxDate(LocalDate vaxDate) {
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





}
