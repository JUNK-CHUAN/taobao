package com.example.demo.DAO;

        import com.example.demo.Entity.SpecialtyPic;
        import org.apache.ibatis.annotations.Mapper;

        import java.util.List;

@Mapper
public interface SpecialtyPicMapper {
    List<SpecialtyPic> selectDetailByspID(int spID);
    void createNewSpecialtyPic(int spID,String picUrl);
}
