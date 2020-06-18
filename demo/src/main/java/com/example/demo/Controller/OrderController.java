package com.example.demo.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.DAO.CartMapper;
import com.example.demo.DAO.OrderMapper;
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
                String state = "已下单";
                float sum = count * (cartObjList.get(0).getPrice());
                OM.insertOrder(count, recvAddress, state, spID, cID, sum);
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
        OM.changeOrderState(oID, "已发货");
        map.put("result", "true");

        return map;

    }

}
