package com.xuzhengTest;

import com.alibaba.fastjson.JSON;
import org.junit.Test;

import java.util.Map;

public class Tower {
    @Test
    public void GetUpdateID(){
        String json="";
        Map<String, String> map = JSON.parseObject(json, Map.class);
        System.out.println(map);
        String id=map.get("id");
    }
}
