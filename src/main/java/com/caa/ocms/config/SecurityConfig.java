package com.caa.ocms.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable()
            .authorizeHttpRequests()
            .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()
            .requestMatchers("/actuator/health").permitAll()
            .requestMatchers(HttpMethod.GET, "/courses", "/course/**").permitAll()
            .requestMatchers(HttpMethod.GET, "/courses/published", "/courses/completed").permitAll()
            // Explicitly allow modules endpoints (defense-in-depth for GET by course)
            .requestMatchers("/modules/**").permitAll()
            .requestMatchers(HttpMethod.GET, "/modules/**", "/course-lessons/**", "/assessments/**", 
                           "/assessment-questions/**", "/question-options/**", "/course-materials/**").permitAll()
            // Temporarily open write endpoints until JWT is wired
            .requestMatchers(HttpMethod.POST, "/courses", "/add-course").permitAll()
            .requestMatchers(HttpMethod.PUT, "/courses/**").permitAll()
            .requestMatchers(HttpMethod.PATCH, "/edit-course/**").permitAll()
            .requestMatchers(HttpMethod.DELETE, "/delete-course/**").permitAll()
            // Open write endpoints for other resources as well (modules, lessons, assessments, materials)
            .requestMatchers(HttpMethod.POST, 
                    "/modules/**", 
                    "/course-lessons/**", 
                    "/assessments/**", 
                    "/assessment-questions/**", 
                    "/question-options/**", 
                    "/course-materials/**").permitAll()
            .requestMatchers(HttpMethod.PUT, 
                    "/modules/**", 
                    "/course-lessons/**", 
                    "/assessments/**", 
                    "/assessment-questions/**", 
                    "/question-options/**", 
                    "/course-materials/**").permitAll()
            .requestMatchers(HttpMethod.PATCH, 
                    "/modules/**", 
                    "/course-lessons/**", 
                    "/assessments/**", 
                    "/assessment-questions/**", 
                    "/question-options/**", 
                    "/course-materials/**").permitAll()
            .requestMatchers(HttpMethod.DELETE, 
                    "/modules/**", 
                    "/course-lessons/**", 
                    "/assessments/**", 
                    "/assessment-questions/**", 
                    "/question-options/**", 
                    "/course-materials/**").permitAll()
            // Temporarily permit any remaining requests until JWT is wired
            .anyRequest().permitAll()
            .and()
            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        return http.build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(Arrays.asList(
                "http://localhost:3000",
                "http://localhost:3001",
                "http://127.0.0.1:3000",
                "http://127.0.0.1:3001",
                "http://localhost:5173",
                "http://127.0.0.1:5173"
        ));
        configuration.setAllowedMethods(Arrays.asList("GET","POST","PUT","PATCH","DELETE","OPTIONS"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}


