<template>
    <div class="dashboard">
      <!-- 头像卡片 -->
      <el-card class="avatar-card">
        <div class="avatar-wrapper">
          <el-avatar :size="100" :src="manager.avatar" />
        </div>
        <div class="upload-btn">
            <el-upload action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
            :show-file-list="false" :auto-upload="false" :on-change="imgchange">
              <el-button >更换头像</el-button>
            </el-upload>
          </div>
        <h3>{{managerName}}</h3>
        <p class="subtitle">管理员</p>
      </el-card>
  
      <!-- 信息编辑卡片 -->
      <el-card class="info-card">
        <el-tabs v-model="activeTab">
          <!-- 基本信息 -->
          <el-tab-pane label="基本信息" name="basic">
            <el-form :model="manager" label-width="100px">
              <el-form-item label="姓名">
                <el-input v-model="manager.Name" />
              </el-form-item>
              <el-form-item label="邮箱">
                <el-input v-model="manager.Eml" />
              </el-form-item>
              <el-form-item label="手机号">
                <el-input v-model="manager.Tel" />
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
  import axios from 'axios'
  import { ElMessage, valueEquals } from 'element-plus'
  import { ref } from 'vue'
let managerId = ref(localStorage.getItem('managerId'))

  const activeTab = ref('basic')
  const oldPwd = ref('')
  const newPwd = ref('')
  let managerImg = ref('')
  let managerName = ref('')
  let imgfile = ref<any>("")//变量，主要作用是储存文件信息
  let imageUrl = ref('')

  let manager = ref({
    Name: '',
    avatar: 'https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png',
    Eml: '',
    Tel: ''
  })

  //获取个人信息
  axios.get("http://localhost:8080/getmanagerinfo?mID="+managerId.value).then(res => {
    console.log(res.data)
   manager.value.Eml = res.data.managerEml
   manager.value.Tel = res.data.managerTel
   managerImg.value = res.data.managerImg
  })
//获取个人信息
  axios.get("http://localhost:8080/managerinfo?mID="+managerId.value).then(res => {
    console.log(res.data)
    manager.value.Name = res.data.managerName
    manager.value.avatar = "http://localhost:8080/img/"+res.data.managerImg
    managerName.value = res.data.managerName
    oldPwd.value = res.data.managerPwd
  })

  //修改个人信息
  function save(){
   
    if(newPwd.value==""){
        ElMessage("请输入新密码！")
    }else if (newPwd.value.length < 6|| newPwd.value.length > 16) {
      ElMessage.warning("请输入6-16位密码！");
      return;
    } else {
      axios.get("http://localhost:8080/managerinfo?mID="+managerId.value).then(res => {
        console.log(res.data)
        managerImg.value = res.data.managerImg
        let fd= new FormData();
       fd.append("managerName",manager.value.Name);
       fd.append("managerId",managerId.value as string);
       fd.append("managerPwd",newPwd.value);
       fd.append("managerImg",managerImg.value);
      
       axios.post("http://localhost:8080/updatemanager",fd).then(res => {
 
       });
       let fd1= new FormData();
       fd1.append("managerId",managerId.value as string);
       fd1.append("managerEml",manager.value.Eml);
       fd1.append("managerTel",manager.value.Tel);
       axios.post("http://localhost:8080/updatemanagerinfo",fd1).then(res => {
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
    managerImg.value = file.name;


    let fd2 = new FormData();
    fd2.append("file",imgfile.value);
    fd2.append("managerName",manager.value.Name);
    fd2.append("managerId",managerId.value as string);
    fd2.append("managerPwd",oldPwd.value);
    fd2.append("managerImg",managerImg.value);
    axios.post("http://localhost:8080/uploadmanagerimg",fd2).then(res => {
    if(res.data == "ok"){
        ElMessage("修改成功！")
            // 重新刷新页面
    window.location.reload();
    }else{
        ElMessage("修改失败！")
    }

  })
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