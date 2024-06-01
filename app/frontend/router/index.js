import { createRouter, createWebHistory } from "vue-router";
import Layout from '../layouts/index.vue'
import { isAuthenticated } from './auth'
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
        meta: { requireAuth: true },
      },
      {
        path: 'users',
        name: 'ClientUserIndex',
        component: clientUserIndex,
        meta: { requireAuth: true },
      },
      {
        path: 'users/:id',
        name: 'ClientUserShow',
        component: clientUserShow,
        meta: { requireAuth: true },
      },
      {
        path: 'users/:id/edit',
        name: 'ClientUserEdit',
        component: clientUserEdit,
        meta: { requireAuth: true },
      },
      {
        path: 'ranks',
        name: 'ClientRankIndex',
        component: clientRankIndex,
        meta: { requireAuth: true },
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

// ナビゲーションガード
router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requireAuth)) {
    if (!isAuthenticated()) {
      localStorage.setItem("loggedInRequired", "true")
      next({
        path: '/client/sign_in',
      });
    } else {
      next()
    }
  } else {
    next()
  }
});

export default router
