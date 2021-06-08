<template>
  <el-container>
    <section class="container">
        <div class="main_header">
          <div class="logo">
            <h3>重师精品课
              <el-divider direction="vertical"></el-divider>
            </h3>
          </div>
        </div>
        <el-form :model="loginForm"  :rules="rules" ref="userForm" class="login">
            <h3 class="header-title" style="color:dimgray;font-size: x-large" >课程管理系统登录 </h3>
            <el-form-item prop="username">
                <el-input type="text" v-model="loginForm.username" placeholder="请输入用户名" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item prop="password">
                <el-input type="password" v-model="loginForm.password" autocomplete="off" placeholder="请输入密码" @keydown.enter.native="submit"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button class="el-button" type="danger" style="width: 100%;font-size: large" @click="submit">登录</el-button>
            </el-form-item>
        </el-form>
    </section>
  </el-container>
</template>

<script>
    import {postKeyValueRequest} from "../config/interceptor";

    export default {
        name: "Login",
        data () {
            return {
                rules: {
                    username: [{ required: true, message: '请输入用户名', trigger: 'blur' },],
                    password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
                },
                loginForm: {
                    username: "admin",
                    password: "123456"
                }
            }
        },
        methods: {
            submit() {
                this.$refs.userForm.validate((valid) => {
                    if (valid) {
                        postKeyValueRequest("/doLogin",this.loginForm).then( (res)=> {
                            if(res.data.obj !=null) {
                                window.sessionStorage.setItem("user",JSON.stringify(res.data.obj))
                                let path = this.$route.query.redirect;
                                this.$router.replace((path === '/'||path === undefined)?"/main":path)
                            }
                        })
                    } else {
                            this.$message({
                                message: '请输入所有字段',
                                type: 'error'
                            });
                            return false
                    }
                });
            },
        }
    }
</script>

<style scoped>

    .container{
      display: flex;
      flex-direction: column;
      background-color: #F5F5F5;
      /*width: 1930px;*/
      width: 100%;
      height: 935px;

    }
    .main_header{
      width: 1930px;
      height: 70px;
      background-color: #FF4040;
    }
    .header-title{
        text-align: center;
        color: #505458
    }
    .logo{
      color: white;
      float: left;
      width: 160px;
      letter-spacing: 5px;
      font-size: large;
      margin-left: 12%;
    }
    .login {

        /*background-image: url("~@/image/pc1.jpg");*/
        width: 380px;
        height: 400px;
        border-radius: 15px;
        background-clip: padding-box;
        background-color: white;
        margin: 150px auto;
        padding: 35px 35px 15px 35px;
        border: 1px solid #eaeaea;
        /*水平位置 垂直位置 阴影大小 阴影颜色*/
        box-shadow: 0 0 25px #cac6c6;
    }
    .el-button{
      /*color: #FF4040;*/
    }
</style>
