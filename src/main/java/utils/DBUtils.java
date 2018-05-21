package utils;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import pojo.*;

import java.sql.SQLException;
import java.util.List;

public class DBUtils {
    /**
     * 创建数据表
     *
     * 本来可以根据javaBean的泛型对应创建表，但感觉不是本次考察重点并且实际开发中也不常用，就硬编码写死了
     */
    public static void createTable() {

    }

    /**
     * 修改数据表结构，同样采用硬编码
     */
    public static void alterTable() {

    }

    /**
     * 添加Bean
     *
     * @param user 传入的javaBean对象
     */
    public static void addBean(User user){

    }

    /**
     * 更新Bean
     *
     * @param user 传入的javaBean对象
     * @param id 指定javaBean的id
     */
    public static void updateBean(User user, int id) {

    }

    /**
     * 更新Bean
     *
     * @param id 指定javaBean的id
     */
    public static void removeBean(int id) {

    }

//    @Deprecated
//    public static List<Client> queryAll() {
//        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
//        String sql = "SELECT * FROM studentInfo";
//        List<Client> list = null;
//        try {
//            list = qr.query(sql, new BeanListHandler<Client>(Client.class));
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
    /**
     * 查询所有Bean
     *
     * @return List 返回User的List
     */
    public static List<User> queryAll() {
        return null;
    }

    /**
     * 根据用户名查询user
     *
     * @param name user用户名
     * @return List user的List
     */
    public static List<User> queryByName(String name) {
        return null;
    }

}
