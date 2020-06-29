package com.example.demo.Controller;

import com.alibaba.fastjson.JSONObject;
import com.example.demo.DAO.CommentMapper;
import com.example.demo.DAO.OrderMapper;
import com.example.demo.Entity.Cart;
import com.example.demo.Entity.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
    @Autowired
    CommentMapper COMM;
    @Autowired
    OrderMapper OM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/insertComment", method = RequestMethod.POST)
    @ResponseBody
    public Map insertComment(@RequestParam(value = "oID") int oID,
                             @RequestParam(value = "text") String text,
                             @RequestParam(value = "star") int star,
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
        String cID = (String) session.getAttribute("userid");

        List<Order> orderList = OM.selectOrderByoID(oID);
        if(orderList.size() != 0){
            if(orderList.get(0).getState().equals("已收货，待评价")){
                COMM.insertComment(oID, text, star);
                OM.changeOrderStateOnly(oID, "已完成");
                map.put("result", "true");
                return map;
            }
            map.put("reason", "订单状态为已完成，不能再修改或添加评论。");
        }
        map.put("result", "false");
        return map;
    }
}
