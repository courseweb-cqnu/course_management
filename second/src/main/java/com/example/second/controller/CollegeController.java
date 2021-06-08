package com.example.second.controller;


import com.example.second.entity.College;
import com.example.second.service.MenuService;
import com.example.second.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/college")
@CrossOrigin(allowCredentials = "true")
public class CollegeController {

    @Autowired
    private CollegeService collegeService;

    @Autowired
    MenuService menuService;

    /**
     * 查询所有学生
     */
    @GetMapping("/findAllColleges")
    public List<College> findAllColleges() {
        return this.collegeService.findAllColleges();
    }

    /**
     * 增加学生
     */
    @PostMapping("/addCollege")
    public void addCollege(@RequestBody College college) {
        this.collegeService.addCollege(college);
    }

    /**
     * 根据学生id删除学生
     */
    @PostMapping("/deleteCollege")
    public void deleteCollegeById(@RequestParam Long uid) {
        this.collegeService.deleteCollegeById(uid);
    }

    /**
     * 编辑学生
     */
    @PostMapping("/updateCollege")
    public void updateCollege(@RequestBody College college) {
        this.collegeService.updateCollege(college);
    }

    /**
     * 根据学生姓名查找学生
     */
    @GetMapping("/findCollegeByName")
    public List<College> findCollegeByName(@RequestParam String name) {
        return this.collegeService.findCollegeByName(name);
    }

    /**
     * 批量删除学生
     */
    @PostMapping("/deleteCollegesByIds")
    public Integer deleteCollegesByIds(Integer[] ids) {
        return this.collegeService.deleteCollegesByIds(ids);
    }
}
