package com.example.demo.Controller;

import com.example.demo.DAO.CustomerMapper;
import com.example.demo.DAO.SellerMapper;
import com.example.demo.Entity.Customer;
import com.example.demo.Entity.Seller;
import com.example.demo.ResponseClass.LoginResponse;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class LoginController {
    @Autowired CustomerMapper CM;
    @Autowired SellerMapper SM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map login(@RequestParam(value = "userid") String userid,
                        @RequestParam(value = "password") String password,
                        @RequestParam(value = "category") String category,
                        HttpSession session) throws Exception {
        List<Customer> customerList;
        List<Seller> sellerList;
        Map<String, String> map = new HashMap<>();
        if(category.equals("customer")){
            customerList = CM.selectCustomer(userid);
            if(customerList.size() == 0){
                map.put("result", "false");
                return map;
            }
            if(!customerList.get(0).getPassword().equals(password)){
                map.put("result", "false");
                return map;
            }
        }
        else if(category.equals("seller")){
            sellerList = SM.selectSeller(userid);
            if(sellerList.size() == 0){
                map.put("result", "false");
                return map;
            }
            if(!sellerList.get(0).getPassword().equals(password)){
                map.put("result", "false");
                return map;
            }
        }
        else{
            map.put("result", "false");
            return map;
        }
        session.setAttribute("isLogIn", true);
        session.setAttribute("userid", userid);
        session.setAttribute("category", category);
//        System.out.println(session.getAttribute("userid"));
        map.put("result", "true");
        return map;

    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ResponseBody
    public Map logout(HttpSession session) throws Exception {
        if(session.getAttribute("isLogIn") != null){
            session.removeAttribute("isLogIn");
        }
        if(session.getAttribute("userid") != null){
            session.removeAttribute("userid");
        }
        if(session.getAttribute("category") != null){
            session.removeAttribute("category");
        }
        Map<String, String> map = new HashMap<>();
        map.put("result", "true");
        return map;
    }


//    @CrossOrigin(origins = "*")
//    @RequestMapping(value = "/login/{username}", method = RequestMethod.GET)
//    @ResponseBody
//    public Map loginGet(@PathVariable String username, HttpSession session) throws Exception {
//        System.out.println(session.getAttribute("isLogIn"));
//        System.out.println(session.getAttribute("isLogIn") == null);
//        session.setAttribute("isLogIn", true);
//        System.out.println(session.getAttribute("isLogIn"));
//        String password = "123";
//        String category = "customer";
//        System.out.println(username);
//        System.out.println(password);
//        System.out.println(category);
//        List<Customer> customerList;
//        List<Seller> sellerList;
//        LoginResponse lr = new LoginResponse();
//        Map<String, String> map = new HashMap();
//        if(category.equals("customer")){
//            customerList = CM.selectCustomer(username);
//            System.out.println(customerList.size());
//            if(customerList.size() == 0){
//                System.out.println(222);
//                lr.setSuccess("false");
//                map.put("success", "false");
//                return map;
//            }
//            if(!customerList.get(0).getPassword().equals(password)){
//                System.out.println(111);
//                System.out.println(customerList.get(0).getPassword());
//                System.out.println(password);
//                System.out.println(password.equals(customerList.get(0).getPassword()));
//                map.put("success", "false");
//                return map;
//            }
//        }
//        else if(category.equals("seller")){
//            sellerList = SM.selectSeller(username);
//            if(sellerList.size() == 0){
//                map.put("success", "false");
//                return map;
//            }
//            if(!sellerList.get(0).getPassword().equals(password)){
//                map.put("success", "false");
//                return map;
//            }
//        }
//        map.put("success", "true");
//        return map;
//
//    }


}



