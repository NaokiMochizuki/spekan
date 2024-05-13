import { createRouter, createWebHistory } from "vue-router";
import Layout from '../layouts/index.vue'
import clientDashbordIndex from '../pages/client/dashboard/Index.vue'
import clientUserIndex from '../pages/client/user/Index.vue'
import clientUserShow from '../pages/client/user/Show.vue'

const routes = [
  {
    component: Layout,
    children: [
      {
        path: '/client',
        name: 'ClientDashboard',
        component: clientDashbordIndex,
      },
      {
        path: '/client/users',
        name: 'ClientUserIndex',
        component: clientUserIndex,
      },
      {
        path: '/client/users/:id',
        name: 'ClientUserShow',
        component: clientUserShow,
      },
    ]
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
