package com.skilldistillery.fursurance.entities;


import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
public class Pet {

	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String name;

	private String gender;

	private String overview;

	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate birthdate;

	@Column(name = "photo_url")
	private String photoUrl;
	
	@OneToMany(mappedBy = "pet")
	private List<Quote> quotes;

	@OneToMany(mappedBy ="pet")
	private List<PetVaccination> vaccinations;
	
	@ManyToOne
	@JoinColumn(name= "user_id")
	private User user;
	
	
	@ManyToOne
	@JoinColumn(name = "species_id")
	private Species species;
	
	@ManyToOne
	@JoinColumn(name = "breed_id")
	private Breed breed;
	
	@ManyToMany
	@JoinTable(name = "pet_has_medical_condition", joinColumns = @JoinColumn(name= "pet_id"),
	inverseJoinColumns = @JoinColumn(name = "medical_condition_id"))
	private List<MedicalCondition> conditions;
	
	
	//methods
	public Pet() {
		super();
	}

	public List<MedicalCondition> getConditions() {
		return conditions;
	}

	public void setConditions(List<MedicalCondition> conditions) {
		this.conditions = conditions;
	}

	public Breed getBreed() {
		return breed;
	}

	public void setBreed(Breed breed) {
		this.breed = breed;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<PetVaccination> getVaccinations() {
		return vaccinations;
	}

	public void setVaccinations(List<PetVaccination> vaccinations) {
		this.vaccinations = vaccinations;
	}

	public Species getSpecies() {
		return species;
	}

	public void setSpecies(Species species) {
		this.species = species;
	}

	public List<Quote> getQuotes() {
		return quotes;
	}


	public void setQuotes(List<Quote> quotes) {
		this.quotes = quotes;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public LocalDate getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(LocalDate birthdate) {
		this.birthdate = birthdate;
	}

	

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
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
		Pet other = (Pet) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public String toString() {
		return "Pet [id=" + id + ", name=" + name + ", gender=" + gender + ", overview=" + overview + ", birthdate="
				+ birthdate + ", photoUrl=" + photoUrl + ", vaccinations=" + vaccinations + ", species=" + species
				+ ", breed=" + breed + ", conditions=" + conditions + "]";
	}

	
	
	

}
