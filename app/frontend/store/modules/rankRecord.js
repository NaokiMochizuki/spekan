const rankRecord = {
  namespaced: true,

  state: {
    rankRecords: [],
  },
  getters: {
    rankRecords(state){
      state.rankRecords
    },
  },
  actions: {
    setRankRecords(context, payload){
      context.commit('setRankRecords', payload)
    },
  },
  mutations: {
    setRankRecords(state, payload){
      state.rankRecords = payload
    },
  }
}

export default rankRecord