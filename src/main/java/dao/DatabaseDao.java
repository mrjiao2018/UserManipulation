package dao;

import org.apache.commons.dbutils.QueryRunner;
import pojo.User;
import utils.C3P0Utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseDao {
    /**
     * 创建数据表
     *
     * 本来可以根据javaBean的泛型对应创建表，但感觉不是本次考察重点并且实际开发中也不常用，就硬编码写死了
     */
    public static void createTable() {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "create table test(id int(16), name varchar(16))";
        try {
            int update = qr.update(sql);
            System.out.println(update);
        } catch (SQLException e) {
            System.out.println("创建表失败");
        }
    }

    /**
     * 修改数据表结构，同样采用硬编码
     */
    public static void alterTable() {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "alter table test add password varchar(16)";
        try {
            int update = qr.update(sql);
            System.out.println(update);
        } catch (SQLException e) {
            System.out.println("修改表失败");
        }
    }

    /**
     * 创建触发器,向user表中插入记录时，自动向log表中插入记录
     */
    public static void createInsertTrigger() {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "delimiter $\n" +
                "create trigger user_insert_trigger\n" +
                "after insert\n" +
                "on user\n" +
                "for each row\n" +
                "begin\n" +
                "insert into log values(null, new.name, \"insert\", NOW());\n" +
                "end;\n" +
                "$";
        try {
            int update = qr.update(sql);
            System.out.println(update);
        } catch (SQLException e) {
            System.out.println("向log表插入数据失败");
        }
    }

    /**
     * 创建触发器,向user表中删除记录时，自动向log表中插入记录
     */
    public static void createDeleteTrigger() {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "delimiter $\n" +
                "create trigger user_delete_trigger\n" +
                "after delete\n" +
                "on user\n" +
                "for each row\n" +
                "begin\n" +
                "insert into log values(null, old.name, \"delete\", NOW());\n" +
                "end;\n" +
                "$";
        try {
            int update = qr.update(sql);
            System.out.println(update);
        } catch (SQLException e) {
            System.out.println("向log表插入数据失败");
        }
    }


    /**
     * 创建存储过程1
     */
    public static void selectProcedure() {
        Connection connection = C3P0Utils.getConnection();
        String procedureSql = "delimiter $\n" +
                "create procedure query_user_pro()\n" +
                "begin\n" +
                "select * from user;\n" +
                "end;\n" +
                "$\n";
        try {
            Statement statement = connection.createStatement();
            statement.execute(procedureSql);
            connection.commit();
        } catch (Exception e) {
            System.out.println("调用存储过程失败");
        }
    }

    /**
     * 创建存储过程2
     */
    public static void updateLogProcedure() {
        Connection connection = C3P0Utils.getConnection();
        String procedureSql = "delimiter $\n" +
                "create procedure update_log_pro(in user_id int(16), in user_name varchar(16))\n" +
                "begin\n" +
                "insert into log values(null, user_id, user_name, \"insert\", NOW());\n" +
                "end;\n" +
                "$";
        try {
            Statement statement = connection.createStatement();
            statement.execute(procedureSql);
            connection.commit();
        } catch (Exception e) {
            System.out.println("调用存储过程失败");
        }
    }
}
