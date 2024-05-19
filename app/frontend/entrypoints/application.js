// JS
import { createApp } from 'vue';
import store from '../store'
import router from '../router/'
import 'bootstrap/dist/js/bootstrap.bundle.js';
import simplebar from 'simplebar-vue';
import App from './App.vue'

// CSS
import '../stylesheets/application.scss';
import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { library } from "@fortawesome/fontawesome-svg-core";
import '@fortawesome/fontawesome-free';
library.add(fas, far, fab);
import 'simplebar-vue/dist/simplebar.min.css';

// Vueの適応
const app = createApp(App)
app.component("simplebar", simplebar)
app.use(store)
app.use(router)
app.mount('#app')

