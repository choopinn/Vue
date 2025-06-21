import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'login',
      component: () => import('../views/LoginView.vue'),
    },
    {
      path: '/user',
      name: 'user',
      component: () => import('../views/UserView.vue'),
      children: [
        {
          path: '/userhome',
          name: 'userhome',
          component: () => import('../views/UserHome.vue'),
        },
        {
          path: '/userinfo',
          name: 'userinfo',
          component: () => import('../views/UserInfo.vue'),
        },
        {
          path: '/useritinerary',
          name: 'useritinerary',
          component: () => import('../views/UserItinerary.vue'),
        },
        {
          path: '/weather',
          name: 'weather',
          component: () => import('../views/weather.vue'),
        },
      ]
    },
    {
      path: '/regist',
      name: 'regist',
      component: () => import('../views/RegistView.vue'),
    },
    {
      path: '/manager',
      name: 'manager',
      component: () => import('../views/ManagerView.vue'),
      children: [
        {
          path: '/managersetting',
          name: 'managersetting',
          component: () => import('../views/ManagersettingView.vue'),
        },
        {
          path: '/managerhome',
          name: 'managerhome',
          component: () => import('../views/ManagerHome.vue'),
        },
        {
          path: '/managerinfo',
          name: 'managerinfo',
          component: () => import('../views/ManagerInfo.vue'),
        }
      ]

    },
    {
      path: '/managerload',
      name: 'managerload',
      component: () => import('../views/ManagerLoad.vue'),
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue'),
    },
  ],
})

export default router
