package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

/**
 * Created by Serg on 5/10/2016.
 */
@Entity
@Data
@NoArgsConstructor
public class Portfolio {
    @GeneratedValue
    @Id
    private int id;
    @ElementCollection
    List<String> imageUrls;
    String text;
    @OneToMany
    List<Feedback> feedbacks;
}
