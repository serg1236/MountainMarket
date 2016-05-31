package com.mountainmarket.security;

import com.mountainmarket.model.User;
import com.mountainmarket.repository.UserRepository;
import lombok.Data;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Sergiy_Dakhniy
 */
@Data
public class DbUserDetailsService implements UserDetailsService {

    private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //отримання користувача з бази
        User user = userRepository.findByLogin(username);
        System.out.println("Okaaaay auth for: " + username);
        if(user == null) {
            throw new UsernameNotFoundException("Cannot find user with login: " + username);
        }
        //ініціалізація ролі користувача в системі
        String role = user.getRole();
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(role));
        return new org.springframework.security.core.userdetails.User(username, user.getPassword(), authorities);
    }
}
