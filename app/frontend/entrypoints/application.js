// JS
import { createApp } from 'vue';
import store from '../store'
import router from '../router/'
import 'bootstrap/dist/js/bootstrap.bundle.js';
import Layout from '../layouts/index.vue'

// CSS
import '../stylesheets/application.scss';
import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { library } from "@fortawesome/fontawesome-svg-core";
import '@fortawesome/fontawesome-free'
library.add(fas, far, fab)

// Vueの適応
const accountPage = createApp(Layout)
accountPage.use(store)
accountPage.use(router)
accountPage.mount('#app')

