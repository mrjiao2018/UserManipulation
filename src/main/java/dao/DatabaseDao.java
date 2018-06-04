package dao;

import org.apache.commons.dbutils.QueryRunner;
import utils.C3P0Utils;

import java.sql.SQLException;

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
}
