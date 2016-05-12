package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

/**
 * Created by Serg on 5/11/2016.
 */
@Entity
@Data
@NoArgsConstructor
public class Request {
    @GeneratedValue
    @Id
    private int id;
    @ManyToMany
    List<Place> places;
    LocalDate startDate;
    LocalDate endDate;
    @ManyToOne
    User author;
    String comment;
}
