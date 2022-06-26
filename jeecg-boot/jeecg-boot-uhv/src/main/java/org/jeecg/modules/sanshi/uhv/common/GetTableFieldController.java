package org.jeecg.modules.sanshi.uhv.common;

import com.alibaba.fastjson.JSON;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.*;
import java.util.*;

@RestController
public class GetTableFieldController {
    private static Connection conn = null;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/uhv?useUnicode=ture&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai";
            String user = "root";
            String pass = "123123";
            conn = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getFormList")
    public String getFormList(@RequestParam("table_name")String table_name){
        List<Map<String, String>> listMap = new ArrayList<>();
        String[] str={"id","create_by","create_time","update_by","update_time","sys_org_code"};
        List<String> list = Arrays.asList(str);
        try {
            DatabaseMetaData metaData = conn.getMetaData();
            ResultSet columns = metaData.getColumns(null, null, table_name, "%");
            while (columns.next()) {
                Map<String, String> map = new HashMap<>();
                String column_name = columns.getString("COLUMN_NAME");
                String remarks = columns.getString("REMARKS");
                String type = columns.getString("TYPE_NAME");
                if(list.contains(column_name)){
                    continue;
                }
                map.put("key", column_name);
                map.put("text", remarks);
                map.put("type", type);
                listMap.add(map);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        String result = JSON.toJSONString(listMap);
        System.out.println(result);
        return result;
    }
}
