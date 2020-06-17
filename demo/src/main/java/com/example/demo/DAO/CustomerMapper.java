package com.example.demo.DAO;
import com.example.demo.Entity.Customer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CustomerMapper {
    List<Customer> selectCustomer(String customer_id);

    List<Customer> getAllCustomer();
}
