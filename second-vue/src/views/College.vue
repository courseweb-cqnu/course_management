<template>
  <div>
    <el-container class="container_c">
      <div class="header_c">
        <div class="logo_c">
          <h3>重师精品课
            <el-divider direction="vertical"></el-divider>
          </h3>
        </div>
        <div class="main_menu_c">
          <el-menu
            :default-active="$route.path"
            class="main_menu_c"
            mode="horizontal"
            background-color="#FF4040"
            text-color="#fff"
            active-text-color="	#696969"
            router
          >
            <el-menu-item
              index="/main"
              style="font-size: small"
            >首页</el-menu-item>
          </el-menu>
        </div>
        <div class="search_c">
          <el-input
            placeholder="请输入课程或者老师名称"
            prefix-icon="el-icon-search"
            v-model="searching"
          >
          </el-input>
        </div>
        <div class="right_menu_c">
          <el-menu
            :default-active="$route.path"
            class="el-menu-nav"
            mode="horizontal"
            background-color="#FF4040"
            text-color="#fff"
            active-text-color="#ffd04b"
            router
          >
            <el-menu-item
              index="/main/home"
              style="color: white; font-size: small"
            >后台管理</el-menu-item>
            <el-menu-item
              index="/"
              style="font-size: small"
            >退出系统</el-menu-item>
          </el-menu>
        </div>
      </div>
    </el-container>
    <el-menu
      class="el-menu-demo"
      :default-active="this.$route.path"
      mode="horizontal"
      @open="handleOpen"
      @close="handleClose"
      active-text-color="#DC143C"
      @select="reload"
    >
      <!-- <el-menu-item index="1" >文学院</el-menu-item>
      <el-menu-item index="2">数学科学学院</el-menu-item>
      <el-menu-item index="3">音乐学院</el-menu-item>
      <el-menu-item index="4">生命科学学院</el-menu-item>
      <el-menu-item index="5">地理与旅游学院</el-menu-item>
      <el-menu-item index="6">化学学院</el-menu-item>
      <el-menu-item index="7">外国语学院</el-menu-item> -->
      <el-menu-item
        v-for="(item,i) in colleges"
        :key="i"
        :index="item.name"
      >
        <template slot="title">
          <span> {{ item.name }}</span>
        </template>

      </el-menu-item>
    </el-menu>
    <div>
      <el-carousel indicator-position="outside">
        <el-carousel-item
          v-for="item in src"
          :key="item"
        >
          <div class="block">
            <el-image
              :src="item"
              fit="fill"
              style="height: 300px; width:100%"
            ></el-image>
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>
    <!-- <router-view></router-view> -->
    <el-divider
      content-position="left"
      style="font-size:100px"
    >学院课程</el-divider>
    <div>
      <div class="course_container_c">
        <div class="sub_course_container_c">
          <el-row
            gutter="70"
            class="el-row"
          >
            <el-col
              :span="6"
              v-for="(item, index) in courses"
              :key="index"
            >
              <el-card :body-style="{padding: '0px'}" class="card_c">
                <img
                  :src="item.image"
                  class="image_c"
                >
                <div style="padding: 14px;">
                  <span>{{item.name}}</span>
                  <div class="bottom clearfix">
                    <el-button
                      type="text"
                      class="button"
                      @click="c"
                    >课程详情</el-button>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </div>
      </div>

    </div>
  </div>
</template>

<script>
export default {
  name: "College",
  components: {},
  data() {
    return {
      src: [
        'https://img0.baidu.com/it/u=921356931,592195905&fm=26&fmt=auto&gp=0.jpg',
        "https://img1.baidu.com/it/u=2481857905,3837195964&fm=26&fmt=auto&gp=0.jpg",
        "https://www.cqnu.edu.cn/images/banner11.jpg",
      ],
      //   navList: [
      //     { name: "/literature", navItem: "文学院" },
      //     // {name:'/components/Literature',navItem:'数学科学学院'},
      //     // {name:'/components/Literature',navItem:'音乐学院'},
      //     // {name:'/components/Literature',navItem:'生命科学学院'},
      //     // {name:'/components/Literature',navItem:'地理与旅游学院'},
      //     // {name:'/components/Literature',navItem:'化学学院'},
      //     // {name:'/components/Literature',navItem:'外国语学院'},
      //   ],
      colleges: [],
      courses: [
        { name: "Computer Science", teacher: "xcy" , image: "https://img0.baidu.com/it/u=1833636327,1532683158&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img0.baidu.com/it/u=3344707173,3015676222&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img0.baidu.com/it/u=4259926672,1520544321&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img2.baidu.com/it/u=734695632,1224698756&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img1.baidu.com/it/u=2543000902,3462352363&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img2.baidu.com/it/u=450267319,2106900508&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img2.baidu.com/it/u=150723695,728383380&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img1.baidu.com/it/u=4018728060,3332512352&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img2.baidu.com/it/u=3432723299,1272092050&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img1.baidu.com/it/u=897133358,1940136062&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img2.baidu.com/it/u=397553363,3685779531&fm=224&fmt=auto&gp=0.jpg"},
        { name: "Computer Science", teacher: "xcy" , image: "https://img1.baidu.com/it/u=476692959,2474494726&fm=224&fmt=auto&gp=0.jpg"},
      ],
    };
  },
  created() {
    this.findAllColleges();
  },
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    findAllColleges() {
      this.$axios
        .get("/college/findAllColleges")
        .then((res) => {
          this.colleges = res.data;
        })
        .catch((error) => {
          this.$message({
            type: "error",
            message: "查询失败，原因是" + error.data.message,
          });
        });
    },
    reload(index, indexPath) {
      if (index == "文学院") this.courses = [];
      else if (index == "数学科学学院")
        this.courses = [
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcy" },
          { name: "Computer Science", teacher: "xcc" },
          { name: "Computer Scien", teacher: "xcy" },
        ];
      else if (index == "化学学院") {
      } else if (index == "旅游学院") {
      } else if (index == "计算机与信息科学学院") {
      } else if (index == "物理与电子工程学院") {
      }
    },
  },
};
</script>
<style>
.menu-top {
  margin-top: 200px;
}
.el-card:hover {
  margin-top: -5px;
}
.el-row {
  margin-bottom: 20px;
  display: flex;
  flex-wrap: wrap;
}
.bottom {
  margin-top: 13px;
  line-height: 12px;
}
.button {
  padding: 0;
  float: right;
}
.image_c {
  width: 100%;
  display: block;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}
.course_container_c {
  width: 100%;
  height: 630px;
}
.sub_course_container_c {
  width: 80%;
  height: 630px;
  background-color: white;
  margin-left: 150px;
  margin-right: 150px;
}
.header_c {
  float: top;
  width: 100%;
  background-color: #ff4040;
  color: white;
}
.logo_c {
  float: left;
  width: 160px;
  letter-spacing: 5px;
  font-size: large;
  margin-left: 12.5%;
}
.main_menu_c {
  float: left;
  width: 71px;
  margin-left: 20px;
}
.search_c {
  float: left;
  padding-top: 1em;
  width: 200px;
  margin-left: 41%;
}
.right_menu_c {
  float: left;
  width: 220px;
  margin-left: 1%;
}
.container_c {
  display: flex;
  flex-direction: column;
  /* src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" */
}
.card_c{
  /* width: 260px;
  height: 320px; */
  /* margin-right: 85px; */
  margin-top: 25px;
}

</style>