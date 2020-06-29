package com.example.demo.Controller;

import com.example.demo.DAO.CommentMapper;
import com.example.demo.DAO.OrderMapper;
import com.example.demo.DAO.SpecialtyPicMapper;
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
    @Autowired
    SpecialtyPicMapper SPM;
    @Autowired
    OrderMapper OM;
    @Autowired
    CommentMapper COMM;
    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/getSpecialtyInfo/{specialty_id}", method = RequestMethod.GET)
    @ResponseBody
    public Map getSpecialtyInfo(@PathVariable int specialty_id,
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
            int i;
            for(i=0; i<specialtyList.size(); i++){
                // 获取详情图片
                specialtyList.get(i).setDetailPics(SPM.selectDetailByspID(specialtyList.get(i).getSpID()));
                // 获取销量
                specialtyList.get(i).setSalesVolume(OM.getSalesVolumeBySpID(specialtyList.get(i).getSpID()));
                // 获取star数
                specialtyList.get(i).setStar(COMM.getStarBySpID(specialtyList.get(i).getSpID()));
                // 获取每条评论
                specialtyList.get(i).setComments(COMM.selectCommentBySpID(specialtyList.get(i).getSpID()));
                // 获取评论数
                specialtyList.get(i).setCommentNum(specialtyList.get(i).getComments().size());

            }
            map.put("result", "true");
            map.put("data", specialtyList.get(0));
            return map;
        }
    }
}
