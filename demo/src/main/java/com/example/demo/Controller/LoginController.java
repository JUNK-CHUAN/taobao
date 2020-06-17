package com.example.demo.Controller;

import com.example.demo.DAO.CustomerMapper;
import com.example.demo.DAO.SellerMapper;
import com.example.demo.Entity.Customer;
import com.example.demo.Entity.Seller;
import com.example.demo.ResponseClass.LoginResponse;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import java.util.List;


@Controller
public class LoginController {
    @Autowired CustomerMapper CM;
    @Autowired SellerMapper SM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public LoginResponse login(@RequestParam(value = "username") String username,
                        @RequestParam(value = "password") String password,
                        @RequestParam(value = "category") String category,
                        HttpSession session) throws Exception {
        List<Customer> customerList;
        List<Seller> sellerList;
        LoginResponse lr = new LoginResponse();
        if(category.equals("customer")){
            customerList = CM.selectCustomer(username);
            if(customerList.size() == 0){
                lr.setSuccess("false");
                return lr;
            }
            if(!customerList.get(0).getPassword().equals(password)){
                lr.setSuccess("false");
                return lr;
            }
        }
        else if(category.equals("seller")){
            sellerList = SM.selectSeller(username);
            if(sellerList.size() == 0){
                lr.setSuccess("false");
                return lr;
            }
            if(!sellerList.get(0).getPassword().equals(password)){
                lr.setSuccess("false");
                return lr;
            }
        }
        lr.setSuccess("true");
        return lr;

    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/login/{username}", method = RequestMethod.GET)
    @ResponseBody
    public LoginResponse loginGet(@PathVariable String username, HttpSession session) throws Exception {
        String password = "123";
        String category = "customer";
        System.out.println(username);
        System.out.println(password);
        System.out.println(category);
        List<Customer> customerList;
        List<Seller> sellerList;
        LoginResponse lr = new LoginResponse();
        if(category.equals("customer")){
            customerList = CM.selectCustomer(username);
            System.out.println(customerList.size());
            if(customerList.size() == 0){
                System.out.println(222);
                lr.setSuccess("false");
                return lr;
            }
            if(!customerList.get(0).getPassword().equals(password)){
                System.out.println(111);
                System.out.println(customerList.get(0).getPassword());
                System.out.println(password);
                System.out.println(password.equals(customerList.get(0).getPassword()));
                lr.setSuccess("false");
                return lr;
            }
        }
        else if(category.equals("seller")){
            sellerList = SM.selectSeller(username);
            if(sellerList.size() == 0){
                lr.setSuccess("false");
                return lr;
            }
            if(!sellerList.get(0).getPassword().equals(password)){
                lr.setSuccess("false");
                return lr;
            }
        }
        lr.setSuccess("true");
        return lr;

    }

}



