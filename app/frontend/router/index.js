import { createRouter, createWebHistory } from "vue-router";
import Layout from '../layouts/index.vue'
import Authentication from '../layouts/authentication.vue'
import clientDashbordIndex from '../pages/client/dashboard/Index.vue'
import clientUserIndex from '../pages/client/user/Index.vue'
import clientUserShow from '../pages/client/user/Show.vue'
import clientUserEdit from '../pages/client/user/Edit.vue'
import clientRankIndex from '../pages/client/rank/Index.vue'
import clientSessionNew from '../pages/client/session/New.vue'
import clientSessionForgetPassword from '../pages/client/session/ForgetPassword.vue'

const routes = [
  {
    path: '/client',
    component: Layout,
    children: [
      {
        path: '',
        name: 'ClientDashboard',
        component: clientDashbordIndex,
      },
      {
        path: 'users',
        name: 'ClientUserIndex',
        component: clientUserIndex,
      },
      {
        path: 'users/:id',
        name: 'ClientUserShow',
        component: clientUserShow,
      },
      {
        path: 'users/:id/edit',
        name: 'ClientUserEdit',
        component: clientUserEdit,
      },
      {
        path: 'ranks',
        name: 'ClientRankIndex',
        component: clientRankIndex,
      },
    ]
  },
  {
    path: '/client/sign_in',
    component: Authentication,
    children: [
      {
        path: '',
        name: 'ClientSessionNew',
        component: clientSessionNew,
      },
    ],
  },
  {
    path: '/client/forget_password',
    component: Authentication,
    children: [
      {
        path: '',
        name: 'ClientSessionForgetPassword',
        component: clientSessionForgetPassword,
      },
    ],
  },

]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
