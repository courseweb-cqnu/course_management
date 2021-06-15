<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="courseName" placeholder="请输入课程姓名" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchCourseByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增课程</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="courses"
              border>
        <el-table-column
                type="selection"
                width="55">
        </el-table-column>
        <el-table-column
                prop="id"
                label="编号"
                width="180">
        </el-table-column>
        <el-table-column
                prop="name"
                label="名称"
                width="180">
        </el-table-column>
        <el-table-column
                prop="teacher"
                label="教师"
                width="180">
        </el-table-column>
        <el-table-column
                prop="imageUrl"
                label="图片路径"
                width="180">
        </el-table-column>
        <el-table-column
                prop="collegeId"
                label="所属学院ID"
                width="180">
        </el-table-column>
        <el-table-column
                label="操作">
                align="left">
          <template slot-scope="scope">
            <el-button
                    size="mini"
                    @click="handleEdit(scope.row)">编辑</el-button>
            <el-button
                    size="mini"
                    type="danger"
                    @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteCourses">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="course">
        <el-form-item label="名称" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="教师" :label-width="formLabelWidth" prop="teacher">
          <el-input v-model="form.teacher" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="图片路径" :label-width="formLabelWidth" prop="imageUrl">
          <el-input v-model="form.imageUrl" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="学院ID" :label-width="formLabelWidth" prop="collegeId">
          <el-input v-model="form.collegeId" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitCourse">确 定</el-button>
      </div>
    </el-dialog>
    <el-upload
            style="margin-top:20px;"
            action="/upload"
            multiple
            :on-success="handleSuccess"
            :limit="3"
            :file-list="fileList">
      <el-button size="small" type="primary">点击上传</el-button>
    </el-upload>
  </div>
</template>

<script>
// @ is an alias to /src


export default {
  name: 'Home',
  components: {
  },
  data () {
    return {
      fileList: [],
      courseName: '',
      multipleSelection:[],
      dialogTitle: {
        addCourse: "新增课程",
        editCourse: "编辑课程"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入姓名', trigger: 'blur' }
        ],
        sex: [
          { required: true, message: '请选择性别', trigger: 'change' }
        ],
        age: [
          { required: true, message: '年龄不能为空'},
          { type: 'number', message: '年龄必须为数字值'}
        ]
      },
      options: [{
        value: '1',
        label: '男'
      }, {
        value: '2',
        label: '女'
      }],
      msg: '',
      courses:[],
      search: '',
      dialogFormVisible: false,
      form: {
        id: '',
        name: '',
        teacher: '',
        imageUrl: '',
        collegeId: ''
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllCourses();
  },
  watch:{
    courseName () {
        this.findAllCourses();
    }
  },
  methods: {
    // deleteFile (file) {
    //   console.log(file)
    // },
    handleSuccess (file) {
      const filename = file.name;
      this.$message({
        message: '文件上传成功！',
        type: 'success'
      });
    },
    searchCourseByName () {
        if (this.courseName !== '') {
            this.$axios.get("/course/findCourseByName?name="+this.courseName).then( (resp)=> {
                this.courses = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteCourses () {
      this.$confirm('此操作将永久删除课程, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/course/deleteCoursesByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllCourses();
            this.$message.success("删除成功！");
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
      console.log(val)
    },
    submitCourse () {
      if (this.dialogStatus === 'addCourse'){
        this.addCourse();
      } else if(this.dialogStatus === "editCourse") {
        this.editCourse();
      }
    },
    findAllCourses () {
      this.$axios.get("/course/findAllCourses")
              .then((res) => {
                this.courses = res.data
              })
              .catch(error => {
                this.$message({
                  type: 'error',
                  message: "查询失败，原因是"+error.data.message
                });
              });
    },
    handleEdit (row) {
      this.dialogFormVisible = true;
      this.dialogStatus = "editCourse";
      this.form.id = row.id;
      this.form.name = row.name;
      this.form.teacher = row.teacher;
      this.form.collegeId = row.collegeId;
      this.form.imageUrl = row.imageUrl;
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该课程, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/course/deleteCourse?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllCourses();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    showDialog () {
      this.form.id = '';
      this.form.name = '';
      this.form.teacher = '';
      this.form.imageUrl = '';
      this.form.collegeId = '';
      this.dialogFormVisible = true;
      this.dialogStatus = "addCourse";
    },
    addCourse () {
      this.$refs.course.validate((valid) => {
        if (valid) {
          this.$axios.post("/course/addCourse",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllCourses();
            }
          }).catch((error)=>{
            this.$message({
              message: '添加数据失败，原因是'+error.data.message,
              type: 'error'
            })
          })
        } else {
          this.$message({
            message: '请输入所有字段',
            type: 'error'
          })
          return false;
        }
      });
    },
    editCourse () {
      this.$axios.post("/course/updateCourse",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllCourses();
      }).catch( (error)=> {
        this.$message({
          message: '数据更新失败，原因是'+error.data.message,
          type: 'error'
        })
      })
    }
  }
}
</script>
<style scoped>
  .table {
    margin: 0 auto;
    clear: both;
  }
</style>
