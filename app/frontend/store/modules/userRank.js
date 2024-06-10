import rankAutomation from "./rankAutomation"

const userRank = {
  namespaced: true,

  state: {
    userRankFormData: {
      id: null,
      user_id: null,
      rank_id: null,
    },
  },
  getters: {
    userRankFormData(state){
      state.rankAutomationFormData
    },
  },
  actions: {
    setUserRankFormData(context, payload){
      context.commit('setUserRankFormData', payload)
    },
  },
  mutations: {
    setUserRankFormData(state, payload){
      state.userRankFormData = payload
    },
  }
}

export default userRank

