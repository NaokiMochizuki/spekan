console.log('Vite ⚡️ Rails')

import { createApp } from 'vue';
import DashboardIndex from './pages/account/dashboard/Index.vue'

const dashboardIndexPage = createApp(DashboardIndex)
dashboardIndexPage.mount('#app')
