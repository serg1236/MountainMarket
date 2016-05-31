package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

/**
 * Created by Serg on 5/10/2016.
 */
@Entity
@Data
@NoArgsConstructor
@PrimaryKeyJoinColumn(name="ID")
public class Tour extends DescribedEntity {
    @ManyToOne(fetch = FetchType.EAGER)
    private Route route;
    private LocalDate startDate;
    private LocalDate endDate;
    private double price;
    private int capacity;
    //опис зв'язку багато-до-багатьох між турами та їх учасниками
    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<User> participants;
    @ManyToOne
    private User guide;
    @OneToMany(fetch = FetchType.EAGER)
    private List<Feedback> feedbacks;
}
