package com.artfactory.project01.todayart.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Where;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;


@ToString
@Entity
@Table(name="member")
@DynamicInsert
@DynamicUpdate
@Getter
@Setter
public class Member implements UserDetails, Serializable {

    @Id
    @Column(name="member_id", updatable = false, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer memberId;

    @Column(name="email")
    private String email;

    @Column(name="password")
    private String password;

    @Column(name="nickname")
    private String nickname;

    @Column(name="realname")
    private String realName;

    @Column(name="reg_dated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date regDated;

    @Column(name="phone")
    private String Phone;

    @Column(name="role")
    private String role;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="last_connect_dated")
    private Date lastConnectDated;

    @Column(name="expired")
    private String expired;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="expired_dated")
    private Date expiredDated;

    @Column(name="email_checked")
    private String emailChecked;

    @OneToMany(targetEntity=MemberAddress.class, fetch = FetchType.EAGER)
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @Where(clause = "is_delete = 'n'")
    private List<MemberAddress> memberAddresses = new ArrayList<>();

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @JsonIgnore
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
            GrantedAuthority authority = new SimpleGrantedAuthority(role);
            authorities.add(authority);
        return authorities;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}