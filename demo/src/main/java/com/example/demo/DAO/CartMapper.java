package com.example.demo.DAO;

import com.example.demo.Entity.Cart;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {
    void insertCart(int spID, String cID, int count);
    List<Cart> selectCartBycID(String cID);
    List<Cart> selectCart(int spID, String cID);
    void deleteCart(int spID, String cID);
    void cartAddCount(int spID, String cID, int count);

}
