package com.example.demo.Controller;

import com.example.demo.DAO.CustomerMapper;
import com.example.demo.DAO.SellerMapper;
import com.example.demo.Entity.Customer;
import com.example.demo.Entity.Seller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserInfoController {
    @Autowired
    CustomerMapper CM;
    @Autowired
    SellerMapper SM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/getCurrentUserInfo", method = RequestMethod.GET)
    @ResponseBody
    public Map getCurrentUserInfo(HttpSession session, HttpServletRequest request) throws Exception {

        List<Customer> customerList;
        List<Seller> sellerList;
        Map<String, String> map = new HashMap<>();
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            return map;
        }
        if(session.getAttribute("category").equals("customer")){
            customerList = CM.selectCustomer((String) session.getAttribute("userid"));
//            System.out.println(customerList.size());
            if(customerList.size() <= 0){
                map.put("result", "false");
                return map;
            }
            else{
                map.put("result", "true");
                map.put("userid", customerList.get(0).getcID());
                map.put("category", "customer");
                map.put("name", customerList.get(0).getName());
                map.put("phone", customerList.get(0).getPhone());
                map.put("address", customerList.get(0).getAddress());
                return map;
            }
        }
        else if(session.getAttribute("category").equals("seller")){
            sellerList = SM.selectSeller((String) session.getAttribute("userid"));
            if(sellerList.size() <= 0){
                map.put("result", "false");
                return map;
            }
            else{
                map.put("result", "true");
                map.put("userid", sellerList.get(0).getsID());
                map.put("category", "seller");
                map.put("name", sellerList.get(0).getName());
                map.put("phone", sellerList.get(0).getPhone());
                map.put("address", sellerList.get(0).getAddress());
                return map;
            }
        }
        else{
            map.put("result", "false");
            return map;
        }
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/updateCustomerInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map updateCustomerInfo(@RequestParam(value = "name") String name,
                        @RequestParam(value = "phone") String phone,
                        @RequestParam(value = "address") String address,
                        HttpSession session) throws Exception {

        Map<String, Object> map = new HashMap<>();
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            System.out.println("还没登录");
            return map;
        }
        if(!session.getAttribute("category").equals("customer")) {
            map.put("result", "false");   // 还没登陆
            System.out.println("不是顾客");
            return map;
        }
        String cID = (String) session.getAttribute("userid");
        CM.updateCustomerInfo(cID, name, phone, address);
        map.put("result", "true");
        return map;
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/updateSellerInfo", method = RequestMethod.POST)
    @ResponseBody
    public Map updateSellerInfo(@RequestParam(value = "name") String name,
                                  @RequestParam(value = "phone") String phone,
                                  @RequestParam(value = "address") String address,
                                  HttpSession session) throws Exception {

        Map<String, Object> map = new HashMap<>();
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            System.out.println("还没登录");
            return map;
        }
        if(!session.getAttribute("category").equals("seller")) {
            map.put("result", "false");
            System.out.println("不是商家");
            return map;
        }
        String sID = (String) session.getAttribute("userid");
        SM.updateSellerInfo(sID, name, phone, address);
        map.put("result", "true");
        return map;
    }

}
