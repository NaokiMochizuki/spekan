const rank = {
  namespaced: true,

  state: {
    ranks: [],
    selectedRank: null
  },
  getters: {
    ranks(state){
      state.ranks
    },
    selectedRank(state){
      state.selectedRank
    }
  },
  actions: {
    setRanks(context, payload){
      context.commit('setRanks', payload)
    },
    setSelectedRank(context, payload){
      context.commit('setSelectedRank', payload)
    }
  },
  mutations: {
    setRanks(state, payload){
      state.ranks = payload
    },
    setSelectedRank(state, payload){
      state.selectedRank = payload
    }
  }
}

export default rank

