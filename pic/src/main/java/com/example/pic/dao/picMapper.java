package com.example.pic.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface picMapper {
    void insertPic(String cID,String url);
}