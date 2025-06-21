<template>
  <div class="timetable-container">
    <!-- 标题和操作栏 -->
    <div class="header">
      <h1>我的课程表</h1>
      <button @click="showAddForm = true" class="add-button">+ 添加课程</button>
    </div>

    <!-- 课程表主体 -->
    <div class="timetable-wrapper">
      <table class="timetable">
        <thead>
          <tr>
            <th>时间</th>
            <th v-for="day in days" :key="day">{{ day }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="timeSlot in timeSlots" :key="timeSlot">
            <td class="time-column">{{ timeSlot }}</td>
            <td 
              v-for="day in days" 
              :key="day"
              @click="selectCourse(day, timeSlot)"
              :class="{
                'course-cell': true,
                'has-course': getCourse(day, timeSlot)
              }"
            >
              <div v-if="getCourse(day, timeSlot)" class="course-info">
                <h3>{{ getCourse(day, timeSlot).name }}</h3>
                <p>{{ getCourse(day, timeSlot).classroom }}</p>
                <p>{{ getCourse(day, timeSlot).teacher }}</p>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- 添加课程表单 -->
    <div v-if="showAddForm" class="modal">
      <div class="modal-content">
        <h2>添加课程</h2>
        <form @submit.prevent="addCourse">
          <div class="form-group">
            <label>星期：</label>
            <select v-model="newCourse.day" required>
              <option v-for="day in days" :value="day" :key="day">{{ day }}</option>
            </select>
          </div>
          
          <div class="form-group">
            <label>时间：</label>
            <select v-model="newCourse.time" required>
              <option v-for="slot in timeSlots" :value="slot" :key="slot">{{ slot }}</option>
            </select>
          </div>

          <div class="form-group">
            <label>课程名称：</label>
            <input type="text" v-model="newCourse.name" required>
          </div>

          <div class="form-group">
            <label>教室：</label>
            <input type="text" v-model="newCourse.classroom" required>
          </div>

          <div class="form-group">
            <label>教师：</label>
            <input type="text" v-model="newCourse.teacher" required>
          </div>

          <div class="button-group">
            <button type="submit">确认添加</button>
            <button type="button" @click="showAddForm = false">取消</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      days: ['星期一', '星期二', '星期三', '星期四', '星期五'],
      timeSlots: [
        '8:00-9:30',
        '9:40-11:10',
        '11:20-12:50',
        '14:00-15:30',
        '15:40-17:10',
        '17:20-18:50'
      ],
      courses: [],
      showAddForm: false,
      newCourse: {
        day: '',
        time: '',
        name: '',
        classroom: '',
        teacher: ''
      }
    }
  },
  methods: {
    getCourse(day, time) {
      return this.courses.find(c => c.day === day && c.time === time)
    },
    selectCourse(day, time) {
      const existing = this.getCourse(day, time)
      if(existing) {
        if(confirm(`是否要删除 ${existing.name} 课程？`)) {
          this.courses = this.courses.filter(c => c !== existing)
        }
      }
    },
    addCourse() {
      this.courses.push({...this.newCourse})
      this.showAddForm = false
      this.resetForm()
    },
    resetForm() {
      this.newCourse = {
        day: '',
        time: '',
        name: '',
        classroom: '',
        teacher: ''
      }
    }
  }
}
</script>

<style scoped>
.timetable-container {
  max-width: 1200px;
  margin: 20px auto;
  padding: 20px;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.add-button {
  background: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.timetable-wrapper {
  overflow-x: auto;
}

.timetable {
  width: 100%;
  border-collapse: collapse;
  background: white;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12);
}

th, td {
  border: 1px solid #ddd;
  padding: 12px;
  text-align: center;
  min-width: 150px;
}

th {
  background-color: #f5f5f5;
  font-weight: bold;
}

.time-column {
  background-color: #f9f9f9;
  font-weight: bold;
}

.course-cell {
  height: 100px;
  cursor: pointer;
  transition: background-color 0.2s;
}

.course-cell:hover {
  background-color: #f0f0f0;
}

.has-course {
  background-color: #e3f2fd;
}

.course-info {
  padding: 8px;
}

.course-info h3 {
  margin: 0 0 5px;
  font-size: 16px;
  color: #2196F3;
}

.modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0,0,0,0.5);
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal-content {
  background: white;
  padding: 20px;
  border-radius: 8px;
  min-width: 400px;
}

.form-group {
  margin-bottom: 15px;
}

.form-group label {
  display: inline-block;
  width: 80px;
}

input, select {
  padding: 8px;
  width: 200px;
  border: 1px solid #ddd;
  border-radius: 4px;
}

.button-group {
  margin-top: 20px;
  display: flex;
  gap: 10px;
}
</style>