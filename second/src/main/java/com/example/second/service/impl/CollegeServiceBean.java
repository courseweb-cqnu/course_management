package com.example.second.service.impl;


import com.example.second.dao.CollegeDao;
import com.example.second.entity.College;
import com.example.second.service.CollegeService;
// import jdk.nashorn.internal.objects.annotations.Property;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
//@Transactional(rollbackFor = Exception.class)
public class CollegeServiceBean implements CollegeService {

    @Autowired
    private CollegeDao collegeDao;



    public List<College> findAllColleges() {
        return this.collegeDao.findAllColleges();
    }


    @Transactional
    public void addCollege(College college) {
        this.collegeDao.addCollege(college);
//        this.collegeCopyDao.addCollege(college);
        Integer count = this.collegeDao.getCountColleges();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
        //int x = 5 / 0;
    }

    public void deleteCollegeById(Long uid) {
        this.collegeDao.deleteCollegeById(uid);
        Integer count = this.collegeDao.getCountColleges();
    }

    public void updateCollege(College college) {
        this.collegeDao.updateCollege(college);
    }

    public List<College> findCollegeByName(String name) {
        return this.collegeDao.findCollegeByName(name);
    }

    public Integer deleteCollegesByIds(Integer[] ids) {
        return this.collegeDao.deleteCollegesByIds(ids);
    }

}
