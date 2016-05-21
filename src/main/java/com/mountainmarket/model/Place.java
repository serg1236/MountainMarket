package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * Created by Serg on 5/10/2016.
 */
@Entity
@Data
@NoArgsConstructor
@PrimaryKeyJoinColumn(name="ID")
@Table(
    uniqueConstraints=
    @UniqueConstraint(columnNames={"lng", "lat"})
)
public class Place extends DescribedEntity {
    private String lng;
    private String lat;
    private String imgUrl;
}
