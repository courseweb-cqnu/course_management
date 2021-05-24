package com.example.second.service.impl;


import com.example.second.dao.ContentDao;
import com.example.second.entity.Content;
import com.example.second.service.ContentService;
// import jdk.nashorn.internal.objects.annotations.Property;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
//@Transactional(rollbackFor = Exception.class)
public class ContentServiceBean implements ContentService {

    @Autowired
    private ContentDao contentDao;



    public List<Content> findAllContents() {
        return this.contentDao.findAllContents();
    }


    @Transactional
    public void addContent(Content content) {
        this.contentDao.addContent(content);
//        this.contentCopyDao.addContent(content);
        Integer count = this.contentDao.getCountContents();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
        //int x = 5 / 0;
    }

    public void deleteContentById(Long uid) {
        this.contentDao.deleteContentById(uid);
        Integer count = this.contentDao.getCountContents();
    }

    public void updateContent(Content content) {
        this.contentDao.updateContent(content);
    }

    public List<Content> findContentByName(String name) {
        return this.contentDao.findContentByName(name);
    }

    public Integer deleteContentsByIds(Integer[] ids) {
        return this.contentDao.deleteContentsByIds(ids);
    }

}
