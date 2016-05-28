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
@NamedQuery(name="User.findByLoginOrEmail", query="select u from User u where u.login=:login or u.email=:email")
public class User {
    @GeneratedValue
    @Id
    private int id;
    @Column(unique = true, nullable = false)
    private String login;
    @Column(unique = true, nullable = false)
    private String email;
    private String password;
    private String role;
    @Enumerated(EnumType.STRING)
    private UserStatus status;
    private String imgUrl;
    @OneToOne(fetch = FetchType.EAGER)
    private Portfolio portfolio;
}
