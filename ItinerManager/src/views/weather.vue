<template>
    <div class="weather-container">
      <!-- 搜索栏 -->
      <div class="search-bar">
        <input 
          type="text" 
          v-model="city" 
          placeholder="输入城市名称"
          @keyup.enter="getWeather"
        >
        <button @click="getWeather">
          <i class="fas fa-search"></i>
        </button>
      </div>
  
      <!-- 主要天气信息 -->
      <div class="weather-main">
        <!-- 当前天气 -->
        <div class="current-weather">
          <h2>{{ currentWeather.name }}</h2>
          <div class="weather-card">
            <div class="weather-icon">
              {{ getWeatherEmoji(currentWeather.weather) }}
            </div>
            <div class="temp">{{ currentWeather.temp }}°C</div>
            <div class="description">{{ currentWeather.weather }}</div>
            <div class="details">
              <p>湿度: {{ currentWeather.humidity }}%</p>
              <p>风速: {{ currentWeather.windSpeed }} m/s</p>
            </div>
          </div>
        </div>
  
        <!-- 天气预报 -->
        <div class="forecast">
          <h3>7日预报</h3>
          <div class="forecast-list">
            <div 
              v-for="(day, index) in forecast" 
              :key="index" 
              class="forecast-item"
            >
              <div class="day">{{ day.day }}</div>
              <div class="emoji">{{ day.emoji }}</div>
              <div class="temp-range">
                {{ day.maxTemp }}° / {{ day.minTemp }}°
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
 export default {
  data() {
    return {
      city: '北京',
      currentWeather: {
        name: '北京',
        temp: 25,
        weather: '晴',
        humidity: 60,
        windSpeed: 3.5
      },
      forecast: []
    }
  },
  mounted() {
    this.generateMockData();
  },
  methods: {
    getWeather() {
      if (!this.city.trim()) return;
      this.generateMockData();
    },
      
      generateMockData() {
        // 生成当前天气模拟数据
        this.currentWeather = {
          name: this.city,
          temp: this.getRandomTemp(20, 30),
          weather: this.getRandomWeather(),
          humidity: this.getRandomNumber(40, 80),
          windSpeed: this.getRandomNumber(1, 5).toFixed(1)
        };
  
        // 生成7天预报数据
        this.forecast = Array.from({length:7}, (_,i) => ({
          day: `周${['日','一','二','三','四','五','六'][(new Date().getDay()+i)%7]}`,
          emoji: this.getWeatherEmoji(this.getRandomWeather()),
          maxTemp: this.getRandomTemp(25, 35),
          minTemp: this.getRandomTemp(18, 25)
        }));
      },
  
      getRandomTemp(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
      },
  
      getRandomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
      },
  
      getRandomWeather() {
        const types = ['晴', '多云', '阴', '小雨', '雷阵雨'];
        return types[Math.floor(Math.random() * types.length)];
      },
  
      getWeatherEmoji(weather) {
        const emojiMap = {
          '晴': '☀️',
          '多云': '⛅',
          '阴': '☁️',
          '小雨': '🌧️',
          '雷阵雨': '⛈️'
        };
        return emojiMap[weather] || '🌍';
      }
    }
  }
  </script>
  
  <style scoped>
  .weather-container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    font-family: Arial, sans-serif;
  }
  
  .search-bar {
    display: flex;
    gap: 10px;
    margin-bottom: 30px;
  }
  
  .search-bar input {
    flex: 1;
    padding: 12px;
    border: 2px solid #007bff;
    border-radius: 25px;
    font-size: 16px;
  }
  
  .search-bar button {
    padding: 12px 20px;
    background: #007bff;
    border: none;
    border-radius: 25px;
    color: white;
    cursor: pointer;
  }
  
  .weather-main {
    background: #f8f9fa;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  }
  
  .current-weather {
    text-align: center;
    margin-bottom: 30px;
  }
  
  .weather-card {
    background: white;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  }
  
  .weather-icon {
    font-size: 4em;
    margin: 15px 0;
  }
  
  .temp {
    font-size: 48px;
    font-weight: bold;
    color: #2c3e50;
    margin: 10px 0;
  }
  
  .description {
    color: #666;
    margin-bottom: 15px;
    font-size: 20px;
  }
  
  .details {
    display: flex;
    justify-content: center;
    gap: 20px;
    color: #555;
  }
  
  .forecast-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
    gap: 15px;
    margin-top: 20px;
  }
  
  .forecast-item {
    background: white;
    padding: 15px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  }
  
  .emoji {
    font-size: 2em;
    margin: 10px 0;
  }
  
  .temp-range {
    color: #e74c3c;
    font-weight: bold;
  }
  </style>