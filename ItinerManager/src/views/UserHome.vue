<template>
  <div class="calendar-container">
    <el-calendar ref="calendar" :current="currentDate">
      <template #date-cell="{ data }">
        <div 
          :class="['calendar-day', {'faded': !isCurrentMonth(data.day)}]" 
          @click="handleDateClick(data.day)"
        >
          <!-- 阳历日期 -->
          <div class="solar-date">{{ formatSolarDate(data.day) }}</div>
          <!-- 农历日期 -->
          <div class="lunar-date">{{ getLunarDate(data.day) }}</div>
          <!--节假日 标记 -->
          <div v-if="getHolidayInfo(data.day)" class="holiday-tag">
            {{ getHolidayInfo(data.day)?.name }}
          </div>
          <!-- 事件标记 -->
          <div v-if="getEvents(data.day)" class="event-marker">
            {{ getEvents(data.day)?.eventTitle }}
          </div>
        </div>
      </template>
    </el-calendar>

    <!-- 事件编辑弹窗 -->
    <el-dialog v-model="dialogVisible" :title="`编辑 ${selectedDate} 事件`">
      <el-input 
    v-model="EventTitle" 
    placeholder="事件标题" 
  /><br /><br />
  <el-input
    v-model="EventDetail"
    placeholder="事件详情"
    type="textarea"
    :rows="4"
  />
 
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="saveEvent">保存</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import lunisolar from 'lunisolar' //使用lunisolar库能直接使用lunisolar中的各种功能以及数据
import festivals from 'lunisolar/markers/festivals.zh-cn' // 导入节假日数据库
import axios from 'axios'
import { ElMessage } from 'element-plus'


lunisolar.Markers.add(festivals)// 全局加载节日列表



const dialogVisible = ref(false)  
const selectedDate = ref('')  // 初始化选中日期
const holidays = ref<Holiday[]>([])
const events = ref<Events[]>([])
const EventTitle = ref('')
const EventDetail = ref('')
const EventTime = ref('')
const userId = ref(localStorage.getItem('userId'))
const userName = ref('')
const userImgPath = ref('')

const currentDate = computed(() => {
const now = new Date();
  return `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}`;
});

const isCurrentMonth = (dateStr: string): boolean => {
  const date = new Date(dateStr);
  const now = new Date();

  return date.getFullYear() === now.getFullYear() && date.getMonth() === now.getMonth();
};

axios.get("http://localhost:8080/getUserInfoByID?userID="+userId.value)
.then(res => {
  console.log(res.data);
  userName.value = res.data.userName;
  console.log('当前用户：'+userName.value);
  userImgPath.value = res.data.userImgPath;
}) 


  interface Holiday {
  date: string
  name: string
  type?: 'festival' | 'rest' | 'workday' // 节假日类型
}
  interface Events {
    userID: string
    date: string
    eventTitle: string
    eventDetail: string
    eventTime: string
  }

  const getHolidayInfo = (dateString: string) => {
  return holidays.value.find(item => item.date === dateString)
}

axios.get("http://localhost:8080/getHolidaysInfo")
.then(res => {
  holidays.value = res.data as Holiday[];
});

const getEvents = (dateString: string) => {
  const dateOnly = dateString.split('T')[0]; // 如果data.day包含'T'，先分割
  return events.value.find(event => event.date.startsWith(dateOnly));
}
axios.get("http://localhost:8080/getAllEvent?userID=" + userId.value)
  .then(res => {
    events.value = res.data as Events[]
  })
 
// 阳历日期格式化（MM-DD格式）
const formatSolarDate = (dateStr: string) => {
  const date = new Date(dateStr)
  return [
    (date.getMonth() + 1).toString().padStart(2, '0'),
    date.getDate().toString().padStart(2, '0')
  ].join('-')
}

// 农历日期格式化（精确处理闰月）
const getLunarDate = (dateStr: string) => {
  try {
    const date = new Date(dateStr)
    const lsr = lunisolar(date)
    const lunar = lsr.lunar


    // 农历月份的中文转换
    const monthNames = ['正', '二', '三', '四', '五', '六', '七', '八', '九', '十', '冬', '腊']
    let monthText = monthNames[lunar.month - 1] + '月'// 获取农历月份的中文表示

    // 处理闰月显示
    if (lunar.isLeapMonth) {
    monthText = `${lunar.getMonthName()}`
    
    }
    // 获取农历日的中文表示
    const dayNames = ['初一', '初二', '初三', '初四', '初五', '初六', '初七', '初八', '初九', '初十',
                      '十一', '十二', '十三', '十四', '十五', '十六', '十七', '十八', '十九', '二十',
                      '廿一', '廿二', '廿三', '廿四', '廿五', '廿六', '廿七', '廿八', '廿九', '三十']
    const dayText = dayNames[lunar.day - 1]
    if(lunar.day === 1){
      return `${monthText}`
    }
    return `${dayText}`
  } catch (error) {
    console.error('农历转换失败:', error)
    return ''
  }
}



// 事件处理逻辑
const handleDateClick = (date: string) => {
  selectedDate.value = date.split('T')[0];
  axios.get("http://localhost:8080/getEventInfo?userID="+userId.value+"&date="+date,{})
.then(res => {
  EventTitle.value = res.data.eventTitle;
  EventDetail.value = res.data.eventDetail;
  EventTime.value = res.data.eventTime;
});
const existingEvent = getEvents(selectedDate.value);
  
  if (existingEvent) {
    // 如果有事件，填充表单数据
    EventTitle.value = existingEvent.eventTitle;
    EventDetail.value = existingEvent.eventDetail;
    EventTime.value = existingEvent.eventTime;
  } else {
    // 如果没有事件，清空表单数据
    EventTitle.value = '';
    EventDetail.value = '';
    EventTime.value = '';
  }
  dialogVisible.value = true; // 打开对话框
}
// 保存修改事件
const saveEvent = () => {
  const fd = new FormData();
  fd.append("userID",userId.value as string);
  fd.append("date",selectedDate.value);
  fd.append("eventTitle",EventTitle.value);
  fd.append("eventDetail",EventDetail.value);

  axios.post("http://localhost:8080/updateEvent?userID="+userId.value,fd).then(res => {
    if(res.data == "success"){
      ElMessage("修改成功！")
      dialogVisible.value = false
    }else{
      axios.post("http://localhost:8080/addEvent",fd).then(res => {
        if(res.data == "success"){
          ElMessage("添加成功！")
          dialogVisible.value = false
        }else{
          ElMessage("添加失败！")
        }
      })
      window.location.reload();
    }
  })

}

</script>

<style scoped>

.calendar-day.faded {
  opacity: 0.4; /* 调整透明度来虚化非当前月的日期 */
}
.example-showcase .el-dropdown-link {
  cursor: pointer;
  color: var(--el-color-primary);
  display: flex;
  align-items: center;
}
.calendar-container {
  max-width: 1200px;
  margin: 20px auto;
  padding: 20px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

.calendar-day {
  height: 60px;
  padding: 8px;
  position: relative;
  cursor: pointer;
  transition: background-color 0.3s;
}

.calendar-day:hover {
  background-color: #f8f9fa;
}

.solar-date {
  font-size: 16px;
  font-weight: 600;
  color: #303133;
  margin-bottom: 4px;
}

.lunar-date {
  font-size: 12px;
  color: #409eff;
  font-family: '楷体', cursive;
}

.event-marker {
  position: absolute;
  top: 0px;
  left: 65px;
  font-size: 12px;
  color:tomato;
}

/* 调整Element组件默认样式 */
:deep(.el-calendar__header) {
  padding: 12px 20px;
}

:deep(.el-calendar-table td.is-today) {
  background-color: #f3f8fe;
}

:deep(.el-calendar-table td) {
  border: 1px solid #ebeef5;
  vertical-align: top;
}
.holiday-tag {
  display: inline-block;
  margin-left: 0px;
  padding: 2px 4px;
  background-color:#409eff;
  color: black;
  border-radius: 4px;
  font-size: 10px;
  vertical-align: middle;
}
</style>