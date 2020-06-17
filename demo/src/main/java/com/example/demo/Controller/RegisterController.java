package com.example.demo.Controller;

import com.example.demo.DAO.CustomerMapper;
import com.example.demo.DAO.SellerMapper;
import com.example.demo.Entity.Customer;
import com.example.demo.Entity.Seller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class RegisterController {
    @Autowired
    CustomerMapper CM;
    @Autowired
    SellerMapper SM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map Register(@RequestParam(value = "userid") String userid,
                        @RequestParam(value = "password") String password,
                        @RequestParam(value = "category") String category,
                        @RequestParam(value = "name") String name,
                        @RequestParam(value = "phone") String phone,
                        @RequestParam(value = "address") String address,
                        HttpSession session) throws Exception {
        List<Customer> customerList;
        List<Seller> sellerList;
        Map<String, String> map = new HashMap<>();
        if (category.equals("customer")) {
            customerList = CM.selectCustomer(userid);
            if (customerList.size() == 0) {
                CM.insertCustomer(userid, password, name, phone, address);
                map.put("result", "true");
                return map;
            } else {
                map.put("result", "false");
                return map;
            }
        } else if (category.equals("seller")) {
            sellerList = SM.selectSeller(userid);
            if (sellerList.size() == 0) {
                SM.insertSeller(userid, password, name, phone, address);
                map.put("result", "true");
                return map;
            } else {
                map.put("result", "false");
                return map;
            }
        } else {
            map.put("result", "false");
            return map;
        }
    }

}