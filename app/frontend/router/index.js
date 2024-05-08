import { createRouter, createWebHistory } from "vue-router";
import Layout from '../layouts/index.vue'
import accountDashbordIndex from '../pages/account/dashboard/Index.vue'
import accountUserIndex from '../pages/account/user/Index.vue'

const routes = [
  {
    component: Layout,
    children: [
      {
        path: '/account',
        name: 'AccountDashboard',
        component: accountDashbordIndex,
      },
      {
        path: '/account/users',
        name: 'AccountUser',
        component: accountUserIndex,
      },
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
