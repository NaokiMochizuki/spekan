import { createStore } from 'vuex'
import user from './modules/user.js'
import userRank from './modules/userRank.js'
import rank from './modules/rank.js'
import rankAutomation from './modules/rankAutomation.js'
import clientUser from './modules/clientUser.js'

const store = createStore({
  modules: {
    user,
    userRank,
    rank,
    rankAutomation,
    clientUser
  }
})

export default store
