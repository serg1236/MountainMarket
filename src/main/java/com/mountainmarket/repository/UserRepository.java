package com.mountainmarket.repository;

import com.mountainmarket.model.User;
import org.springframework.cglib.core.Predicate;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 * Created by Sergiy_Dakhniy
 */
//CrudRepository містить базові CRUD операції
public interface UserRepository extends CrudRepository<User, Integer> {
    User findByLogin(String login);
    User findByLoginOrEmail(@Param("login") String login, @Param("email")String email);
}
