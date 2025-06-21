<template>
    <div class="common-layout">
       <el-container>
         <el-header>行程安排系统管理员后台</el-header>
         <el-container>
           <el-aside>
         <div class="radiodiv">
           <el-radio-group v-model="isCollapse" style="margin-bottom: 5px">
               <el-radio-button :value="false"><el-icon><View /></el-icon></el-radio-button>
               <el-radio-button :value="true"><el-icon><Hide /></el-icon></el-radio-button>
             </el-radio-group>
         </div>
               <el-menu
           default-active="/managerHome"
           class="el-menu-vertical-demo"
       :collapse="isCollapse"
       router
         >
       <el-menu-item index="/managerHome">
     <el-icon><House /></el-icon>
         <span>主页</span>
       </el-menu-item>
       
           <el-menu-item index="/managersetting">
             <el-icon><setting /></el-icon>
             <span>用户管理</span>
           </el-menu-item>
           
           <el-menu-item index="/managerinfo">
            <el-icon><User /></el-icon>
             <span>个人信息</span>
           </el-menu-item>
        
           
          </el-menu>
          </el-aside>
          
           <el-main style="background-color: #fff;">
         <RouterView />
       </el-main>
         </el-container>
       </el-container>
     </div>
   
   </template>
   
   
   
   
   
   
   
   <script setup lang="ts">
     import { Hide, House } from '@element-plus/icons-vue';
  import { ref } from 'vue';
   
     let isCollapse = ref(true)
   </script>
   
   
   
   
   
   <style scoped>
     .radiodiv{
       position: absolute;
       top: 30px;
     }
     .el-header,
     .el-footer {
       background-color: #B3C0D1;
       color: #333;
       text-align: center;
       line-height: 60px;
           font-size: 30px;
     }
   
     .el-aside {
       background-color: #D3DCE6;
       color: #333;
       text-align: center;
       line-height: 30px;
       width: auto;
       border-right: none;
     }
   
     .el-main {
       background-color: #E9EEF3;
       color: #333;
       text-align: left;
       line-height:normal;
           height: 650px;
     }
   
     body>.el-container {
       margin-bottom: 40
       }
     </style>   