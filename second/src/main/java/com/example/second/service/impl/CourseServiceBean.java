package com.example.second.service.impl;


import com.example.second.dao.CourseDao;
import com.example.second.entity.Course;
import com.example.second.service.CourseService;
// import jdk.nashorn.internal.objects.annotations.Property;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
//@Transactional(rollbackFor = Exception.class)
public class CourseServiceBean implements CourseService {

    @Autowired
    private CourseDao courseDao;



    public List<Course> findAllCourses() {
        return this.courseDao.findAllCourses();
    }


    @Transactional
    public void addCourse(Course Course) {
        this.courseDao.addCourse(Course);
//        this.CourseCopyDao.addCourse(Course);
        Integer count = this.courseDao.getCountCourses();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
        //int x = 5 / 0;
    }

    public void deleteCourseById(Long uid) {
        this.courseDao.deleteCourseById(uid);
        Integer count = this.courseDao.getCountCourses();
    }

    public void updateCourse(Course Course) {
        this.courseDao.updateCourse(Course);
    }

    public List<Course> findCourseByName(String name) {
        return this.courseDao.findCourseByName(name);
    }

    public List<Course> findCourseByCollege(Integer collegeId) {
        return this.courseDao.findCourseByCollege(collegeId);
    }

    public Integer deleteCoursesByIds(Integer[] ids) {
        return this.courseDao.deleteCoursesByIds(ids);
    }

}
