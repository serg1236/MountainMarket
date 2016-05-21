package com.mountainmarket.repository;

import com.mountainmarket.model.Place;
import com.mountainmarket.model.Tour;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Serg on 5/11/2016.
 */
public interface PlaceRepository extends CrudRepository<Place,Integer> {
    Place findByLatAndLng(String lat, String lng);
    List<Place> findAll();
}
