package com.example.demo.DAO;

import com.example.demo.Entity.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    // 不用传oID，因为是自增的
    // alter table ordertable modify oID int auto_increment;
    // alter table ordertable modify column submitTime datetime null default current_timestamp;
    void insertOrder(int count, String address, String state, int spID, String cID, float sum);

    List<Order> selectOrderBycID(String cID);
    List<Order> selectOrderBysID(String sID);
    void changeOrderState(int oID, String state);
}