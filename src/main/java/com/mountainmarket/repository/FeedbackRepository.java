package com.mountainmarket.repository;

import com.mountainmarket.model.Feedback;
import com.mountainmarket.model.Tour;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Serg on 5/11/2016.
 */
public interface FeedbackRepository extends CrudRepository<Feedback,Integer> {
}
