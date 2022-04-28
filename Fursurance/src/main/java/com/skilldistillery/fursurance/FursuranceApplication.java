package com.skilldistillery.fursurance;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class FursuranceApplication extends SpringBootServletInitializer {
	  @Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    return application.sources(FursuranceApplication.class);
	  }

	public static void main(String[] args) {
		SpringApplication.run(FursuranceApplication.class, args);
	}

}
