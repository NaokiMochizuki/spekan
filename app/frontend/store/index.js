import { createStore } from 'vuex'
import user from './modules/user.js'
import rank from './modules/rank.js'
import clientUser from './modules/clientUser.js'

const store = createStore({
  modules: {
    user,
    rank,
    clientUser
  }
})

export default store

