<template>
  
    <div class="home" style="">
        <div class="calender" style="width: 700px; height: 642px;position:absolute;;left:650px;top: 75px;" >
          <el-calendar ref="calendar">
    <template #header="{ date }">
      <span>日历数据仅统计2000-2050年</span>
      <span>{{ date }}</span>
      <el-button-group>
        <el-button size="small" @click="selectDate('prev-year')">
         上一年
        </el-button>
        <el-button size="small" @click="selectDate('prev-month')">
          上个月
        </el-button>
        <el-button size="small" @click="selectDate('today')">今天</el-button>
        <el-button size="small" @click="selectDate('next-month')">
         下一月
        </el-button>
        <el-button size="small" @click="selectDate('next-year')">
        下一年
        </el-button>
      </el-button-group>
      
    </template>
    <template #date-cell="{ data }">
    <div class="custom-cell" @click="handleDayClick(data.day)">
      <div class="markers">
  <div v-if="isWeekend(data.day)" class="weekend-marker"></div>
  <div v-if="isWorkday(data.day)" class="workday-marker"></div>
</div>
      <!-- 基础日期 -->
      <div class="base-date">
        {{ data.day.split('-')[2] }}
        <div v-if="isToday(data.day)" class="today-marker"></div>
      </div>
      
      <!-- 节假日显示 -->
      <div v-if="getHolidayInfo(data.day)" class="holiday-tag">
        {{ getHolidayInfo(data.day)?.name }}
      </div>
    </div>
  </template>
  </el-calendar>
        </div>
    <div class="avatar" style="width:50px; height: 50px;position: absolute;top:75px;left: auto;" >
      <img  style="width: 100%;border-radius: 100%;" :src="'http://localhost:8080/img/'+ managerImg "/>
    </div>
    <span style="position: absolute;left:auto;margin-left:50px ; height:50px;width: 300px;">欢迎您{{ managerName }} <el-button @click="logout">退出登录</el-button> </span>
  <br />  <br />
  <div class="imgshow" style="height: 600px;width: 500px; position: absolute;left: auto;">
  <el-carousel
    height="500px"
    direction="vertical"
    type="card"
    :autoplay="true"
  >
    <el-carousel-item v-for="(item,index) in carouselItems" :key="index">
     <el-image :src=item.url   fit="cover" 
     class="carousel-image"/>
     <div class="carousel-caption" v-if="item.text">
          <h3>{{ item.text }}</h3>
        </div>
    </el-carousel-item>
  </el-carousel>
</div>
  </div>



    <RouterView />
  </template>


<script setup lang="ts">

import { ElMessage, type CalendarDateType, type CalendarInstance } from 'element-plus'
import axios from 'axios'
import { ref } from 'vue';
import router from '@/router';

const managerId = ref(localStorage.getItem('managerId'))
let managerName = ref('');
let managerImg = ref('');




     const carouselItems = [
        {
          url: "  https://cube.elemecdn.com/6/94/4d3ea53c084bad6931a56d5158a48jpeg.jpeg",
          text: "自然风景"
        },
        {
          url: "https://fuss10.elemecdn.com/a/3f/3302e58f9a181d2509f3dc0fa68b0jpeg.jpeg",
          text: "动物"
        },
        {
          url: "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=compress&cs=tinysrgb&w=auto",
          text: "自然风景"
        },
        {
          url: "https://images.pexels.com/photos/373290/pexels-photo-373290.jpeg?auto=compress&cs=tinysrgb&w=auto",
          text: "城市建筑"
        }
      ]


const calendar = ref<CalendarInstance>()
const selectDate = (val: CalendarDateType) => {
  if (!calendar.value) return
  calendar.value.selectDate(val)
}
// 获取节假日信息
const getHolidayInfo = (dateString: string) => {
  return holidays.value.find(item => item.date === dateString)
}

// 判断当前日期
const isToday = (dateString: string) => {
  const today = new Date().toISOString().split('T')[0]
  return dateString === today
}


// 优化点击处理
const handleDayClick = (date: string) => {
  const holiday = getHolidayInfo(date)
  if (holiday) {
    ElMessage.success(`${date} ${holiday.name}`)
  } else {
    ElMessage.info(date)
  }
}

// 节假日数据示例（格式：YYYY-MM-DD）
interface Holiday {
  date: string
  name: string
  type?: 'festival' | 'rest' | 'workday' // 节假日类型
}

const holidays = ref<Holiday[]>([])
// 获取当前登录用户信息
axios.get("http://localhost:8080/managerinfo?mID="+managerId.value)
.then(res => {
  console.log(res.data);
  managerName.value = res.data.managerName;
  console.log('当前用户：'+managerName.value);
  managerImg.value = res.data.managerImg;
})
// 退出登录
function logout (){
  localStorage.removeItem('managerId');//清除本地存储
  router.push('/ManagerLoad');
};

// 获取节假日信息
axios.get("http://localhost:8080/getHolidaysInfo")
.then(res => {
  holidays.value = res.data as Holiday[];
});


// 判断是否周末
const isWeekend = (dateString: string) => {
  const day = new Date(dateString).getDay()
  return day === 0 || day === 6
}
// 判断是否工作日
const isWorkday = (dateString: string) => {
  return getHolidayInfo(dateString)?.type === 'workday'
}
</script>




<style scoped>
.avatar { 
  text-align: center;
}
.holiday-tag[data-type="festival"] {
  color: #f56c6c;
}

.holiday-tag[data-type="workday"] {
  color: #67c23a;
}
:deep(.el-calendar-table__row ~ .el-calendar-table__row) td:first-child,
:deep(.el-calendar-table__row ~ .el-calendar-table__row) td:last-child {
  color: #f56c6c;
}
.custom-cell {
  height: 100%;
  padding: 8px;
  position: relative;
  cursor: pointer;
  transition: background 0.3s;
}

.custom-cell:hover {
  background: #f5f7fa;
}

.holiday-tag {
  position: absolute;
  bottom: 30px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 12px;
  color: #e6a23c;
  white-space: nowrap;
}

.today-marker {
  position: absolute;
  top: 2px;
  right: 2px;
  width: 6px;
  height: 6px;
  background: #409EFF;
  border-radius: 50%;
}
.el-carousel__item h3 {
  color: #475669;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
  text-align: center;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
</style>
