package com.example.demo.DAO;

import com.example.demo.Entity.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    void insertComment(int oID, String text, int star);
    List<Comment> selectCommentBySpID(int spID);
    float getStarBySpID(int spID);
}
