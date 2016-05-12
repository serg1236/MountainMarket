package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;

/**
 * Created by Serg on 5/10/2016.
 */
@Entity
@Data
@NoArgsConstructor
@PrimaryKeyJoinColumn(name="ID")
public class Place extends DescribedEntity {
    private String lan;
    private String lat;
    private String imgUrl;
}
