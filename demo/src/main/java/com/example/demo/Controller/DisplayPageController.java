package com.example.demo.Controller;

import com.example.demo.DAO.SellerMapper;
import com.example.demo.DAO.SpecialtyMapper;
import com.example.demo.Entity.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
        int i;
        List<Specialty> specialtyList;
        List<String> categoryList = Arrays.asList("西南", "华南", "华东", "东北", "中原");
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> category2Specialty = new HashMap<>();
        // 处理未登录情况
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            return map;
        }
        map.put("result", "true");
        map.put("data", category2Specialty);
        for(i=0; i<categoryList.size(); i++){
            specialtyList = SPM.selectSpecialtyByCategory(categoryList.get(i));
            if(specialtyList.size() > 4){
                specialtyList = specialtyList.subList(0, 4);
            }
            ((Map)(map.get("data"))).put(categoryList.get(i), specialtyList);
        }
        return map;
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/getSpecilatyByCategory/{category}", method = RequestMethod.GET)
    @ResponseBody
    public Map getSpecilatyByCategory(HttpSession session, @PathVariable String category)  throws Exception{
        List<Specialty> specialtyList;
        Map<String, Object> map = new HashMap<>();
        // 处理未登录情况
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            return map;
        }
        map.put("result", "true");
        specialtyList = SPM.selectSpecialtyByCategory(category);
        map.put("data", specialtyList);
        return map;
    }


}
