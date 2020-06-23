package com.example.demo.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.DAO.CartMapper;
import com.example.demo.Entity.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {
    @Autowired
    CartMapper CAM;
    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/insertCart", method = RequestMethod.POST)
    @ResponseBody
    public Map insertCart(@RequestParam(value = "spID") int spID,
                        @RequestParam(value = "count") int count,
                        HttpSession session) throws Exception{
        String cID;
        System.out.println(spID);
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
        cID = (String) session.getAttribute("userid");

        List<Cart> cartList = CAM.selectCart(spID, cID);
        if(cartList.size()!=0){
            CAM.cartAddCount(spID, cID, count);
        }
        else{
            CAM.insertCart(spID, cID, count);
        }
        map.put("result", "true");
        return map;
    }

//    @CrossOrigin(origins = "*")
//    @RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
//    @ResponseBody
//    public Map deleteCart(@RequestParam(value = "spID") int spID, HttpSession session) throws Exception{
//        String cID;
//        Map<String, Object> map = new HashMap<>();
//        if(session.getAttribute("isLogIn") == null) {
//            map.put("result", "false");   // 还没登陆
//            System.out.println("还没登录");
//            return map;
//        }
//        if(!session.getAttribute("category").equals("customer")) {
//            map.put("result", "false");   // 不是顾客，不能删除购物车中的条目
//            System.out.println("不是顾客");
//            return map;
//        }
//        cID = (String) session.getAttribute("userid");
//        CAM.deleteCart(spID, cID);
//        map.put("result", "true");
//        return map;
//    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/selectCustomerCart", method = RequestMethod.GET)
    @ResponseBody
    public Map selectCustomerCart(HttpSession session) throws Exception{
        String cID;
        Map<String, Object> map = new HashMap<>();
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            System.out.println("还没登录");
            return map;
        }
        if(!session.getAttribute("category").equals("customer")) {
            map.put("result", "false");   // 不是顾客，不能查看购物车
            System.out.println("不是顾客");
            return map;
        }
        cID = (String) session.getAttribute("userid");
        List<Cart> cartList = CAM.selectCartBycID(cID);
        if(cartList.size()<=0)
        {
            System.out.println("购物车是空的");
        }
        else {
            System.out.println("购物车不是空的");
            map.put("data", cartList);
        }
        map.put("result", "true");

        return map;
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
    @ResponseBody
    public Map deleteCart(@RequestBody String param, HttpSession session) throws Exception{
        String cID;
        System.out.println(param);
        JSONObject jsonObj = JSONObject.parseObject(param);
        List<Integer> spList= (List<Integer>) jsonObj.get("spList");
        System.out.println("我来删购物车了");
        Map<String, Object> map = new HashMap<>();
        cID = (String) session.getAttribute("userid");
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            System.out.println("还没登录");
            return map;
        }
        if(!session.getAttribute("category").equals("customer")) {
            map.put("result", "false");   // 不是顾客，不能删除购物车中的条目
            System.out.println("不是顾客");
            return map;
        }

        for(int i=0; i<spList.size(); i++) {
            CAM.deleteCart(spList.get(i), cID);
        }

        map.put("result", "true");
        return map;

    }
}
