package com.springapp.mvc.dao;

import com.springapp.mvc.model.User;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


import java.util.ArrayList;
import java.util.List;


@Repository
public class UserDaoImpl implements UserDao {

    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session =this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User " + user + " added.");

    }

    @Override
    public void updateUser(User user) {
        Session session =this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User " + user + " changed");

    }

    @Override
    public void deleteUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, new Integer(id));
        if(user!=null){
            session.delete(user);
        }
        logger.info("User " + user + " deleted");

    }


    @Override
    public User getUserById(int id) {
        Session session= this.sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, new Integer(id));
        logger.info("User " + user + " loaded");
        return user;
    }

    @Override
    @SuppressWarnings("uncheked")
    public List<User> listUser() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userlist = session.createQuery("FROM User").list();
        for(User user:userlist){
            logger.info("User list " + user);
        }
        return userlist;
    }

    @Override
    @SuppressWarnings("uncheked")
    public List<User> listUser(String user) {
        return this.sessionFactory.getCurrentSession().createQuery("from User where name=:user").setString("user",user).list();

    }


}
