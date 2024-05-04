import { createApp } from 'vue';
import store from '../store'
import DashboardIndex from '../pages/account/dashboard/Index.vue'

import '../stylesheets/application.scss';

const dashboardIndexPage = createApp(DashboardIndex)
dashboardIndexPage.use(store)
dashboardIndexPage.mount('#app')

