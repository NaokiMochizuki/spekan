// JS
import { createApp } from 'vue';
import store from '../store'
import router from '../router/'
import Layout from '../layouts/index.vue'

// CSS
import '../stylesheets/application.scss';

// Vueの適応
const accountPage = createApp(Layout)
accountPage.use(store)
accountPage.use(router)
accountPage.mount('#app')

