package br.com.xavierfernando.crudspring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.xavierfernando.crudspring.model.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {
    
}
