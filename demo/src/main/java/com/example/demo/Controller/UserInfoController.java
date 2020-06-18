package com.example.demo.Controller;

import com.example.demo.DAO.CustomerMapper;
import com.example.demo.DAO.SellerMapper;
import com.example.demo.Entity.Customer;
import com.example.demo.Entity.Seller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
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
//        System.out.println(session.getAttribute("isLogIn"));
//        System.out.println(session.getAttribute("userid"));
//        System.out.println(session.getAttribute("category"));
//        System.out.println("==================");
//        Cookie cookies[] = request.getCookies();
//        if (cookies != null){
//
//            for (Cookie cookie : cookies)
//            {
//                String key = cookie.getName();
//                String val = cookie.getValue();
//                System.out.println(key + " --- " + val);
//
//            }
//        }
//        else  {
//            System.out.println(" no cookie");
//        }
//        System.out.println();
//        System.out.println("==================");

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

                Map<String, Object> mymap = new HashMap<>();


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

}
