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

    }
}
