package com.skilldistillery.fursurance.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Species {

	@OneToMany(mappedBy = "species")
	private List<Breed> breeds;

	@OneToMany(mappedBy = "species")
	private List<Pet> pets;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	public Species() {
		super();
	}

	public List<Pet> getPets() {
		return pets;
	}

	public void setPets(List<Pet> pets) {
		this.pets = pets;
	}

	public List<Breed> getBreeds() {
		return breeds;
	}

	public void setBreeds(List<Breed> breeds) {
		this.breeds = breeds;
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

	@Override
	public String toString() {
		return "Species [id=" + id + ", name=" + name + "]";
	}

}
