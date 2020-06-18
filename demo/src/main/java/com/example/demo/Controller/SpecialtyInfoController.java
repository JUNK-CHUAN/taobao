package com.example.demo.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.DAO.SpecialtyMapper;
import com.example.demo.Entity.Specialty;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Controller
public class SpecialtyInfoController {
    @Autowired
    SpecialtyMapper SM;
    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/getSpecialtyInfo/{specialty_id}", method = RequestMethod.GET)
    @ResponseBody
    public Map getSpecialtyInfo(@PathVariable String specialty_id,
                                HttpSession session, HttpServletRequest request) throws Exception {
        List<Specialty> specialtyList;
        specialtyList=SM.selectSpecialty(specialty_id);
        Map<String, Object> map = new HashMap<>();
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            System.out.println("还没登录");
            return map;
        }
        if(specialtyList.size()<=0){
            map.put("result", "false");
            System.out.println("specialty_id："+specialty_id);
            System.out.println("找不到这个特产");
            return map;
        }
        else{
            map.put("result", "true");
            map.put("data", specialtyList.get(0));
            return map;
        }
    }
}
