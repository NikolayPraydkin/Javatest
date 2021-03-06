package com.springapp.mvc.service;

import com.springapp.mvc.dao.UserDao;
import com.springapp.mvc.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service
public class UserServiceImpl implements UserService {



    private UserDao userDao;




    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);

    }

    @Override
    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);

    }

    @Override
    @Transactional
    public void deleteUser(int id) {
        this.userDao.deleteUser(id);

    }

    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<User> listUser() {
        return this.userDao.listUser();
    }

    @Override
    @Transactional
    public List<User> listUser(String user) {
        return userDao.listUser(user);
    }
}
