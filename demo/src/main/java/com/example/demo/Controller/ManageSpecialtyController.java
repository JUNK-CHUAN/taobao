package com.example.demo.Controller;

import com.example.demo.DAO.SpecialtyMapper;
import com.example.demo.Entity.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class ManageSpecialtyController {
    @Autowired
    SpecialtyMapper SPM;

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/createSpecialty")
    @ResponseBody
    public Map createSpecialty(
            @RequestParam(value ="file_1") MultipartFile[] file,
//                               @RequestParam(value = "stock") int stock,
//                               @RequestParam(value = "detail") String detail,
//                               @RequestParam(value = "category") String category,
//                               @RequestParam(value = "price") float price,
//                               @RequestParam(value = "name") String name,
            HttpSession session)  throws Exception{
        System.out.println("上传来了");
        Map<String, Object> map = new HashMap<>();
        // 处理未登录情况
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

        //图片文件存储
//        File fileDir = new File("src/main/resources/static/specialtyPic");
//        String path = fileDir.getAbsolutePath();
//        UUID uuid = UUID.randomUUID();
//        String uid=uuid.toString();
//        System.out.println(uid);
//        if(!fileDir.exists()){
//            fileDir.mkdir();
//            System.out.println(path);
//            System.out.println("指定目录不存在");
//            map.put("result", "false");   // 目录不存在
//            return map;
//        }
//        try {
//            file.transferTo(new File(path, uid+".jpg"));
//            String picUrl="specialtyPic/"+uid+".jpg";
//            map.put("result", "true");
//            map.put("url", picUrl);
//            System.out.println("上传成功");
//
//            String sID = (String) session.getAttribute("userid");
//         //   SPM.createNewSpecialty(sID, name, picUrl, stock, detail, category, price);
//            map.put("result", "true");
//        } catch (Exception e) {
//            map.put("result","false");
//            System.out.println("上传失败");
//            e.printStackTrace();
//        }
//
//        return map;
      return map;
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/updateSpecialty", method = RequestMethod.POST)
    @ResponseBody
    public Map updateSpecialty(@RequestParam(value = "spID") int spID,
                               @RequestParam(value = "name") String name,
                               @RequestParam(value ="file") MultipartFile file,
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

        //图片文件存储
        File fileDir = new File("src/main/resources/static/specialtyPic");
        String path = fileDir.getAbsolutePath();
        UUID uuid = UUID.randomUUID();
        String uid=uuid.toString();
        System.out.println(uid);
        if(!fileDir.exists()){
            fileDir.mkdir();
            System.out.println(path);
            System.out.println("指定目录不存在");
            map.put("result", "false");   // 目录不存在
            return map;
        }
        try {
            file.transferTo(new File(path, uid+".jpg"));
            String picUrl="specialtyPic/"+uid+".jpg";
            map.put("result", "true");
            map.put("url", picUrl);
            System.out.println("上传成功");

            String sID = (String) session.getAttribute("userid");
            SPM.updateSpecialty(spID, name, picUrl, stock, detail, category, price);
            map.put("result", "true");
        } catch (Exception e) {
            map.put("result","false");
            System.out.println("上传失败");
            e.printStackTrace();
        }

        return map;

    }




    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/ge",method = RequestMethod.GET)
    public  String ge(){
        System.out.println("来了");
        return "pic.html";
    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/deleteSpecialty/{spID}", method = RequestMethod.GET)
    @ResponseBody
    public Map deleteSpecialty(@PathVariable int spID,
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
        SPM.deleteSpecialty(spID);
        map.put("result", "true");
        return map;

    }
}
