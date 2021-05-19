<template>
  <div id="course">
    <el-main>
      <topbars></topbars>
      <transition mode="out-in" name="el-fade-in-linear">
        <router-view></router-view>
      </transition>
      <el-timeline-item placement="top">
        <el-card>
          <h4>课程查询</h4>
          <el-input placeholder="请输入课程名" class="searchName">
            <!-- <el-button slot="append" type="primary" icon="el-icon-search">搜索</el-button> -->
          </el-input>
          <el-button type="primary" icon="el-icon-search" round>搜索</el-button>
        </el-card>
      </el-timeline-item>
    </el-main>
  </div>
</template>

<script>
import Topbars from "@/views/Topbars";
export default {
  name: "Course",
  data() {
    return {
      activeIndex: "1"
    };
  },
  methods: {
    handleSelect (key, keyPath) {
      console.log(key, keyPath);
    }
  },
  components: {
    Topbars
  }
};
</script>

<style lang="less" scoped>
html,
body {
  margin: 0 !important;
  padding: 0;
  .transition-box {
    margin-bottom: 10px;
    width: 130px;
    height: 100px;
    border-radius: 4px;
    background-color: gray;

    text-align: center;
    color: #fff;
    padding: 40px 20px;
    box-sizing: border-box;
    margin-right: 20px;
  }
  .header {
    position: relative;
    .el-menu-nav {
      padding-right: 5%;
      li {
        float: right;
      }
    }
    .logo {
      position: absolute;
      z-index: 999;
      left: 0;
      top: 0;
      //
      h1 {
        display: inline;
        font-size: 1.5em;
        font-family: "Courier New", Courier, monospace;
      }
    }
  }
  .el-zoom-in-center-enter-active {
    transition: all 0.1s;
  }
}
.el-main {
  background-image: url("~@/image/pc1.jpg");
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  min-width: 1000px;
  z-index: -10;
  zoom: 0.97;
  background-color: rgba(0, 0, 0, 0.5);
  background-repeat: repeat;
  background-size: cover;
  -webkit-background-size: cover;
  -o-background-size: cover;
  background-position: center 0;
}
</style>