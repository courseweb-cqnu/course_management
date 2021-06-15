package com.example.second.service;

import java.util.List;

import com.example.second.entity.Course;


public interface CourseService {

    public List<Course> findAllCourses();
    
    public void addCourse(Course course);

    public void deleteCourseById(Long uid);

    public void updateCourse(Course course);

    List<Course> findCourseByName(String name);

    List<Course> findCourseByCollege(Integer collegeId);

    public Integer deleteCoursesByIds(Integer[] ids);

}
