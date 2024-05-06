import { createRouter, createWebHistory } from "vue-router";
import Layout from '../layouts/index.vue'
import accountDashbordIndex from '../pages/account/dashboard/Index.vue'

const routes = [
  {
    component: Layout,
    children: [
      {
        path: '/account',
        redirect: '/account/dashboards',
        component: accountDashbordIndex,
      },
      {
        path: '/account/dashboards',
        component: accountDashbordIndex,
      },
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
