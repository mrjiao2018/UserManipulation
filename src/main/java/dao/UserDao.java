package dao;

import pojo.User;
import utils.C3P0Utils;
import utils.DBUtils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Statement;
import java.util.List;

public class UserDao {
    public void addUser(User user) {
        DBUtils.addBean(user);
    }

    public void updateUser(User user, int id) {
        DBUtils.updateBean(user, id);
    }

    public void removeUser(int id) {
        DBUtils.removeBean(id);
    }

    public List<User> getUsersByName(String name) {
        return DBUtils.queryByName(name);
    }

    public List<User> getAllUsers() {
        return DBUtils.queryAll();
    }

    public void addUserProc(User user) {
        Connection connection = C3P0Utils.getConnection();
        String procedureSql = "CREATE PROCEDURE add_user_proc("
                +"input_user_name IN VARCHAR,"
                +"input_user_phoneNumber IN VARCHAR,"
                +"input_user_email IN VARCHAR) AS"
                +"BEGIN "
                +"INSERT INTO user VALUES(input_user_id, input_user_name ,input_user_phoneNumber, input_user_email); "
                +"END add_user_proc;";
        try {
            Statement statement = connection.createStatement();
            statement.execute(procedureSql);
            connection.commit();
            CallableStatement callableStatement = connection.prepareCall("CALL add_user_proc(?,?,?,?,?)");
            callableStatement.setString(1, null);
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getPassword());
            callableStatement.setString(4, user.getPhone());
            callableStatement.setString(5, user.getEmail());
            callableStatement.execute();
            connection.commit();
        } catch (Exception e) {
            System.out.println("调用存储过程失败");
        }
    }

    public void trigger() {
        Connection connection = C3P0Utils.getConnection();
        String procedureSql = "CREATE TRIGGER testref BEFORE INSERT ON user" +
                "  FOR EACH ROW BEGIN" +
                "    INSERT INTO log VALUES (null)" +
                "  END";
        try {
            Statement statement = connection.createStatement();
            statement.execute(procedureSql);
            connection.commit();
        } catch (Exception e) {
            System.out.println("创建触发器失败");
        }
    }
}
