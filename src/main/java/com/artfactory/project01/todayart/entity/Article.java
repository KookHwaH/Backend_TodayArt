package com.artfactory.project01.todayart.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "article")
@DynamicInsert
@DynamicUpdate
@Getter
@Setter
public class Article implements Serializable {

    @Id
    @Column(columnDefinition = "INT", name = "article_id", updatable = false, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer articleId;



    @Column(name = "board_id",nullable = false)
    private Integer boardId;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Member.class)
    @JoinColumn(name = "member_id", nullable = false, updatable = false)
    @JsonIgnore
    private Member member;

    @Column(name = "write_dated", updatable = false, nullable = false)
    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date writeDated;

    @Column(name = "update_dated")
    @UpdateTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateDated;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "content", nullable = false)
    private String content;

    @Column(name = "is_deleted")
    private String isDeleted;

    @Column(name = "delete_dated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date deletedDated;

    @Column(name = "is_hidden")
    private String isHidden;

    @Column(name = "password")
    private String password;

    @Column(name = "views")
    private Integer views;

    @Column(name = "product_id")
    private Integer productId;

    @Transient
    private Integer commentNum;

    @Transient
    private Integer memberId;

    @Transient
    private String nickname;

    @Transient
    private String boardName;

    @Transient
    private Article article;

    @Transient
    private Integer cnt;
}
