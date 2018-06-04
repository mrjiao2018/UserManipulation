package utils;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import pojo.*;

import java.sql.SQLException;
import java.util.List;

/**
 * DBUtils中的方法可以进一步封装成泛型方法
 */
public class DBUtils {

    /**
     * 添加Bean
     *
     * @param user 传入的javaBean对象
     */
    public static void addBean(User user){
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "insert into user values(null, ?, ?, ?, ?)";
        try {
            int update = qr.update(sql, user.getName(), user.getPassword(), user.getPhone(), user.getEmail());
            System.out.println(update);
        } catch (SQLException e) {
            System.out.println("插入数据失败");
        }
    }

    /**
     * 更新Bean
     *
     * @param user 传入的javaBean对象
     * @param id 指定javaBean的id
     */
    public static void updateBean(User user, int id) {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "update user set name = ?, password = ?, phone = ?, email = ? where id = ?";
        try {
            int update = qr.update(sql, user.getName(), user.getPassword(), user.getPhone(), user.getEmail(), id);
            System.out.println(update);
        } catch (SQLException e) {
            System.out.println("更新数据失败");
        }
    }

    /**
     * 更新Bean
     *
     * @param id 指定javaBean的id
     */
    public static void removeBean(int id) {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "delete from user where id = ?";
        try {
            int update = qr.update(sql, id);
            System.out.println(update);
        } catch (SQLException e) {
            System.out.println("删除数据失败");
        }
    }

    /**
     * 查询所有Bean
     *
     * @return List 返回User的List
     */
    public static List<User> queryAll() {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "SELECT * FROM user";
        List<User> users = null;
        try {
            users = qr.query(sql, new BeanListHandler<>(User.class));
        } catch (SQLException e) {
            System.out.println("查询所有用户失败");
        }
        return users;
    }

    /**
     * 根据用户名查询user
     *
     * @param name user用户名
     * @return List user的List
     */
    public static List<User> queryByName(String name) {
        QueryRunner qr = new QueryRunner(C3P0Utils.getDataSource());
        String sql = "SELECT * FROM user where name like ?";
        List<User> users = null;
        try {
            users = qr.query(sql, new BeanListHandler<>(User.class), ("%" + name + "%"));
        } catch (SQLException e) {
            System.out.println("查询指定用户失败");
        }
        return users;
    }

}
