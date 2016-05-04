package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by Sergiy_Dakhniy
 */
@Entity
@Table(name = "customer")
@Data
@NoArgsConstructor
public class User {
    @GeneratedValue
    @Id
    private int id;
    private String login;
    private String password;
}
