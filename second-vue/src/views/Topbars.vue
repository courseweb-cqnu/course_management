<template>
  <div class="header">
    <div class="logo">
<!--      <el-image-->
<!--          style="width: 50px;height: 50px"-->
<!--          :src="url_p2"-->
<!--      ></el-image>-->
      <h1>重师精品课</h1>
    </div>
    <el-menu
        :default-active="$route.path"
        class="el-menu-nav"
        mode="horizontal"

        @select="handleSelect"
        background-color="#FF4040"
        text-color="#fff"
        active-text-color="#ffd04b"
        router
    >
      <el-menu-item index="/main/course">
        <el-badge value="admin" class="item" type="warning">课程管理</el-badge>
      </el-menu-item>
      <el-menu-item index="/main/home">
        <el-badge value="admin" class="item" type="warning">学生管理</el-badge>
      </el-menu-item>
      <el-submenu index="/main/menu">
        <template slot="title">目录</template>
        <el-menu-item index="/main/home">返回课程管理</el-menu-item>
        <el-menu-item index="/main/home">返回学生管理</el-menu-item>
        <el-menu-item index="/">退出系统</el-menu-item>
      </el-submenu>
    </el-menu>
    <div class="line"></div>
  </div>
</template>

<script>
export default {
  data() {
    return{
      name:"topbars",
      url_p2:''
    }
  }
}
</script>

<style lang="less" scoped>
body {
  .header {
    position: relative;
    .el-menu {
      width:1920px;
    }

    .logo {
      position: absolute;
      z-index: 700;
      left: 2em;
      top: 0.7em;
      h1 {
        display: inline;
        vertical-align: center;
        color: wheat;
        font-size: 1.7em;
        font-weight: 300;
        font-family: "Courier New", Courier, monospace;
      }
      //img {
      //  height: 0.1em;
      //  width: 2.2em;
      //  vertical-align: bottom;
      //}
    }
    .el-menu-nav {
      li {
        float: right;
        size: 10px;
        padding-right: 1em;
        right: 0.5em;

      }
    }
  }
}
</style>
