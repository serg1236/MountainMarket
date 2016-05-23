package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.List;
import java.util.UUID;

/**
 * Created by Serg on 5/10/2016.
 */
@Entity
@Data
@NoArgsConstructor
@PrimaryKeyJoinColumn(name="ID")
public class Route extends DescribedEntity {
    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Place> places;
    @Enumerated(EnumType.STRING)
    private RouteComplexity complexity;
    private int duration;
}
