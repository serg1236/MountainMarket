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
@PrimaryKeyJoinColumn(name="ID")
public class Route extends DescribedEntity {
    @ManyToMany
    private List<Place> places;
    @Enumerated(EnumType.STRING)
    private RouteComplexity complexity;
    private int duration;
}
