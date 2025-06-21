   
 <template>
    用户账号：<input v-model="userID" /> 
    <el-button type="primary" @click="Search">查找用户</el-button>
    <el-table :data="tableData" stripe style="width: 100%">
   <el-table-column prop="userImgPath" label="用户头像" width="180">
        <template #default="scope">
            <img style="width: 50%;border-radius: 50%;" :src="'http://localhost:8080/img/'+ scope.row.userImgPath" >
        </template>
   </el-table-column>
    <el-table-column prop="userName" label="用户昵称" width="180" />
    <el-table-column prop="userID" label="用户ID" width="180" />
    <el-table-column prop="userPwd" label="用户密码" width="180" />
    <el-table-column fixed="right" label="操作" width="300">
        <template #default="scope">
                <el-button type="primary" size="small" @click="up(scope.row)">修改</el-button>
                <el-button type="primary" size="small" @click="del(scope.row)">注销</el-button>
            </template>
        </el-table-column>
  </el-table>
  <div class="box">
        <el-dialog v-model="upvisible" title="点击头像可修改" style="width:25%;height: auto;text-align: center;">

            <el-upload class="avatar-uploader" action="https://run.mocky.io/v3/9d059bf9-4660-45f2-925d-ce80ad6c4d15"
                :show-file-list="false" :auto-upload="false" :on-change="imgchange">
                <img style="width: 20%;height: 20%;" v-if="imageUrl" :src="imageUrl" class="avatar" />
                <el-icon v-else class="avatar-uploader-icon">
                    <Plus />
                </el-icon>
            </el-upload>
           <br/> 用户昵称：<el-input v-model="userName" style="width: 240px;height: 30px;" placeholder="Please input" clearable /><br/>
           <br/>&nbsp;  用户ID： <el-input v-model="userID" disabled style="width: 240px;height: 30px;" placeholder="Please input" clearable /><br/>
           <br/> 用户密码： <el-input v-model="userPwd" disabled style="width: 240px;height: 30px;" placeholder="Please input" clearable /><br/>
            <el-button  style="margin-left:0px;margin-top: 5px;"  type="primary" @click="upload">
                保存并上传<el-icon class="el-icon--right">
                    <Upload />
                </el-icon>
            </el-button>
        </el-dialog>


    </div>
    <RouterView />
  </template>




<script setup lang="ts">
import { ref } from 'vue'
import axios from 'axios';
import { ElMessage, ElMessageBox } from 'element-plus';


interface user {
    userid: number;
    userpwd: string;
    username: string;
    userimgpath: string;
}

let tableData = ref<any>([]);
let imageUrl = ref("");
let userID = ref("");
let upvisible = ref(false);
let userName = ref("");
let userPwd = ref("");
let imgfile = ref<any>("")//变量，主要作用是储存文件信息
let userImgPath = ref("");



axios.get("http://localhost:8080/getUserInfo")
.then(res => {
  tableData.value = res.data as user[];
});
function Search(){
    axios.get("http://localhost:8080/getUserInfoByID?userID="+userID.value,{})
    .then(res => {
     console.log(res.data);
     userName.value = res.data.userName;
     userID.value = res.data.userID;
     userPwd.value = res.data.userPwd;
     imageUrl.value = "http://localhost:8080/img/"+res.data.userImgPath;
     upvisible.value = true

    });
}

function imgchange(file:any){
    console.log(file);
    if (file.raw.type !== 'image/jpeg') {
        ElMessage("请上传jpg格式的图片！")
        return;
    }
    else if(file.raw.size > 1024 * 1024*2){
        ElMessage("图片大小不能超过2M！")
        return;
    }
    imageUrl.value = URL.createObjectURL(file.raw);
    imgfile.value = file.raw;
    userImgPath.value = file.name;
    console.log(imageUrl.value);

    let fd = new FormData();
 fd.append("file",imgfile.value);
 fd.append("userID",userID.value);
 fd.append("userName",userName.value);
 fd.append("userPwd",userPwd.value);
 fd.append("userImgPath",userImgPath.value);

 axios.post("http://localhost:8080/uploadimg",fd).then(res => {
    if(res.data == "ok"){
        ElMessage("修改成功！")
    }else{
        ElMessage("修改失败！")
    }
    // 重新刷新页面
    window.location.reload();
 });
}

function upload(){  
    let fd= new FormData();
    fd.append("userID",userID.value);
    fd.append("userName",userName.value);
    fd.append("userPwd",userPwd.value);
    fd.append("userImgPath",userImgPath.value);
    axios.post("http://localhost:8080/updateUserName",fd).then(res => {
        if(res.data == "ok"){
            ElMessage("修改成功！")
        }else{
            ElMessage("修改失败！")
        }
            // 重新刷新页面
    window.location.reload();
    });
}

function up(row:any){
    upvisible.value = true
    userName.value = row.userName;
    userID.value = row.userID;
    userPwd.value = row.userPwd;
    imageUrl.value = "http://localhost:8080/img/"+row.userImgPath;
    userImgPath.value = row.userImgPath;
}


const del = (row: any) => {
  // 弹出确认框
  ElMessageBox.confirm(
    '是否确认删除该用户？',
    '警告',
    {
      confirmButtonText: '确认',
      cancelButtonText: '取消',
      type: 'warning',
    }
  )
  .then(() => { // 用户点击确认
    axios.get("http://localhost:8080/delUserInfo?userID=" + row.userID)
    .then(res => {
      if (res.data === "ok") {
        ElMessage.success("删除成功！")
        window.location.reload() // 仅成功时刷新
      } else {
        ElMessage.error("删除失败！")
      }
    })
    .catch(err => { // 处理网络错误
      console.error(err)
      ElMessage.error("请求失败，请检查网络连接")
    })
  })
  .catch(() => { // 用户点击取消
    ElMessage.info("已取消删除")
  })
}


</script>



<style scoped>

.avatar-uploader .el-upload {
    border: 1px dashed var(--el-border-color);
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    transition: var(--el-transition-duration-fast);
}
.avatar-uploader .el-upload:hover {
   
    border-color: var(--el-color-primary);
    
}

.el-icon.avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 178px;
    height: 178px;
    text-align: center;
}

</style>
  