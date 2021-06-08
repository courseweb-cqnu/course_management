<template>
  <el-container class="main_container">
   <section class="container">
    <div class="header">
      <div class="logo">
        <h3>重师精品课
        <el-divider direction="vertical"></el-divider>
        </h3>
      </div>
      <div class="main_menu1">
        <el-menu
            :default-active="$route.path"
            class="main_menu1"
            mode="horizontal"
            background-color="#FF4040"
            text-color="#fff"
            active-text-color="	#696969"
            router
        >
          <el-menu-item index="/main/college" style="font-size: small" >学院课程</el-menu-item>
        </el-menu>
      </div>
      <div class="search">
        <el-input
            placeholder="请输入课程或者老师名称" prefix-icon="el-icon-search" v-model="searching">
        </el-input>
      </div>
      <div class="right_menu1">
        <el-menu
          :default-active="$route.path"
          class="el-menu-nav"
          mode="horizontal"
          background-color="#FF4040"
          text-color="#fff"
          active-text-color="#ffd04b"
          router
        >
          <el-menu-item index="/main/home" style="color: white; font-size: small" >后台管理</el-menu-item>
          <el-menu-item index="/" style="font-size: small">退出系统</el-menu-item>
        </el-menu>
      </div>
    </div>


   <div class="sec_header">
     <div class="sub_sec_header">
      <el-menu
          :default-active="$route.path"
          class="el-menu-nav-sec"
          mode="horizontal"

          background-color="#F5F5F5"
          text-color="dimgrey"
          active-text-color="#FF4040"
          router
      >
        <el-submenu  class="submenu"  index="/main/course">
          <template slot="title">计算计与信息科学学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/shuxue">
          <template slot="title">数学科学学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/meishu">
          <template slot="title">美术学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/wuli">
          <template slot="title">物电学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/yinyue">
          <template slot="title">音乐学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/jiaoyu">
          <template slot="title">教育学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/dilv">
          <template slot="title">地理与旅游学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/tiyu">
          <template slot="title">体育学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/xinwen">
          <template slot="title">新闻与传媒学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/waiguoyu">
          <template slot="title">外国语学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main/huaxue">
          <template slot="title">化学学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
        <el-submenu  class="submenu"  index="/main、jingguan">
          <template slot="title">经济与管理学院</template>
          <el-menu-item index="/main/course">操作系统</el-menu-item>
          <el-menu-item index="/main/course">软件工程导论</el-menu-item>
          <el-menu-item index="/main/course">计算机网络</el-menu-item>
          <el-menu-item index="/main/course">数据库系统概论</el-menu-item>
          <el-menu-item index="/main/course">C++高级编程</el-menu-item>
          <el-menu-item index="/main/course">高等数学</el-menu-item>
          <el-menu-item index="/main/course">计算机科学概论</el-menu-item>
        </el-submenu>
      </el-menu>
     </div>
   </div>


   <div class="cards">
     <el-carousel height="310px">
       <el-carousel-item v-for="item in imagebox" :key="item.id">
         <img :src="item.idView" class="image">
       </el-carousel-item>
     </el-carousel>
   </div>

     <div class="text1">
       <div class="sub_text1">
         <h3>热门课程</h3>
       </div>
     </div>


     <div class="course_container">

      <div class="sub_course_container">

        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc7.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc8.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc16.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc9.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc10.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
      </div>


      <div class="sub_course_container1">
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc11.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc12.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc13.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc14.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
        <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
          <el-card :body-style="{ padding: '0px' }" class="course_card">
            <img src="../image/pc15.jpg" class="course_image" @click="$router.push('/main/course')"/>
            <span style="float: left ;margin-left: 20px">软件测试</span>
            <span style="float: right ;margin-right: 20px">冯骥</span>
          </el-card>
        </el-col>
      </div>
     </div>




     <div class="text2">
       <div class="sub_text2">
         <h3>推荐课程</h3>
       </div>
     </div>


     <div class="course_container2">

       <div class="sub_course_container2">

         <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
           <el-card :body-style="{ padding: '0px' }" class="course_card2">
             <img src="../image/pc7.jpg" class="course_image" @click="$router.push('/main/course')"/>
             <span style="float: left ;margin-left: 20px">软件测试</span>
             <span style="float: right ;margin-right: 20px">冯骥</span>
           </el-card>
         </el-col>
         <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
           <el-card :body-style="{ padding: '0px' }" class="course_card2">
             <img src="../image/pc8.jpg" class="course_image" @click="$router.push('/main/course')"/>
             <span style="float: left ;margin-left: 20px">软件测试</span>
             <span style="float: right ;margin-right: 20px">冯骥</span>
           </el-card>
         </el-col>
         <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
           <el-card :body-style="{ padding: '0px' }" class="course_card2">
             <img src="../image/pc16.jpg" class="course_image" @click="$router.push('/main/course')"/>
             <span style="float: left ;margin-left: 20px">软件测试</span>
             <span style="float: right ;margin-right: 20px">冯骥</span>
           </el-card>
         </el-col>
         <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
           <el-card :body-style="{ padding: '0px' }" class="course_card2">
             <img src="../image/pc9.jpg" class="course_image" @click="$router.push('/main/course')"/>
             <span style="float: left ;margin-left: 20px">软件测试</span>
             <span style="float: right ;margin-right: 20px">冯骥</span>
           </el-card>
         </el-col>
       </div>


       <div class="sub_course_container3">
         <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
           <el-card :body-style="{ padding: '0px' }" class="course_card2">
             <img src="../image/pc10.jpg" class="course_image" @click="$router.push('/main/course')"/>
             <span style="float: left ;margin-left: 20px">软件测试</span>
             <span style="float: right ;margin-right: 20px">冯骥</span>
           </el-card>
         </el-col>
         <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
           <el-card :body-style="{ padding: '0px' }" class="course_card2">
             <img src="../image/pc11.jpg" class="course_image" @click="$router.push('/main/course')"/>
             <span style="float: left ;margin-left: 20px">软件测试</span>
             <span style="float: right ;margin-right: 20px">冯骥</span>
           </el-card>
         </el-col>
         <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
           <el-card :body-style="{ padding: '0px' }" class="course_card2">
             <img src="../image/pc12.jpg" class="course_image" @click="$router.push('/main/course')"/>
             <span style="float: left ;margin-left: 20px">软件测试</span>
             <span style="float: right ;margin-right: 20px">冯骥</span>
           </el-card>
         </el-col>
         <el-col :span="2.4" v-for="(o, index) in 1" :key="o" :offset="index > 0 ? 2 : 0">
           <el-card :body-style="{ padding: '0px' }" class="course_card2">
             <img src="../image/pc13.jpg" class="course_image" @click="$router.push('/main/course')"/>
             <span style="float: left ;margin-left: 20px">软件测试</span>
             <span style="float: right ;margin-right: 20px">冯骥</span>
           </el-card>
         </el-col>
       </div>

     </div>




   </section>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      searching: '',

      imagebox:[{id:0,idView:require('../image/pc3.jpg')},
        {id:1,idView:require('../image/pc4.jpg')},
        {id:2,idView:require('../image/pc5.jpg')},
        {id:3,idView:require('../image/pc6.jpg')}
        //imagebox是assets下一个放图片的文件夹
      ],

    }
  }
}
</script>

<style>
.container{
  display: flex;
  flex-direction: column;
}
.header{
  float: top;
  width: 100%;
  background-color: #ff4040;
  color: white;
}
.sec_header{
  float: left;
  background-color:#F5F5F5;
  /*width: 1950px;*/
  width: 100%;
}
.sub_sec_header{
  float: left;
  /*width: 1800px;*/
  width: 100%;
  margin-left: 150px;
}
.submenu{
  background-color: #FF4500;
}
.logo{
  float: left;
  width: 160px;
  letter-spacing: 5px;
  font-size: large;
  margin-left: 12%;
}
.main_menu1{
  float: left;
  width: 92px;
  margin-left: 20px;
}
.search{
  float: left;
  padding-top: 1em;
  width: 200px;
  margin-left: 39%;
}
.right_menu1{
  float: left;
  width: 220px;
  margin-left: 1%;
}
.cards{
  margin-left: 150px;
  margin-right: 150px;
}
.text1{
  width: 1950px;
}
.text2{
  width: 1950px;
}
.sub_text1{
  height: 45px;
  width: 1650px;
  letter-spacing: 5px;
  background-color: white;
  font-size: x-large;
  margin-left: 150px;
  margin-right: 150px;
}
.sub_text2{
  height: 45px;
  width: 1700px;
  letter-spacing: 5px;
  background-color: white;
  color: black;
  font-size: x-large;
  margin-left: 150px;
  margin-right: 150px;
}
.course_container{
  width: 1950px;
  height: 700px;
  background-color: white;
}
.sub_course_container{
  width: 1750px;
  height: 350px;
  background-color: white;
  margin-left: 150px;
  /*margin-right: 150px;*/
}
.sub_course_container1{
  width: 1750px;
  height: 350px;
  background-color: white;
  margin-left: 150px;
  /*margin-right: 150px;*/
}
.course_image{
  width: 260px;
  height: 280px;
}
.course_card{
  width: 260px;
  height: 320px;
  margin-right: 85px;
  margin-top: 25px;
}
.course_card:hover{
  margin-top: -1px;
}

.course_card2{
  width: 260px;
  height: 310px;
  margin-right: 170px;
  margin-top: 25px;
}
.course_card2:hover{
  margin-top: -1px;
}
.course_container2{
  width: 1950px;
  height: 700px;
  background-color: #F5F5F5;
  /*background-color: yellow;*/
  /*background-color: white;*/
}
.sub_course_container2{
  width: 1750px;
  height: 350px;
  background-color: #F5F5F5;
  /*background-color: darkviolet;*/
  /*background-color: white;*/
  margin-left: 200px;
  margin-right: 150px;
}
.sub_course_container3{
  width: 1750px;
  height: 350px;
  background-color: #F5F5F5;
  /*background-color: aqua;*/
  margin-left: 200px;
  margin-right: 150px;
}
</style>
