package com.example.demo.Controller;

import com.example.demo.DAO.SpecialtyMapper;
import com.example.demo.DAO.SpecialtyPicMapper;
import com.example.demo.Entity.Specialty;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@SuppressWarnings("SpringJavaInjectionPointsAutowiringInspection")
@Controller
public class ManageSpecialtyController {
    @Autowired
    SpecialtyMapper SPM;
    SpecialtyPicMapper SPPM;
    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/uploadPic", method = RequestMethod.POST)
    @ResponseBody
    public Map uploadPic(@RequestParam(value ="file_1") MultipartFile[] files,

                               HttpSession session)  throws Exception{
        System.out.println("图片上传来了");
        Map<String, Object> map = new HashMap<>();
        List<String> picUrls = null;
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

        //存放目录
        File fileDir = new File("src/main/resources/static/specialtyPic");
        String path = fileDir.getAbsolutePath();
        if(!fileDir.exists()){
            fileDir.mkdir();
            System.out.println(path);
            System.out.println("指定目录不存在");
            map.put("result", "false");   // 目录不存在
            return map;
        }
        //上传存储
        try {
            for(MultipartFile file:files){
                UUID uuid = UUID.randomUUID();
                String uid=uuid.toString();
                System.out.println(uid);
                file.transferTo(new File(path, uid+".jpg"));
                picUrls.add("specialtyPic/"+uid+".jpg");
            }
            map.put("picUrls",picUrls);
            map.put("result", "true");
            System.out.println("图片文件上传成功");
        } catch (Exception e) {
            map.put("result","false");
            System.out.println("图片上传失败");
            e.printStackTrace();
        }
        return map;


    }

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/createSpecialty", method = RequestMethod.POST)
    @ResponseBody
    public Map createSpecialty(@RequestParam(value = "name") String name,
                               @RequestParam(value ="picUrls") List<String> picUrls,
                               @RequestParam(value = "stock") int stock,
                               @RequestParam(value = "detail") String detail,
                               @RequestParam(value = "category") String category,
                               @RequestParam(value = "price") float price,
                               HttpSession session)  throws Exception{
        Map<String, String> map = new HashMap<>();
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
        String sID = (String) session.getAttribute("userid");
        SPM.createNewSpecialty(sID, name, picUrls.get(0), stock, detail, category, price);
        int spID=SPM.selectSpecialtyByPicUrl(picUrls.get(0));
        for(int i=1;i<picUrls.size();i++){
            SPPM.createNewSpecialtyPic(spID,picUrls.get(i));
        }
        map.put("result", "true");
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
