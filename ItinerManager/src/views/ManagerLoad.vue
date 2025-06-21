<template>
    <div class="box">
   
     <div class="login-container">
        <div class="left-container">
            <div class="title"><span>管理员登录</span></div>
            <div class="input-container">
                <input type="text" v-model="managerId" placeholder="管理员账号">
                <input type="password" v-model="managerPwd" placeholder="密码">
            </div>
            <div class="message-container">
                <span @click="LoginView">返回用户登录</span>
            </div>
        </div>
        <div class="right-container">
            <div class="regist-container">
                <span class="regist" @click="managerregist">点我注册</span>
            </div>
            <div class="action-container">
                <span @click="login">登录</span>
            </div>
        </div>
    </div> </div>
    <RouterView />
  </template>


<script setup lang="ts">
import axios from 'axios';
import { ElMessage } from 'element-plus';
import { ref } from 'vue';
import { useRouter } from 'vue-router';

let managerId = ref('');
let managerPwd = ref('');
let router = useRouter();

function managerregist(this: any) {
   ElMessage("管理员注册功能暂未开放！需要管理员账号请联系邮箱：123456789@qq.com");
   
}

function LoginView(this: any) {
   //跳转到普通用户登录页面
   router.push('/');
   
}

function login(this: any) {
  //验证账号密码
  if (!managerId.value || !managerPwd.value) {
    ElMessage.warning('请输入账号和密码');
  }else{
    axios.post("http://localhost:8080/managerlogin?mID=" + managerId.value + "&mPwd=" + managerPwd.value)
    .then(res => {
       
       if(res.data=="ok"){
            ElMessage("登录成功！");
            router.push('/managerhome?managerId='+managerId.value+'')
            console.log(managerId.value );
            localStorage.setItem('managerId', managerId.value);//将用户id保存到localStorage中
        }else {
            ElMessage("账号或密码错误！");
        } 
    })  
}}

</script>





<style scoped>

* {
            padding: 0;
            margin: 0;
        }
        .box {
            position: absolute;
            top: 0%;
            width: 100%;
            height: 100%;
            background-image: linear-gradient(to bottom right, rgb(152, 19, 61), rgb(130, 88, 186));
        }
       
        .login-container {
            width: 600px;
            height: 315px;
            margin: 0 auto;
            margin-top: 10%;
            border-radius: 15px;
            box-shadow: 0 10px 50px 0px rbg(59, 45, 159);
            background-color: rgb(95, 76, 194);
        }
        .left-container {
            display: inline-block;
            width: 330px;
            height: 195px;
            border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
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
        .right-container {
            width: 145px;
            display: inline-block;
            height: 100%;
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