package com.example.demo.DAO;

import com.example.demo.Entity.Specialty;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SpecialtyMapper {
    List<Specialty> selectSpecialty(String specialty_id);


    List<Specialty> selectSpecialtyByCategory(String category);
}