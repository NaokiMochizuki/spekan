import { createStore } from 'vuex'
import user from './modules/user.js'
import rank from './modules/rank.js'

const store = createStore({
  modules: {
    user,
    rank
  }
})

export default store

