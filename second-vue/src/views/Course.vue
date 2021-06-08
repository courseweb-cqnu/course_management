<template>
  <el-container>
    <div class="header_cou">
      <div class="logo_cou">
        <h3>重师精品课
          <el-divider direction="vertical"></el-divider>
        </h3>
      </div>
      <div class="main_menu_cou">
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
      <div class="search_cou">
        <el-input
            placeholder="请输入课程或者老师名称" prefix-icon="el-icon-search" v-model="searching">
        </el-input>
      </div>
      <div class="right_menu_cou">
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
.header_cou{
  width: 1950px;
  background-color: #FF4040;
  color: white;
}
.logo_cou{
  float: left;
  width: 160px;
  letter-spacing: 5px;
  font-size: large;
  margin-left: 150px;
}
.main_menu_cou{
  float: left;
  width: 68px;
  margin-left: 20px;
}
.search_cou{
  float: left;
  padding-top: 1em;
  width: 200px;
  margin-left: 500px;
}
.right_menu_cou{
  float: left;
  width: 200px;
  margin-left: 500px;
}

</style>
