package com.example.demo.Controller;

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
}
