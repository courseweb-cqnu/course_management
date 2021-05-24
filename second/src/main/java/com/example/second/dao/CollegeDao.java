package com.example.second.dao;

import com.example.second.entity.College;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;


@Mapper
@Component(value = "CollegeDao")
public interface CollegeDao {

    List<College> findAllColleges();

    int deleteCollegeById(Long uid);

    int insert(College college);

    int addCollege(College college);

    College selectByPrimaryKey(Long uid);

    int updateCollege(College college);

    int updateByPrimaryKey(College college);

    List<College> findCollegeByName(String name);

    Integer deleteCollegesByIds(@Param("ids") Integer[] ids);

    int getCountColleges();
}
