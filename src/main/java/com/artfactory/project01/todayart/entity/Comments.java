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
@Table(name = "comments")
@DynamicInsert
@DynamicUpdate
@Getter
@Setter
public class Comments implements Serializable {


    @Id
    @Column(name = "comment_id", updatable = false, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer commentId;

    @JoinColumn(table = "article", name = "article_id")
    @Column(name = "article_id", updatable = false, nullable = false)
    private Integer articleId;

    @ManyToOne(fetch = FetchType.EAGER,targetEntity = Member.class)
    @JoinColumn(name = "member_id",nullable = false,updatable = false)
    @JsonIgnore
    private Member member;

    @Column(name = "content", nullable = false, table = "comments")
    private String replyContent;

    @Column(name = "write_dated", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date writeDated;

    @Column(name = "update_dated")
    @Temporal(TemporalType.TIMESTAMP)
    @UpdateTimestamp
    private Date updateDated;

    @Column(name = "reply_group")
    private Integer group;

    @Column(name = "reply_depth")
    private Integer depth;

    @Column(name = "reply_order")
    private Integer order;

    @Column(name = "delete_dated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date deleteDated;

    @Column(name = "is_deleted")
    private String isDeleted;

    @Column(name = "password")
    private String password;

    @Transient
    private Integer memberId;

    @Transient
    private String nickname;
}
