package com.uniq.smartpharma.repository;

import com.uniq.smartpharma.model.Drugs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DrugRepository extends JpaRepository<Drugs, Long> {
    // This query will only return drugs where the name starts with the provided search term
    @Query("SELECT d FROM Drugs d WHERE LOWER(d.name) LIKE LOWER(CONCAT(:name, '%')) ORDER BY d.name")
    List<Drugs> findByNameStartingWithIgnoreCase(@Param("name") String name);

    // In DrugRepository.java
    @Query("SELECT d.name FROM Drugs d WHERE LOWER(d.name) LIKE LOWER(:query)")
    List<String> findNameByQuery(@Param("query") String query);
}



