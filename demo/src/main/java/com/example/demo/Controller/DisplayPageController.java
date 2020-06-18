package com.example.demo.Controller;

import com.example.demo.DAO.SellerMapper;
import com.example.demo.DAO.SpecialtyMapper;
import com.example.demo.Entity.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DisplayPageController {
    @Autowired SellerMapper SM;
    @Autowired
    SpecialtyMapper SPM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/customerHome", method = RequestMethod.GET)
    @ResponseBody
    public Map customerHome(HttpSession session)  throws Exception{
        List<Specialty> specialtyList;
        List<String> categoryList = Arrays.asList("西南", "华南", "华东", "东北", "中原");
        Map<String, Object> map = new HashMap<>();
        // 处理未登录情况
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            return map;
        }
        map.put("data", categoryList);
        return map;


    }


}
