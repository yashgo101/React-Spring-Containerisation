package com.crud;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// import com.microsoft.applicationinsights.attach.ApplicationInsights;

@SpringBootApplication
public class SpringBootCrudExampleApplication {

	public static void main(String[] args) {
		// ApplicationInsights.attach();
		SpringApplication.run(SpringBootCrudExampleApplication.class, args);
	}

}
