package com.uniq.smartpharma.repository;

import com.uniq.smartpharma.model.Drug;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DrugRepository extends JpaRepository<Drug, Long> {
    // This query will only return drugs where the name starts with the provided search term
    @Query("SELECT d FROM Drug d WHERE LOWER(d.name) LIKE LOWER(CONCAT(:name, '%')) ORDER BY d.name")
    List<Drug> findByNameStartingWithIgnoreCase(@Param("name") String name);

    // In DrugRepository.java
    @Query("SELECT d.name FROM Drug d WHERE LOWER(d.name) LIKE LOWER(:query)")
    List<String> findNameByQuery(@Param("query") String query);
}



