package com.example.second.service;

import java.util.List;

import com.example.second.entity.College;


public interface CollegeService {

    public List<College> findAllColleges();
    
    public void addCollege(College college);

    public void deleteCollegeById(Long uid);

    public void updateCollege(College college);

    List<College> findCollegeByName(String name);

    public Integer deleteCollegesByIds(Integer[] ids);

}
