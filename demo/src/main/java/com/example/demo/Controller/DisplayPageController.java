package com.example.demo.Controller;

import com.example.demo.DAO.*;
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
    @Autowired
    SpecialtyPicMapper SPICM;
    @Autowired
    OrderMapper OM;
    @Autowired
    CommentMapper COMM;

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
            if(specialtyList.size() > 8){
                specialtyList = specialtyList.subList(0, 8);
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

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/search/{keyword}", method = RequestMethod.GET)
    @ResponseBody
    public Map searchSpecialty(HttpSession session, @PathVariable String keyword)  throws Exception{
        List<Specialty> specialtyList;
        Map<String, Object> map = new HashMap<>();
        // 处理未登录情况
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            return map;
        }
        map.put("result", "true");
        specialtyList = SPM.searchByKeyword("%" + keyword + "%");
        map.put("data", specialtyList);
        return map;
    }


    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/getSellerSpecialtyList", method = RequestMethod.GET)
    @ResponseBody
    public Map getSellerSpecialtyList(HttpSession session)  throws Exception{
        List<Specialty> specialtyList;
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
        map.put("result", "true");
        specialtyList = SPM.selectSpecialtyBySid(sID);

        int i;
        for(i=0; i<specialtyList.size(); i++){
            // 获取详情图片
            specialtyList.get(i).setDetailPics(SPICM.selectDetailByspID(specialtyList.get(i).getSpID()));
            // 获取销量
            specialtyList.get(i).setSalesVolume(OM.getSalesVolumeBySpID(specialtyList.get(i).getSpID()));
            // 获取star数
            specialtyList.get(i).setStar(COMM.getStarBySpID(specialtyList.get(i).getSpID()));
            // 获取每条评论
            specialtyList.get(i).setComments(COMM.selectCommentBySpID(specialtyList.get(i).getSpID()));
            // 获取评论数
            specialtyList.get(i).setCommentNum(specialtyList.get(i).getComments().size());
        }

        map.put("data", specialtyList);
        return map;
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/specialtySaleRank", method = RequestMethod.GET)
    @ResponseBody
    public Map specialtySaleRank(HttpSession session)  throws Exception{
        List<Specialty> specialtyList;
        Map<String, Object> map = new HashMap<>();
        // 处理未登录情况
        if(session.getAttribute("isLogIn") == null) {
            map.put("result", "false");   // 还没登陆
            return map;
        }
        map.put("result", "true");
        specialtyList = SPM.specialtySaleRank();
        map.put("data", specialtyList);
        return map;
    }



}
