package com.artfactory.project01.todayart.model;

import com.artfactory.project01.todayart.entity.Comments;

import java.io.Serializable;
import java.util.Date;


public class CommentForm implements Serializable {

    private Integer commentId;
    private Integer articleId;
    private Integer memberId;
    private String content;
    private Date createDated;
    private Date updateDated;
    private Date deleteDated;
    private String isDeleted;
    private Integer group;
    private Integer depth;
    private Integer order;
    private Comments comments;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getComment() {
        return content;
    }

    public void setComment(String content) {
        this.content = content;
    }

    public Date getCreateDated() {
        return createDated;
    }

    public void setCreateDated(Date createDated) {
        this.createDated = createDated;
    }

    public Date getUpdateDated() {
        return updateDated;
    }

    public void setUpdateDated(Date updateDated) {
        this.updateDated = updateDated;
    }

    public Date getDeleteDated() {
        return deleteDated;
    }

    public void setDeleteDated(Date deleteDated) {
        this.deleteDated = deleteDated;
    }

    public String getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(String isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getGroup() {
        return group;
    }

    public void setGroup(Integer group) {
        this.group = group;
    }

    public Integer getDepth() {
        return depth;
    }

    public void setDepth(Integer depth) {
        this.depth = depth;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Comments getComments() {
        return comments;
    }

    public void setComments(Comments comments) {


        if (commentId != null) {
            comments.setCommentId(this.commentId);
        }
        if (articleId != null) {
            comments.setArticleId(this.articleId);
        }
        if (memberId != null) {
            comments.setMemberId(this.memberId);
        }
        if (content != null) {
            comments.setReplyContent(this.content);
        }
        if (createDated != null) {
            comments.setWriteDated(this.createDated);
        }
        if (updateDated != null) {
            comments.setUpdateDated(this.updateDated);
        }
        if (deleteDated != null) {
            comments.setDeleteDated(this.deleteDated);
        }
        if (isDeleted != null) {
            comments.setIsDeleted(this.isDeleted);
        }
        if (group != null){
            comments.setGroup(this.group);
        }
        if (depth != null){
            comments.setDepth(this.depth);
        }
        if (order != null){
            comments.setOrder(this.order);
        }
        this.comments = comments;

    }
}
