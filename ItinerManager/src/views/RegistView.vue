<template>
  <div class="box">
 
   <div class="login-container">
      <div class="left-container">
          <div class="title"><span>用户注册</span></div>
          <div class="input-container">
            <el-card class="avatar-card">
      <div class="avatar-wrapper">
        <el-avatar :size="100" :src="imageUrl" />
      </div>
      <div class="upload-btn">
          <el-upload action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
          :show-file-list="false" :auto-upload="false" :on-change="imgchange">
            <el-button style="background-color: transparent;border: 0px;color:cyan;">更换头像</el-button>
          </el-upload>
        </div>
    </el-card>
              <input type="text" v-model="UserID" placeholder="账号" disabled  style="width: 80%;">
              <div class="ID-container">
                <span @click="getRandomNumberClick" 
                style="position: absolute;left: 55%;top: 51%;">
                选择你的ID</span>
              </div>
              <input type="password" v-model="UserPwd" placeholder="密码"style="width: 80%;">
              <input type="text" v-model="UserName" placeholder="用户名称"style="width: 80%;">
              <input type="text" v-model="UserEml" placeholder="邮箱"style="width: 80%;">
              <input type="text" v-model="UserTel" placeholder="电话"style="width: 80%;">
          </div>
      <div class="message-container">
        <span  @click="save">注册</span>
        <span @click="LoginView" style="padding-left: 80%;">已有账号？</span> 
        </div>
      </div>
  </div> 
</div>
  <RouterView />
</template>


<script setup lang="ts">
import axios from 'axios';
import { ElMessage } from 'element-plus';
import { ref } from 'vue';
import { useRouter } from 'vue-router';

let router = useRouter();
let UserID = ref('');
let UserPwd = ref('');
let UserName = ref('');
let UserEml = ref('');
let UserTel = ref('');
let imgfile =  ref<any>("")
let imageUrl = ref('https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png');
let UserImgPath = ref('')
function LoginView(this: any) {
   //跳转到普通用户登录页面
   router.push('/');
   
}

function getRandomNumber(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

function generateUserID() {
  const randomNumber = getRandomNumber(10000000, 99999999);//随机生成8位数账号
  UserID.value = randomNumber.toString(); // 将数字转换为字符串
}

function getRandomNumberClick() {
  generateUserID();
}
function imgchange(file: any) {
  //上传图片
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
    console.log(UserImgPath.value);
    let fd1 = new FormData();
    fd1.append("file",imgfile.value);
    fd1.append("UserImgPath",UserImgPath.value);
    axios.post("http://localhost:8080/uploadimg1",fd1).then(res => {
    if(res.data !== null ){
        ElMessage("上传成功！")
        UserImgPath.value = res.data;
    }else{
        ElMessage("上传失败！")
    }
  })
}

function save() {
    if (UserID.value == '' || UserPwd.value == '' || UserName.value == '' || UserEml.value == '' || UserTel.value == '') {
        ElMessage("请填写完整信息！")  
    } else {
        let fd= new FormData();
       fd.append("userName",UserName.value);
       fd.append("userID",UserID.value as string);
       fd.append("userPwd",UserPwd.value);
       fd.append("userImgPath",UserImgPath.value);
       axios.post("http://localhost:8080/addUser",fd).then(res => {
      });
      let fd2= new FormData();
      fd2.append("userID",UserID.value as string);
      fd2.append("userEml",UserEml.value);
      fd2.append("userTel",UserTel.value);
      axios.post("http://localhost:8080/addUserinfo",fd2).then(res => {
        if(res.data == "success"){
            ElMessage("注册成功！")
            // 跳转到登录页面
            router.push('/');
        }else{
            ElMessage("注册失败！")
        }
      })
    }
}


</script>

<style scoped>
.avatar-card {
  margin-left: 20%;
  border: transparent;
  background-color:transparent;
  text-align: center;
  width: 60%;
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

* {
          padding: 0;
          margin: 0;
      }
      .box {
          position: absolute;
          top: 0%;
          width: 100%;
          height: 650px;
          background-image: linear-gradient(to bottom right, rgb(152, 19, 61), rgb(130, 88, 186));
      }
     
      .login-container {
          width: 600px;
          height: 420px;
          margin: 0 auto;
          margin-top: 2%;
          border-radius: 15px;
          box-shadow: 0 10px 50px 0px rbg(59, 45, 159);
          
      }
      .left-container {
          display: inline-block;
          width: 500px;
          height: 460px;
          border-top-left-radius: 15px;
          border-bottom-left-radius: 15px;
          border-top-right-radius: 15px;
          border-bottom-right-radius: 15px;
          padding: 60px;
          background-image: linear-gradient(to bottom right, rgb(171, 4, 4), rgb(92, 103, 211));
      }
      .title {
          color: #fff;
          font-size: 18px;
          font-weight: 200;
      }
      .title span {
          border-bottom: 3px solid rgb(237, 221, 22);
      }
      .input-container {
          padding: 20px 0;
      }
      input {
          border: 0;
          background: none;
          outline: none;
          color: #fff;
          margin: 20px 0;
          display: block;
          width: 100%;
          padding: 5px 0;
          transition: .2s;
          border-bottom: 1px solid rgb(199, 191, 219);
      }
      input:hover {
          border-bottom-color: #fff;
      }
      ::-webkit-input-placeholder {
          color: rgb(199, 191, 219);
      }
      .message-container {
          font-size: 14px;
          transition: .2s;
          color: rgb(199, 191, 219);
          cursor: pointer;
      }
      .message-container:hover {
          color: #fff;
      }
      .ID-container {
        font-size: 14px;
          transition: .2s;
          color: rgb(199, 191, 219);
          cursor: pointer;
      }
      .ID-container:hover {
        color: #fff;
      }
      .right-container {
          width: 145px;
          display: inline-block;
          height: 300px;
          vertical-align: top;
          padding: 60px 0;
      }
      .regist-container {
          text-align: center;
          color: #fff;
          font-size: 18px;
          font-weight: 200;
      }
      .regist-container span {
          border-bottom: 3px solid rgb(237, 221, 22);
          cursor: pointer;
      }
      .action-container {
          font-size: 10px;
          color: #ffffff;
          text-align: center;
          position: relative;
          top: 200px;
      }
      .action-container span {
          border: 1px solid rgb(237, 221, 22);
          padding: 10px;
          display: inline;
          line-height: 20px;
          border-radius: 20px;
          position: absolute;
          bottom: 10px;
          left: calc(72px - 20px);
          transition: .2s;
          cursor: pointer;
      }
      .action-container span:hover {
          background-color: rgb(237, 221, 22);
          color: rgb(95, 76, 194);
      }
</style>