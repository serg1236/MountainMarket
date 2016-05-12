package com.mountainmarket.repository;

import com.mountainmarket.model.User;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Sergiy_Dakhniy
 */
public interface UserRepository extends CrudRepository<User, Integer> {
    User findByLogin(String login);
}
