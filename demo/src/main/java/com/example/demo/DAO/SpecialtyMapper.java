package com.example.demo.DAO;

import com.example.demo.Entity.Specialty;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SpecialtyMapper {
    List<Specialty> selectSpecialty(int specialty_id);

    List<Specialty> selectSpecialtyByCategory(String category);
    List<Specialty> searchByKeyword(String keyword);
    List<Specialty> selectSpecialtyBySid(String sID);

    void createNewSpecialty(String sID, String name, String picUrl, int stock, String detail,
                            String category, float price);

    void updateSpecialty(int spID, String name, String picUrl, int stock, String detail,
                         String category, float price);

    void reduceStock(int spID, int count);
}