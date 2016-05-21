package com.mountainmarket.model;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.net.ssl.SSLEngineResult;
import javax.persistence.*;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by Serg on 5/10/2016.
 */
@Entity
@Data
@NoArgsConstructor
@Inheritance(strategy= InheritanceType.JOINED)
public class DescribedEntity {
    public static final String UA_LANG = "uk";
    public static final String EN_LANG = "en";
    @GeneratedValue
    @Id
    private int id;
    @ElementCollection
    @MapKeyColumn(name="language")
    @Column(name="name")
    @CollectionTable(name="de_names", joinColumns=@JoinColumn(name="de_id"))
    @LazyCollection(LazyCollectionOption.FALSE)
    private Map<String,String> names;
    @ElementCollection
    @MapKeyColumn(name="language")
    @Column(name="info", columnDefinition = "varchar(3000)")
    @CollectionTable(name="de_infos", joinColumns=@JoinColumn(name="de_id"))
    @LazyCollection(LazyCollectionOption.FALSE)
    private Map<String, String> infos;
    private boolean isActive;
}
