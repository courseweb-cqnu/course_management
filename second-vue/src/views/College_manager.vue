<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="collegeName" placeholder="请输入学院名称" style="width:80%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchCollegeByName">搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog">新增学院</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="colleges"
              border>
        <el-table-column
                type="selection"
                width="55">
        </el-table-column>
        <el-table-column
                prop="id"
                label="学院编号"
                width="180">
        </el-table-column>
        <el-table-column
                prop="name"
                label="名称"
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteColleges">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center>
      <el-form :model="form" :rules="rules" ref="college">
        <el-form-item label="名称" :label-width="formLabelWidth" prop="name">
          <el-input v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitCollege">确 定</el-button>
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
      collegeName: '',
      multipleSelection:[],
      dialogTitle: {
        addCollege: "新增学院",
        editCollege: "编辑学院"
      },
      dialogStatus: "",
      rules: {
        name: [
          { required: true, message: '请输入名称', trigger: 'blur' }
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
      colleges:[],
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        age: '',
        sex: ''
      },
      formLabelWidth: '120px',
    }
  },
  created() {
    this.findAllColleges();
  },
  watch:{
    collegeName () {
        this.findAllColleges();
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
    searchCollegeByName () {
        if (this.collegeName !== '') {
            this.$axios.get("/college/findCollegeByName?name="+this.collegeName).then( (resp)=> {
                this.colleges = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteColleges () {
      this.$confirm('此操作将永久删除学院, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/college/deleteCollegesByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllColleges();
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
    submitCollege () {
      if (this.dialogStatus === 'addCollege'){
        this.addCollege();
      } else if(this.dialogStatus === "editCollege") {
        this.editCollege();
      }
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
    handleEdit (row) {
      this.dialogFormVisible = true;
      this.dialogStatus = "editCollege";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.age = row.age;
      this.form.sex = row.sex;
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该学院, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/college/deleteCollege?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllColleges();
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    showDialog () {
      this.form.uid = '';
      this.form.name = '';
      this.form.age = '';
      this.form.sex = '';
      this.dialogFormVisible = true;
      this.dialogStatus = "addCollege";
    },
    addCollege () {
      this.$refs.college.validate((valid) => {
        if (valid) {
          this.$axios.post("/college/addCollege",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllColleges();
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
    editCollege () {
      this.$axios.post("/college/updateCollege",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllColleges();
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
