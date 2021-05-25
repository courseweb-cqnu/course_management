<template>
  <div>
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
              fit="contain"
              style="height: 300px"
            ></el-image>
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>
    <!-- <router-view></router-view> -->
    <div>
      <div class="course_container">
        <div class="sub_course_container">
          <el-row
            :gutter="100"
            class="el-row"
          >
            <el-col
              :span="6"
              v-for="(item, index) in courses"
              :key="index"
            >
              <el-card :body-style="{padding: '0px'}">
                <img
                  src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                  class="image"
                >
                <div style="padding: 14px;">
                  <span>{{item.name}}</span>
                  <div class="bottom clearfix">
                    <el-button
                      type="text"
                      class="button"
                      @click="c"
                    >操作按钮</el-button>
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
        "https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg",
        "https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg",
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
        { name: "Computer Science", teacher: "xcy" },
        { name: "Computer Science", teacher: "xcy" },
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
.el-col {
  /* border-radius: 4px; */
  align-items: stretch;
  margin-bottom: 40px;
}
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  padding: 0;
  float: right;
}

.image {
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
.course_container {
  width: 100%;
  height: 630px;
}
.sub_course_container {
  width: 80%;
  height: 630px;
  background-color: white;
  margin-left: 150px;
  margin-right: 150px;
}
.course_image {
  width: 100%;
  display: block;
  /* width: 260px;
  height: 280px; */
}
.course_card {
  width: 260px;
  height: 310px;
  margin-right: 85px;
  margin-top: 5px;
}
.course_card2 {
  width: 260px;
  height: 310px;
  margin-right: 170px;
  margin-top: 5px;
}
</style>