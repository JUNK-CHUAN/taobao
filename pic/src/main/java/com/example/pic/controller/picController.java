package com.example.pic.controller;

import com.alibaba.fastjson.JSONObject;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


/*@SuppressWarnings("SpringMVCViewInspection")*/
@Controller
public class picController {

    @CrossOrigin(origins = "*")
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map FileUpload(@RequestParam("file") MultipartFile file){
        System.out.println("要上传了");
        Map<String, String> map = new HashMap<>();
        if (file.isEmpty()) {
            System.out.println("文件为空");
            map.put("result", "false");
            return map;
        }
        StringBuilder stringBuilder = new StringBuilder();
        File fileDir = new File("src/main/resources/static/");
        String path = fileDir.getAbsolutePath();
        UUID uuid = UUID.randomUUID();
        String uid=uuid.toString();
        System.out.println(uid);
        if(!fileDir.exists()){
            fileDir.mkdir();
            System.out.println("指定目录不存在");
        }
        try {

            file.transferTo(new File(path, uid));
            map.put("result", "true");
            map.put("url", stringBuilder.append(path+'\\').append(uid).toString());
            System.out.println("上传成功");
        } catch (Exception e) {
            map.put("result","false");
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



/*
    @RequestMapping(value = "/pic", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject singleFileUpload(@RequestParam("file") MultipartFile file){
*/

}