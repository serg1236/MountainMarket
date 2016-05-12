package com.mountainmarket.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

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
    private String email;
    private String password;
    @ManyToMany(mappedBy = "participants")
    private List<Tour> tours;
    private String role;
    @Enumerated(EnumType.STRING)
    private UserStatus status;
    private String imgUrl;
    @OneToOne(fetch = FetchType.EAGER)
    private Portfolio portfolio;
}
