<template>
  <div class="dashboard">
    <!-- 头像卡片 -->
    <el-card class="avatar-card">
      <div class="avatar-wrapper">
        <el-avatar :size="100" :src="user.avatar" />
      </div>
      <div class="upload-btn">
          <el-upload action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
          :show-file-list="false" :auto-upload="false" :on-change="imgchange">
            <el-button >更换头像</el-button>
          </el-upload>
        </div>
      <h3>{{UserName}}</h3>
      <p class="subtitle">普通用户</p>
    </el-card>

    <!-- 信息编辑卡片 -->
    <el-card class="info-card">
      <el-tabs v-model="activeTab">
        <!-- 基本信息 -->
        <el-tab-pane label="基本信息" name="basic">
          <el-form :model="user" label-width="100px">
            <el-form-item label="姓名">
              <el-input v-model="user.Name" />
            </el-form-item>
            <el-form-item label="邮箱">
              <el-input v-model="user.Eml" />
            </el-form-item>
            <el-form-item label="手机号">
              <el-input v-model="user.Tel" />
            </el-form-item>
          </el-form>
        </el-tab-pane>

        <!-- 安全设置 -->
        <el-tab-pane label="安全设置" name="security">
          <el-form label-width="100px">
            <el-form-item label="旧密码">
              <el-input type="text" v-model="oldPwd" disabled />
            </el-form-item>
            <el-form-item label="新密码">
              <el-input type="text" v-model="newPwd" />
            </el-form-item>
          </el-form>
        </el-tab-pane>
      </el-tabs>

      <div class="form-actions">
        <el-button type="primary" @click="save">保存修改</el-button>
        <el-button>取消</el-button>
      </div>
    </el-card>

  </div>
</template>

<script setup lang="ts">
import axios from 'axios';
import { ElMessage } from 'element-plus';
import { ref } from 'vue';

const activeTab = ref('basic')
const userId = ref(localStorage.getItem('userId'))
let imgfile = ref<any>("")//变量，主要作用是储存文件信息
let imageUrl = ref('')
let UserName = ref('')
let oldPwd = ref('')
let newPwd = ref('')
let UserImgPath = ref('')
let user = ref({
    Name: '',
    avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png',
    Eml: '',
    Tel: ''
  })
    //获取个人信息
    axios.get("http://localhost:8080/getuserinfo?userID="+userId.value).then(res => {
    console.log(res.data)
   user.value.Eml = res.data.userEml
   user.value.Tel = res.data.userTel
   user.value.avatar = res.data.UserImgPath
  })
//获取个人信息
  axios.get("http://localhost:8080/getUserInfoByID?userID="+userId.value).then(res => {
    console.log(res.data)
    user.value.Name = res.data.userName
    user.value.avatar = "http://localhost:8080/img/"+res.data.userImgPath
    UserName.value = res.data.userName
    oldPwd.value = res.data.userPwd
  })
function imgchange(file:any){
    console.log(file);
    if (file.raw.type !== 'image/jpeg') {
        ElMessage("请上传jpg格式的图片！")
        return;
    }
    else if(file.raw.size > 1024 * 1024){
        ElMessage("图片大小不能超过2M！")
        return;
    }
    imageUrl.value = URL.createObjectURL(file.raw);
    imgfile.value = file.raw;
    UserImgPath.value = file.name;


    let fd1 = new FormData();
    fd1.append("file",imgfile.value);
    fd1.append("UserName",user.value.Name);
    fd1.append("UserID",userId.value as string);
    fd1.append("UserPwd",oldPwd.value);
    fd1.append("UserImgPath",UserImgPath.value);
    axios.post("http://localhost:8080/uploadimg",fd1).then(res => {
    if(res.data == "ok"){
        ElMessage("修改成功！")
            // 重新刷新页面
    window.location.reload();
    }else{
        ElMessage("修改失败！")
    }

  })
  }
  function save(){
    if(newPwd.value==""){
        ElMessage("请输入新密码！")
    }else if (newPwd.value.length < 6|| newPwd.value.length > 16) {
      ElMessage.warning("请输入6-16位密码！");
      return;
    } else {
      axios.get("http://localhost:8080/getUserInfoByID?userID="+userId.value).then(res => {
        console.log(res.data)
        UserImgPath.value = res.data.userImgPath
        let fd= new FormData();
       fd.append("userName",user.value.Name);
       fd.append("userID",userId.value as string);
       fd.append("userPwd",newPwd.value);
       fd.append("userImgPath",UserImgPath.value);
      
       axios.post("http://localhost:8080/upuser",fd).then(res => {
       });
       let fd2= new FormData();
       fd2.append("userID",userId.value as string);
       fd2.append("userEml",user.value.Eml);
       fd2.append("userTel",user.value.Tel);
       axios.post("http://localhost:8080/upuserinfo",fd2).then(res => {
          if(res.data == "success"){
              ElMessage("修改成功！")
          }else{
              ElMessage("修改失败！")
          }
                //   重新刷新页面
          window.location.reload();
        })
      })
    }
  }
</script>

<style scoped>
.dashboard {
  display: grid;
  grid-template-columns: 240px 1fr;
  gap: 20px;
  padding: 20px;
}

.avatar-card {
  text-align: center;
  .avatar-wrapper {
    position: relative;
    .upload-btn {
      position: absolute;
      bottom: -10px;
      left: 50%;
      transform: translateX(-50%);
    }
  }
}

.log-card {
  grid-column: 1 / -1;
}

.form-actions {
  text-align: right;
  margin-top: 20px;
}
</style>