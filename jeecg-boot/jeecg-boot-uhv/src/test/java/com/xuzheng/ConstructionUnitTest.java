package com.xuzheng;

import com.alibaba.fastjson.JSON;
import org.junit.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConstructionUnitTest {
    @Test
    public void getDbFieldTest() throws SQLException {
        Connection conn = null;
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
        DatabaseMetaData metaData = conn.getMetaData();
//        ResultSet tables = metaData.getTables(null, null, null, new String[]{"construction_unit"});
        List<Map<String, String>> listMap = new ArrayList<>();
        ResultSet columns = metaData.getColumns(null, null, "construction_unit", "%");
        while (columns.next()) {
            Map<String, String> map = new HashMap<>();
            String column_name = columns.getString("COLUMN_NAME");
            String remarks = columns.getString("REMARKS");
            String type = columns.getString("TYPE_NAME");
            map.put("key", column_name);
            map.put("text", remarks);
            map.put("type", type);
            listMap.add(map);
        }
        String s = JSON.toJSONString(listMap);
        System.out.println(s);
    }
}
