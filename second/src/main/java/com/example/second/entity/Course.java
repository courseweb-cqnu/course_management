package com.example.second.entity;

public class Course {

    private Integer id;

    private String teacher;

    private String name;
    
    private String imageUrl;

    private Integer collegeId;

    public Integer getId() {
        return id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getName() {
        return name;
    }

    public String getTeacher() {
        return teacher;
    }

    public Integer getCollegeId() {
        return collegeId;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public void setCollegeId(Integer collegeId) {
        this.collegeId = collegeId;
    }
}
