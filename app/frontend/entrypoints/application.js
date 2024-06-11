// JS
import { createApp, watch } from 'vue'
import store from '../store'
import router from '../router/'
import 'bootstrap/dist/js/bootstrap.bundle.js'
import simplebar from 'simplebar-vue'
import axios from 'axios'
import App from './App.vue'

// CSS
import '../stylesheets/application.scss'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { library } from "@fortawesome/fontawesome-svg-core"
import '@fortawesome/fontawesome-free'
library.add(fas, far, fab)
import 'simplebar-vue/dist/simplebar.min.css'

// Vueの適応
const app = createApp(App)
app.component("simplebar", simplebar)
app.use(store)
app.use(router)

let csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken
app.config.globalProperties.$axios = axios

watch(
  () => store.state.clientUser.authToken,
  (newToken) => {
    if (newToken) {
      axios.defaults.headers.common['Authorization'] = `Bearer ${newToken}`
    } else {
      delete axios.defaults.headers.common['Authorization']
    }
  },
  { immediate: true }
)

app.mount('#app')