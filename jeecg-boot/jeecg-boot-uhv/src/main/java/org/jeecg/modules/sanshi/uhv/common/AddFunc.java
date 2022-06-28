package org.jeecg.modules.sanshi.uhv.common;

import cn.hutool.core.date.DateTime;
import com.alibaba.fastjson.JSON;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

public class AddFunc {
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
    public void INSERT(String json,String table_name) throws SQLException {
        Map<String,String> map = JSON.parseObject(json, Map.class);
        String id= String.valueOf(UUID.randomUUID());
        String create_by="admin";
        String create_time= DateTime.now().toString();
        String s="insert into "+table_name+"(id,create_by,create_time,";
        String s1="";
        String s2=")values('"+id+"','"+create_by+"','"+create_time+"',";
        String s3="";
        String s4=")";
        for(String key:map.keySet()){
            s1+=key+",";
            String temp= map.get(key);
            s3+="'"+temp+"',";
        }
        s1 = s1.substring(0, s1.length() - 1);
        s3=s3.substring(0,s3.length()-1);
        String sql = s+s1+s2+s3+s4;
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        preparedStatement.execute(sql);
    }
}
