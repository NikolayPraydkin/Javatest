package com.springapp.mvc.dao;

import com.springapp.mvc.model.User;

import java.util.List;



public interface UserDao {

    public void addUser(User user);
    public void updateUser(User user);
    public void deleteUser(int id);
    public User getUserById(int id);
    public List<User> listUser();

    public List<User> listUser(String user);
}
