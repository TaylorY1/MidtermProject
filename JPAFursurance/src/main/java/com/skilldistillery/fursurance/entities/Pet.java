package com.skilldistillery.fursurance.entities;	

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Pet {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	private String name;
	
	private String gender;
	
	private String overview;
	
	private LocalDateTime birthdate;
	
	@Column(name = "species_id")
	private Integer speciesId;
	
	@Column(name = "breed_id")
	private Integer breedId;
	
	@Column(name = "user_id")
	private Integer userId;
	
	@Column(name = "photo_url")
	private Integer photoUrl;

	public Pet() {
		super();
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

	public LocalDateTime getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(LocalDateTime birthdate) {
		this.birthdate = birthdate;
	}

	public Integer getSpeciesId() {
		return speciesId;
	}

	public void setSpeciesId(Integer speciesId) {
		this.speciesId = speciesId;
	}

	public Integer getBreedId() {
		return breedId;
	}

	public void setBreedId(Integer breedId) {
		this.breedId = breedId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(Integer photoUrl) {
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
				+ birthdate + ", speciesId=" + speciesId + ", breedId=" + breedId + ", userId=" + userId + ", photoUrl="
				+ photoUrl + "]";
	}
}
