const rank = {
  namespaced: true,

  state: {
    ranks: [],
  },
  getters: {
    ranks(state){
      state.ranks
    }
  },
  actions: {
    setRanks(context, payload){
      context.commit('setRanks', payload)
    }
  },
  mutations: {
    setRanks(state, payload){
      state.ranks = payload
    }
  }
}

export default rank

