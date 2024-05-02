import { createApp } from 'vue';
import store from '../store'
import DashboardIndex from '../pages/account/dashboard/Index.vue'

const dashboardIndexPage = createApp(DashboardIndex)
dashboardIndexPage.use(store)
dashboardIndexPage.mount('#app')

