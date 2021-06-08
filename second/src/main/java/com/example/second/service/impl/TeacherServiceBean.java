package com.example.second.service.impl;

import com.example.second.dao.TeacherDao;
import com.example.second.entity.Teacher;
import com.example.second.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
@Transactional
public class TeacherServiceBean implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;


    public List<Teacher> findAllTeachers() {
        return this.teacherDao.findAllTeachers();
    }

    //返回错误数组

    public List<String> errors(Teacher teacher) {
        List<String> errors = new ArrayList<>();
        if (teacher.getUid() == null || teacher.getUid() > 1000 || teacher.getUid() < 1) {
            errors.add("ID输入错误!");
        }
        if (teacher.getName() == null || teacher.getName().equals("") || teacher.getName().length() < 2) {
            errors.add("名字输入错误!");
        }
        if (teacher.getAge() == null || teacher.getAge() < 18 || teacher.getAge() > 60) {
            errors.add("年龄错误");
        }
        if (teacher.getGender() == null) {
            errors.add("性别错误");
        }
        if (!(teacher.getEmail().matches("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\.]+"))) {
            errors.add("邮箱格式错误");
        }
        return errors;
    }

    @Transactional
    public void addTeacher(Teacher teacher) {
        this.teacherDao.addTeacher(teacher);
//        this.teacherCopyDao.addTeacher(teacher);
        Integer count = this.teacherDao.getCountTeachers();

    }

    public void deleteTeacherById(Long uid) {
        this.teacherDao.deleteTeacherById(uid);
        Integer count = this.teacherDao.getCountTeachers();
    }

    public void updateTeacher(Teacher teacher) {
        this.teacherDao.updateTeacher(teacher);
    }

    public List<Teacher> findTeacherByName(String name) {
        return this.teacherDao.findTeacherByName(name);
    }

    public Integer deleteTeachersByIds(Integer[] ids) {
        return this.teacherDao.deleteTeachersByIds(ids);
    }

}
