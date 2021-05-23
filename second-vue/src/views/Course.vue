<template>
  <el-container>
    <div class="header">
      <div class="logo">
        <h3>重师精品课
          <el-divider direction="vertical"></el-divider>
        </h3>
      </div>
      <div class="main_menu">
        <el-menu
            :default-active="$route.path"
            class="el-menu-nav"
            mode="horizontal"
            background-color="#FF4040"
            text-color="#fff"
            active-text-color="#ffd04b"
            router
        >
          <el-menu-item index="/main">首页</el-menu-item>
        </el-menu>
      </div>
      <div class="search">
        <el-input
            placeholder="请输入课程或者老师名称" prefix-icon="el-icon-search" v-model="searching">
        </el-input>
      </div>
      <div class="right_menu">
        <el-menu
            :default-active="$route.path"
            class="el-menu-nav"
            mode="horizontal"
            background-color="#FF4040"
            text-color="#fff"
            active-text-color="#ffd04b"
            router
        >
          <el-menu-item index="/main/home">后台管理</el-menu-item>
          <el-menu-item index="/main/course">退出系统</el-menu-item>
        </el-menu>
      </div>
    </div>
  </el-container>
</template>

<script>
export default {
  data() {
    return {
      searching: ''
    }
  }
}
</script>

<style>
.header{
  width: 1950px;
  background-color: #FF4040;
  color: white;
}
.logo{
  float: left;
  width: 160px;
  letter-spacing: 5px;
  font-size: large;
  margin-left: 150px;
}
.main_menu{
  float: left;
  width: 68px;
  margin-left: 20px;
}
.search{
  float: left;
  padding-top: 1em;
  width: 200px;
  margin-left: 500px;
}
.right_menu{
  float: left;
  width: 200px;
  margin-left: 500px;
}

</style>
