package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Serg on 5/11/2016.
 */
@Entity
@Data
@NoArgsConstructor
public class Feedback {
    @GeneratedValue
    @Id
    private int id;
    @ManyToOne
    User author;
    String text;
    int rating;
}
