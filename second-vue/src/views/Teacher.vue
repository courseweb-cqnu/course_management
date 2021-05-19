<template>
  <div>
    <div style="margin-top:50px;">
      <el-input v-model="teacherName" placeholder="请输入教师姓名" style="width:60%" clearable></el-input>
      <el-button type="primary" style="margin-left: 10px;" @click="searchTeacherByName" round>搜索</el-button>
      <el-button type="primary" style="margin-left:10px;margin-bottom: 20px;" @click="showDialog" round>新增教师</el-button>
    </div>
    <div>
      <el-table
              @selection-change="handleSelectionChange"
              :data="teachers"
              border>
        <el-table-column
                type="selection"
                width="55">
        </el-table-column>
        <el-table-column
                prop="uid"
                label="工号"
                width="90">
        </el-table-column>
        <el-table-column
                prop="name"
                label="姓名"
                width="120">
        </el-table-column>
        <el-table-column
                prop="gender"
                label="性别"
                width="120">
        </el-table-column>
        <el-table-column
                prop="age"
                label="年龄"
                width="120">
        </el-table-column>
        <el-table-column
                 prop="tel_number"
                 label="电话"
                 width="120">
        </el-table-column>
        <el-table-column
                 prop="course"
                 label="教授课程"
                 width="120">
        </el-table-column>
        <el-table-column
            prop="edu_background"
            label="学历"
            width="120">
        </el-table-column>
        <el-table-column
                prop="salary"
                label="薪资"
                width="120">
        </el-table-column>
        <el-table-column
                prop="retired"
                label="是否退休"
                width="120">
        </el-table-column>
        <el-table-column
            prop="grade"
            label="教授年级"
            width="120">
        </el-table-column>
        <el-table-column
                prop="teaching_age"
                label="教龄"
                width="120">
        </el-table-column>
        <el-table-column
                prop="politics_sta"
                label="政治面貌"
                width="120">
        </el-table-column>
        <el-table-column
            prop="stu_estimate"
            label="学生评分"
            width="150">
        </el-table-column>
        <el-table-column
            prop="house_address"
            label="家庭住址"
            width="120">
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
      <el-button type="danger" size="mini" style="margin-top: 12px" :disabled="multipleSelection.length === 0" @click="deleteTeachers">批量删除</el-button>
    </div>
    <el-dialog :title="dialogTitle[dialogStatus]" :visible.sync="dialogFormVisible" center >
      <el-form :model="form" :rules="rules"  ref="teacher" >

        <el-form :inline="true" :model="form" :rules="rules"  ref="teacher" >
          <el-form-item label="姓名" :label-width="formLabelWidth"  prop="name">
            <el-input v-model="form.name" placeholder="请输入合法姓名" style="width:130%" autocomplete="off"></el-input>
          </el-form-item>
          <el-form-item label="出生日期" :label-width="formLabelWidth"  prop="dateofbirth">
            <el-date-picker
                style="width:125%"
                v-model="valuedate1"
                type="date"
                placeholder="请选择日期">
            </el-date-picker>
          </el-form-item>
        </el-form>

        <el-form :inline="true" :model="form" :rules="rules"  ref="teacher" >
          <el-form-item label="性别" :label-width="formLabelWidth" prop="gender">
            <el-select v-model="form.gender" placeholder="请选择性别" style="width:121%">
              <el-option
                      v-for="item in options"
                      :key="item.value"
                      :value="item.label">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="年龄" :label-width="formLabelWidth" prop="age">
            <el-input v-model.number="form.age" style="width:137%" placeholder="请输入适当年龄" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>

        <el-form :inline="true" :model="form" :rules="rules"  ref="teacher">
          <el-form-item label="电话" :label-width="formLabelWidth" prop="tel_number">
            <el-input v-model="form.tel_number" placeholder="请输入11位有效电话号码" style="width:130%" autocomplete="off"></el-input>
          </el-form-item>

          <el-form-item label="Email" :label-width="formLabelWidth" prop="email">
            <el-input v-model="form.email" placeholder="请输入有效电子邮箱" style="width:145%" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>

        <el-form-item label="教授课程" :label-width="formLabelWidth" prop="course">

            <el-cascader
                placeholder="请选择课程"
                style="width:69%"
                v-model="form.course"
                :options="optionscourse"
                :props="{ expandTrigger: 'hover',
                          value: 'label',
                          label: 'label'
                }"
                @change="handleChange">
            </el-cascader>

        </el-form-item>

        <el-form :inline="true" :model="form" :rules="rules"  ref="teacher">
          <el-form-item label="学历" :label-width="formLabelWidth" prop="edu_background">
            <el-select v-model="form.edu_background" style="width:121%" placeholder="请选择学历">
              <el-option

                  v-for="item in optionsedu"
                  :key="item.value"
                  :label="item.label"
                  :value="item.label">
              </el-option>
            </el-select>
          </el-form-item>

          <el-form-item label="教龄" :label-width="formLabelWidth" prop="teaching_age">
            <template>
              <el-input-number v-model="form.teaching_age" @change="handleChangetage" :min="0" :max="40" style="width:100%" label="描述文字"></el-input-number>
            </template>
          </el-form-item>
        </el-form>

        <el-form :inline="true" :model="form" :rules="rules"  ref="teacher">
          <el-form-item label="政治面貌" :label-width="formLabelWidth" prop="politics_sta">
            <el-select v-model="form.politics_sta" style="width:121%" placeholder="请选择">
              <el-option
                  v-for="item in optionsesta"
                  :key="item.value"
                  :label="item.label"
                  :value="item.label">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="是否退休" :label-width="formLabelWidth" prop="retired">
            <el-switch

                width="155"
                aria-posinset="off"
                v-model="form.retired"
                active-color="#13ce66"
                inactive-color="#ff4949"
                active-text="未退休"
                inactive-text="已退休"
                active-value="未退休"
                inactive-value="已退休">
            </el-switch>
          </el-form-item>
        </el-form>

        <el-form-item label="授课年级" :label-width="formLabelWidth" prop="grade">
          <template>
            <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox>
            <div style="margin: 15px 0;"></div>
            <el-checkbox-group v-model="form.grade" @change="handleCheckedGradesChange">
              <el-checkbox style="width:16%" v-for="grade in grades" :label="grade" :key="grade">{{grade}}</el-checkbox>
            </el-checkbox-group>
          </template>
        </el-form-item>

        <el-form-item label="薪资" :label-width="formLabelWidth" prop="salary">
            <el-slider v-model="form.salary" style="width:65%" max="35000"></el-slider>
        </el-form-item>

        <el-form :inline="true" :model="form" :rules="rules"  ref="teacher">
          <el-form-item label="学生评分" :label-width="formLabelWidth"  prop="stu_estimate">
            <template>
              <el-input-number v-model="form.stu_estimate" @change="handleChangetage" :min="0" :max="10" style="width:95%" label="描述文字"></el-input-number>
            </template>
          </el-form-item>

          <el-form-item label="教师性格" :label-width="formLabelWidth"  prop="trait">
            <el-select v-model="form.trait" style="width:101%" placeholder="请选择">
              <el-option

                  v-for="item in optionstra"
                  :key="item.value"
                  :label="item.label"
                  :value="item.label">
              </el-option>
            </el-select>
          </el-form-item>
        </el-form>

          <el-form-item label="入职日期" :label-width="formLabelWidth"  prop="dateofentry">
            <el-date-picker
                style="width:69%"
                v-model="valuedate2"
                type="date"
                placeholder="请选择日期">
            </el-date-picker
                >
          </el-form-item>

        <el-form-item label="家庭住址" :label-width="formLabelWidth" prop="house_address">
           <el-input type="textarea" :rows="2" v-model="form.house_address" style="width:69%" placeholder="请输入有效家庭住址" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="籍贯住址" :label-width="formLabelWidth" prop="native_place">
          <el-input type="textarea" :rows="2" v-model="form.native_place" style="width:69%" placeholder="请输入有效籍贯住址" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="自我格言" :label-width="formLabelWidth" prop="motto">
          <el-input type="textarea" :rows="2" v-model="form.motto" style="width:69%" placeholder="请输入教师格言" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitTeacher">确 定</el-button>
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
const gradeOptions = ['大一', '大二', '大三', '大四'];
export default {
  name: 'Teacher',
  components: {
  },
  data () {
    return {
      fileList: [],
      teacherName: '',
      multipleSelection:[],
      dialogTitle: {
        addTeacher: "新增教师",
        editTeacher: "编辑教师"
      },
      dialogStatus: "",
      rules: {
        name: [
          {required: true, message: '请输入姓名'},
          {max:15 ,message: '名字最多不超过15个汉字'},
          {pattern: /^[\u0391-\uFFE5A-Za-z]+$/, required: true, message: '请输入中文名字', trigger: 'blur'},
          { pattern: /^[A-Za-z0-9\u4e00-\u9fa5]+$/, message: '不允许输入空格等特殊符号' }
        ],
        // dateofbirth: [
        //   { required: true, message: '请选择出生日期'}
        // ],
        tel_number: [
          { required: true, message: '请输入电话号码'},
          {max:11 ,message: '手机号码请小于11位'},
          { pattern: /^((0\d{2,3}-\d{7,8})|(1[34578]\d{9}))$/, message: '请输入正确的电话号码'}
        ],
        email: [
          { required: true, message: '请输入邮箱'},
          { pattern: /^([a-zA-Z0-9]+[-_\.]?)+@[a-zA-Z0-9]+\.[a-z]+$/, message: '请输入正确的邮箱'}
        ],
        age: [
          { required: true, message: '年龄不能为空', trigger: 'blur'},
          { type: 'number',  message: '年龄必须为数字值'},
          { pattern: /^[1-9][0-9]$/, message: '请输入适当年龄'}
          ],
        gender: [
          { required: true, message: '请选择性别', trigger: 'change'}
        ],
        course: [
          { required: true, message: '请选择课程', trigger: 'blur'}
        ],
        edu_background: [
          { required: true, message: '请选择学历'}
        ],
        teaching_age:[
          { required: true, message: '请增减教龄', trigger: 'blur'},
        ],
        politics_sta :[
          { required: true, message: '请选择政治状态'}
        ],
        stu_estimate :[
          { required: true, message: '请打分', trigger: 'blur'},
        ],
        trait: [
          { required: true, message: '请选择教师性格', trigger: 'blur'},
        ],
        house_address: [
          { required: true, message: '家庭地址不能为空'}
        ],
        native_place: [
          { required: true, message: '籍贯地址不能为空'}
        ],
        motto: [
          { required: true, message: '教师格言不能为空'}
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
      teachers:[],
      search: '',
      dialogFormVisible: false,
      form: {
        name: '',
        age: '',
        gender: '',
        course: [],
        salary: '',
        retired: '',
        teaching_age: '',
        tel_number: '',
        politics_sta: '',
        house_address: '',
        email: '',
        stu_estimate: '',
        edu_background: '',
        grade: [],
        native_place: '',
        motto: '',
        trait: ''

      },
      formLabelWidth: '120px',

      pickerOptions: {  //新增出生日期
        disabledDate(time) {
          return time.getTime() > Date.now();
        }
      },
      valuedate1: '',
      valuedate2: '',

      optionscourse:[{
        value: 'jixin',
        label:'计信学院',
        children: [{
          value: 'ruangong',
          label: '软件工程',
        },{
          value: 'xinguan',
          label: '信息管理',
        },{
          value: 'jike',
          label: '计算机科学与技术',
        },{
          value: 'zhiji',
          label: '智能科学与技术',
        },{
          value: 'shushu',
          label: '数据科学与大数据',
        },{
          value: 'dianshang',
          label: '电子商务',
        }]
      },{
        value: 'meiyuan',
        label:'美术学院',
        children: [{
          value: 'meishuxue',
          label: '美术学',
        },{
          value: 'fuzhuangsheji',
          label: '服装设计',
        },{
          value: 'shufaxue',
          label: '书法学',
        },{
          value: 'huanjsheji',
          label: '环境设计',
        }]
      },{
        value: 'wenxueyuan',
        label:'文学院',
        children: [{
          value: 'hanyuyanwenxue1',
          label: '汉语言文学(师范)',
        },{
          value: 'hanyuyanwenxue2',
          label: '汉语言文学',
        },{
          value: 'mishuxue',
          label: '秘书学',
        },{
          value: 'hanyuguojijiaoyu',
          label: '汉语国际教育',
        }]
      },{
        value: 'jiaoyu',
        label:'教育学院',
        children: [{
          value: 'jiaoyukexue',
          label: '教育科学',
        },{
          value: 'xiaoxuejiaoyu',
          label: '小学教育',
        },{
          value: 'jiaoyuxue',
          label: '教育学',
        },{
          value: 'xueqianjiaoyu',
          label: '学前教育',
        },{
          value: 'yishujiaoyu',
          label: '艺术教育',
        },{
          value: 'teshujiaoyu',
          label: '特殊教育',
        },{
          value: 'jiaoyukangfuxue',
          label: '教育康复学',
        }]
      },{
        value: 'yinyue',
        label:'音乐学院',
        children: [{
          value: 'yinyuexue',
          label: '音乐学',
        },{
          value: 'yinyuebiaoyan',
          label: '音乐表演',
        },{
          value: 'wudaoxue',
          label: '舞蹈学',
        },{
          value: 'wudaobiaoyan',
          label: '舞蹈表演',
        }]
      },{
        value: 'chuanmei',
        label:'传媒学院',
        children: [{
          value: 'xinwenxue',
          label: '新闻学',
        },{
          value: 'wangluoyuxinmeiti',
          label: '网络与新媒体',
        },{
          value: 'guangbian',
          label: '广播电视编导',
        },{
          value: 'yingshisheyin',
          label: '影视摄影与制作',
        },{
          value: 'xiwen',
          label: '戏剧影视文学',
        }]
      }],

      //iconClasses: ['icon-rate-face-1', 'icon-rate-face-2', 'icon-rate-face-3'],

      optionsedu:[{
        value: '选项1',
        label: '本科'
      }, {
        value: '选项2',
        label: '硕士研究生'
      }, {
        value: '选项3',
        label: '博士研究生'
      }],

      optionstra:[{
        value: '选项1',
        label: '严肃'
      }, {
        value: '选项2',
        label: '幽默'
      }, {
        value: '选项3',
        label: '友善'
      }, {
        value: '选项4',
        label: '沉默'
      }, {
        value: '选项5',
        label: '活泼'
      }],

      optionsesta:[{
        value: '选项1',
        label: '团员'
      }, {
        value: '选项2',
        label: '党员'
      }],

      retired: '已退休',


      checkAll: false,
      grade: ['大一', '大二'],
      grades: gradeOptions,
      isIndeterminate: true,

      textarea: ''

    }
  },
  created() {
    this.findAllTeachers();
  },
  watch:{
    teacherName () {
        this.findAllTeachers();
    }
  },
  methods: {
    // deleteFile (file) {
    //   console.log(file)
    // },
    handleChange(value) {
      console.log(value);
    },
    handleChangetage(value) {
      console.log(value);
    },

    handleCheckAllChange(val) {
      this.form.grade = val ? gradeOptions : [];
      this.isIndeterminate = false;
    },
    handleCheckedGradesChange(value) {
      let checkedCount = value.length;
      this.checkAll = checkedCount === this.grades.length;
      this.isIndeterminate = checkedCount > 0 && checkedCount < this.grades.length;
    },
    
    handleSuccess (file) {
      const filename = file.name;
      this.$message({
        message: '文件上传成功！',
        type: 'success'
      });
    },
    searchTeacherByName () {
        if (this.teacherName !== '') {
            this.$axios.get("/teacher/findTeacherByName?name="+this.teacherName).then( (resp)=> {
                this.teachers = resp.data;
            }).catch( (error)=>{
                this.$message({
                    type: 'error',
                    message: "查询失败，原因是"+error.data.message
                });
            })
        }
    },
    deleteTeachers () {
      this.$confirm('此操作将永久删除教师, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach( (item)=>{
          ids += 'ids='+item.uid+'&'
        });
        this.$axios.post("/teacher/deleteTeachersByIds"+ids).then( (resp)=> {
          if (resp) {
            this.findAllTeachers();
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
    submitTeacher () {
      if (this.dialogStatus === 'addTeacher'){
        this.addTeacher();
      } else if(this.dialogStatus === "editTeacher") {
        this.editTeacher();
      }
    },
    findAllTeachers () {
      this.$axios.get("/teacher/findAllTeachers")
              .then((res) => {
                this.teachers = res.data
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
      this.dialogStatus = "editTeacher";
      this.form.uid = row.uid;
      this.form.name = row.name;
      this.form.age = row.age;
      this.form.gender = row.gender;
      this.form.tel_number = row.tel_number;
      this.form.course = row.course.split("/");
      this.form.salary = row.salary;
      this.form.retired = row.retired;
      this.form.teaching_age = row.teaching_age;
      this.form.politics_sta = row.politics_sta;
      this.form.house_address = row.house_address;
      this.form.stu_estimate = row.stu_estimate;
      this.form.native_place = row.native_place;
      this.form.motto = row.motto;
      this.form.trait = row.trait;
      this.form.grade = row.grade.split(",");
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除该教师, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$axios.post("/teacher/deleteTeacher?uid="+row.uid).then ((resp)=>{
          this.$message.success("删除成功!")
          this.findAllTeachers();
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
      this.form.gender = '';
      this.form.tel_number = '';
      this.form.course = '';
      this.form.salary = '';
      this.form.retired = '';
      this.form.teaching_age = '';
      this.form.politics_sta = '';
      this.form.house_address = '';
      this.form.stu_estimate = '';
      this.form.edu_background = '';
      this.form.native_place = '';
      this.form.grade = '';
      this.form.motto = '';
      this.form.trait = '';
      this.dialogFormVisible = true;
      this.dialogStatus = "addTeacher";
    },
    addTeacher () {
      this.$refs.teacher.validate((valid) => {
        if (valid) {
          this.form.course = this.form.course.join("/")
          this.form.grade = this.form.grade.join(",")
          this.$axios.post("/teacher/addTeacher",this.form).then( (resp)=>{
            if (resp) {
              this.dialogFormVisible = false;
              this.$message.success("添加成功！");
              this.findAllTeachers();
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
    editTeacher () {
      this.form.course = this.form.course.join("/")
      this.form.grade = this.form.grade.join(",")
      this.$axios.post("/teacher/updateTeacher",this.form).then( (resp)=>{
        this.dialogFormVisible = false;
        this.$message.success("修改成功!");
        this.findAllTeachers();
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

