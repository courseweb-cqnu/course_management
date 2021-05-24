<template>
  <div>
    <el-menu
      class="el-menu-demo"
      :default-active="this.$route.path"
      router
      mode="horizontal"
      @open="handleOpen"
      @close="handleClose"
      active-text-color="#DC143C"
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
        :index="item.pattern"
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
    <router-view></router-view>
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
      colleges:[],
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
    findAllColleges () {
      this.$axios.get("/college/findAllColleges")
              .then((res) => {
                this.colleges = res.data
              })
              .catch(error => {
                this.$message({
                  type: 'error',
                  message: "查询失败，原因是"+error.data.message
                });
              });
    },
  },
};
</script>
<style>
.menu-top {
  margin-top: 200px;
}
</style>