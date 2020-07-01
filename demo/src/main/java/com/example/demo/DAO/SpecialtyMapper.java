package com.example.demo.DAO;

import com.example.demo.Entity.Specialty;
import org.apache.ibatis.annotations.Mapper;
import org.omg.CORBA.INTERNAL;

import java.util.List;

@Mapper
public interface SpecialtyMapper {
    List<Specialty> selectSpecialty(int specialty_id);

    List<Specialty> selectSpecialtyByCategory(String category);
    List<Specialty> searchByKeyword(String keyword);
    List<Specialty> selectSpecialtyBySid(String sID);
    Integer selectSpecialtyByPicUrl(String picUrl);

    void createNewSpecialty(String sID, String name, String picUrl, int stock, String detail,
                            String category, float price);

    void updateSpecialtyInfo(int spID, String name, int stock, String category, float price);
    void updateSpecialtyDetail(int spID,String detail);
    void updateSpecialtyPic(int spID,  String picUrl);
    void reduceStock(int spID, int count);

    void deleteSpecialty(int spID);

    List<Specialty> specialtySaleRank();
    List<Specialty> specialtyStarRank();
}