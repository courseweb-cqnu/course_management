import Vue from 'vue'
import VueRouter from 'vue-router'
import Student from '../views/Student'
import Teacher from '../views/Teacher'
import Home from '../views/Home'
import Login from '../views/Login'
import Main from "@/views/Main";
import Score from "@/views/Score";
import Course from "@/views/Course";

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Login',
    component: Login,
    hidden: true
  },
  {
    path: '/main',
    name: 'Main',
    component: Main,
    hidden: true
  },
  {
    path: '/main/course',
    name: 'Course',
    component: Course,
    hidden: true
  },
  {
    path: '/main/home',
    name: 'Home',
    component: Home,
    hidden: true
  },
  {
    path: '/home',
    name: '导航一',
    component: Home,
    children:[
      {
        path: '/student',
        name: '管理学生',
        component: Student
      },
      {
        path: '/teacher',
        name: '教师学生',
        component: Teacher
      }
    ]
  }
]

const router = new VueRouter({
  routes
})

export default router
