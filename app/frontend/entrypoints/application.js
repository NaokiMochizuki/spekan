// JS
import { createApp } from 'vue';
import store from '../store'
import DashboardIndex from '../pages/account/dashboard/Index.vue'

// CSS
import '../stylesheets/application.scss';


// Vueの適応
const dashboardIndexPage = createApp(DashboardIndex)
dashboardIndexPage.use(store)
dashboardIndexPage.mount('#app')

