package com.mountainmarket.repository;

import com.mountainmarket.model.Route;
import com.mountainmarket.model.Tour;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.UUID;

/**
 * Created by Serg on 5/11/2016.
 */
public interface RouteRepository extends CrudRepository<Route,Integer> {
    List<Route> findAll();
}
