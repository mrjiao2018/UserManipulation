package service.impl;

import dao.UserDao;
import pojo.User;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDao();
    @Override
    public void addUser(User user) {
        if(user == null) {
            System.out.println("插入用户为null，无法像数据库中插入数据");
            return;
        }
        //前端提交表单时，已经加入表单信息非空验证，此处不需要再检验
        userDao.addUser(user);
    }

    @Override
    public void addUserWithProc(User user) {
        if(user == null) {
            System.out.println("插入用户为null，无法像数据库中插入数据");
            return;
        }
        //前端提交表单时，已经加入表单信息非空验证，此处不需要再检验
        userDao.addUserProc(user);
    }

    @Override
    public void updateUser(User user, int id) {
        List<User> users = this.getAllUsers();
        int length = users.get(users.size()-1).getId();
        if(user == null || id < 0 || id > length) {
            System.out.println("更新数据不符合规范，无法更新");
            return;
        }
        userDao.updateUser(user, id);
    }

    @Override
    public void removeUser(int id) {
        List<User> users = this.getAllUsers();
        int length = users.get(users.size()-1).getId();
        if(id < 0 || id > length) {
            System.out.println("id越界，无法删除");
            return;
        }
        userDao.removeUser(id);
    }

    @Override
    public List<User> getUsersByName(String name) {
        if(name == null) {
            System.out.println("name为空，无法查询");
            return null;
        }
        if(name == "") {
            return userDao.getAllUsers();
        }
        else {
            return userDao.getUsersByName(name);
        }
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }
}
