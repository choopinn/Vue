<template>
    <div class="box">
   
     <div class="login-container">
        <div class="left-container">
            <div class="title"><span>登录</span></div>
            <div class="input-container">
                <input type="text" v-model="userID" placeholder="账号">
                <input type="password" v-model="userPwd" placeholder="密码">
            </div>
            <div class="message-container">
                <span @click="manaegerload">管理员登录</span>
            </div>
        </div>
        <div class="right-container">
            <div class="regist-container">
                <span class="regist" @click="regist">点我注册</span>
            </div>
            <div class="action-container">
                <span @click="home">提交</span>
            </div>
        </div>
    </div> </div>
    <RouterView />
  </template>




<script setup lang="ts">
  import { useRouter } from 'vue-router';
  import { ref } from 'vue';
import { ElMessage } from 'element-plus';
import axios from 'axios';

  let router = useRouter();
  let userID = ref('');
  let userPwd = ref('');
function regist(this: any) {
   //跳转到注册页面
   router.push('/regist');
   
}

function manaegerload(this: any) {
   //跳转到管理员登录页面
   router.push('/Managerload');
   
}

function home(this: any) {
    //验证账号密码
    if (!userID.value || !userPwd.value) {
    ElMessage.warning('请输入账号和密码');
  }else {
    axios.post("http://localhost:8080/userlogin?uID=" + userID.value + "&uPwd=" + userPwd.value)
    .then(res => {
       if(res.data=="ok"){
            ElMessage("登录成功！");
            router.push('/userHome?userId='+userID.value+'')
            console.log(userID.value );
            localStorage.setItem('userId', userID.value);//将用户id保存到localStorage中
       }else {
            ElMessage("账号或密码错误！");
        } 
    })
  }

   
}

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
