package com.mountainmarket.repository;

import com.mountainmarket.model.Request;
import com.mountainmarket.model.Route;
import com.mountainmarket.model.Tour;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Serg on 5/11/2016.
 */
public interface RequestRepository extends CrudRepository<Request,Integer> {
}
