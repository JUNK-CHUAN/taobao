package com.example.demo.Controller;

import com.example.demo.DAO.SpecialtyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ManageSpecialtyController {
    @Autowired
    SpecialtyMapper SPM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/createSpecialty", method = RequestMethod.POST)
    @ResponseBody
    public Map createSpecialty(@RequestParam(value = "name") String name,
                               @RequestParam(value = "picUrl") String picUrl,
                               @RequestParam(value = "stock") int stock,
                               @RequestParam(value = "detail") String detail,
                               @RequestParam(value = "category") String category,
                               @RequestParam(value = "price") float price,
                            HttpSession session)  throws Exception{
        Map<String, Object> map = new HashMap<>();
        // 处理未登录情况
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            return map;
        }
        if(!session.getAttribute("category").equals("seller")) {
            map.put("result", "false");   // 还没登陆
            System.out.println("不是商家");
            return map;
        }
        String sID = (String) session.getAttribute("userid");
        SPM.createNewSpecialty(sID, name, picUrl, stock, detail, category, price);
        map.put("result", "true");
        return map;

    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/updateSpecialty", method = RequestMethod.POST)
    @ResponseBody
    public Map updateSpecialty(@RequestParam(value = "spID") int spID,
                               @RequestParam(value = "name") String name,
                               @RequestParam(value = "picUrl") String picUrl,
                               @RequestParam(value = "stock") int stock,
                               @RequestParam(value = "detail") String detail,
                               @RequestParam(value = "category") String category,
                               @RequestParam(value = "price") float price,
                               HttpSession session)  throws Exception{
        Map<String, Object> map = new HashMap<>();
        // 处理未登录情况
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            return map;
        }
        if(!session.getAttribute("category").equals("seller")) {
            map.put("result", "false");   // 还没登陆
            System.out.println("不是商家");
            return map;
        }
        String sID = (String) session.getAttribute("userid");
        SPM.updateSpecialty(spID, name, picUrl, stock, detail, category, price);
        map.put("result", "true");
        return map;


    }
}
