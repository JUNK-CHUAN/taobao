package com.example.demo.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.DAO.CartMapper;
import com.example.demo.DAO.OrderMapper;
import com.example.demo.DAO.SpecialtyMapper;
import com.example.demo.Entity.Cart;


import com.example.demo.Entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    CartMapper CAM;
    @Autowired
    OrderMapper OM;
    @Autowired
    SpecialtyMapper SPM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/buyFromCart", method = RequestMethod.POST)
    @ResponseBody
    public Map buyFromCart(@RequestBody String param,
                          HttpSession session) throws Exception{
        JSONObject jsonObj = JSONObject.parseObject(param);

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

        List<Object> cartList= (List<Object>) jsonObj.get("data");
        String recvAddress = (String) jsonObj.get("recvAddress");
        for(int i=0; i<cartList.size(); i++){
            Map<String, Object> cartItem = (Map<String, Object>) cartList.get(i);
            int spID = Integer.parseInt((String) cartItem.get("spID"));
            List<Cart> cartObjList = CAM.selectCart(spID, cID);
            if(cartObjList.size() > 0){
                int count = cartObjList.get(0).getCount();
                int stock = cartObjList.get(0).getStock();
                if(stock < count){
                    // 如果库存不够就中止
                    map.put("result", "false");
                    map.put("reason", "库存不足");
                    return map;
                }
                String state = "已下单";
                float sum = count * (cartObjList.get(0).getPrice());
                OM.insertOrder(count, recvAddress, state, spID, cID, sum);
                SPM.reduceStock(spID, count);
                CAM.deleteCart(spID, cID);
            }
        }
        map.put("result", "true");
        return map;
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/buyFromCartWithNewCount", method = RequestMethod.POST)
    @ResponseBody
    public Map buyFromCartWithNewCount(@RequestBody String param,
                           HttpSession session) throws Exception{
//        System.out.println(param);
        JSONObject jsonObj = JSONObject.parseObject(param);

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

        List<Object> cartList= (List<Object>) jsonObj.get("data");
        String recvAddress = (String) jsonObj.get("recvAddress");
        // 先检测是否有库存不足，有的话直接返回，不下单
        for(int i=0; i<cartList.size(); i++){
            Map<String, Object> cartItem = (Map<String, Object>) cartList.get(i);
            int spID = Integer.parseInt((String) cartItem.get("spID"));
            int count = Integer.parseInt((String) cartItem.get("count"));
            List<Cart> cartObjList = CAM.selectCart(spID, cID);
            if(cartObjList.size() > 0){
//                int count = cartObjList.get(0).getCount();
                int stock = cartObjList.get(0).getStock();
                if(stock < count){
                    // 如果库存不够就中止
                    map.put("result", "false");
                    map.put("reason", cartObjList.get(0).getSpName() + " 库存不足");
                    return map;
                }
            }
        }
        // 正式下单
        for(int i=0; i<cartList.size(); i++){
            Map<String, Object> cartItem = (Map<String, Object>) cartList.get(i);
            int spID = Integer.parseInt((String) cartItem.get("spID"));
            int count = Integer.parseInt((String) cartItem.get("count"));
            List<Cart> cartObjList = CAM.selectCart(spID, cID);
            if(cartObjList.size() > 0){
//                int count = cartObjList.get(0).getCount();
//                int stock = cartObjList.get(0).getStock();
//                if(stock < count){
//                    // 如果库存不够就中止
//                    map.put("result", "false");
//                    map.put("reason", "库存不足");
//                    return map;
//                }
                String state = "已下单";
                float sum = count * (cartObjList.get(0).getPrice());
                OM.insertOrder(count, recvAddress, state, spID, cID, sum);
                SPM.reduceStock(spID, count);
                CAM.deleteCart(spID, cID);
            }
        }
        map.put("result", "true");
        return map;
    }


    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/currentCustomerOrderList", method = RequestMethod.GET)
    @ResponseBody
    public Map currentUserOrderList(HttpSession session) throws Exception{
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
        List<Order> orderList = OM.selectOrderBycID(cID);
        map.put("result", "true");
        map.put("data", orderList);
        return map;

    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/currentSellerOrderList", method = RequestMethod.GET)
    @ResponseBody
    public Map currentSellerOrderList(HttpSession session) throws Exception{
        Map<String, Object> map = new HashMap<>();
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            System.out.println("还没登录");
            return map;
        }
        if(!session.getAttribute("category").equals("seller")) {
            map.put("result", "false");   // 还没登陆
            System.out.println("不是商家");
            return map;
        }
        String sID = (String) session.getAttribute("userid");
        List<Order> orderList = OM.selectOrderBysID(sID);
        map.put("result", "true");
        map.put("data", orderList);
        return map;

    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/setOrderStateSent", method = RequestMethod.POST)
    @ResponseBody
    public Map setOrderStateSent(@RequestParam(value = "oID") int oID,
                                 @RequestParam(value = "expressNo") String expressNo,
                                 HttpSession session) throws Exception{
        Map<String, Object> map = new HashMap<>();
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            System.out.println("还没登录");
            return map;
        }
        if(!session.getAttribute("category").equals("seller")) {
            map.put("result", "false");   // 还没登陆
            System.out.println("不是商家");
            return map;
        }
        List<Order> orderList = OM.selectOrderByoID(oID);
        if(orderList.size() != 0){
            if((orderList.get(0).getState().equals("已下单")) || (orderList.get(0).getState().equals("已发货")) ){
                OM.changeOrderState(oID, "已发货", expressNo);
                map.put("result", "true");
                return map;
            }
        }
        map.put("result", "false");
        return map;
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/setOrderStateRecv/{oID}", method = RequestMethod.GET)
    @ResponseBody
    public Map setOrderStateRecv(@PathVariable int oID,
                                 HttpSession session) throws Exception{
        Map<String, Object> map = new HashMap<>();
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            System.out.println("还没登录");
            return map;
        }
        if(!session.getAttribute("category").equals("customer")) {
            map.put("result", "false");
            System.out.println("不是顾客");
            return map;
        }
        List<Order> orderList = OM.selectOrderByoID(oID);
        if(orderList.size() != 0){
            if(orderList.get(0).getState().equals("已发货")){
                OM.changeOrderStateOnly(oID, "已收货，待评价");
                map.put("result", "true");
                return map;
            }
        }
        map.put("result", "false");
        return map;
    }

}
