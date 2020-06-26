package com.example.demo.DAO;

import com.example.demo.Entity.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    // 不用传oID，因为是自增的
    // alter table ordertable modify oID int auto_increment;
    // alter table ordertable modify column submitTime datetime null default current_timestamp;
    // alter table specialty modify spID int auto_increment;
    void insertOrder(int count, String address, String state, int spID, String cID, float sum);

    List<Order> selectOrderBycID(String cID);
    List<Order> selectOrderBysID(String sID);
    void changeOrderState(int oID, String state, String expressNo);
    void changeOrderStateOnly(int oID, String state);
    int getSalesVolumeBySpID(int spID);
    List<Order> selectOrderByoID(int oID);
}
