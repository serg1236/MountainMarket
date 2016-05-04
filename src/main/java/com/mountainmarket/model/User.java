package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

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
