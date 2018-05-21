package service;

import pojo.User;

import java.util.List;

public interface UserService {
    /**
     * 添加user
     *
     * @param user 表单提交的user
     */
    void addUser(User user);

    /**
     * 更新user
     *
     * @param user 表单提交的user
     * @param id user的id
     */
    void updateUser(User user, int id);

    /**
     * 删除user
     *
     * @param id user的id
     */
    void removeUser(int id);

    /**
     * 通过name获取user
     *
     * @param name user的name
     * @return list
     */
    List<User> getUsersByName(String name);

    /**
     * 获取所有user
     *
     * @return list
     */
    List<User> getAllUsers();
}
