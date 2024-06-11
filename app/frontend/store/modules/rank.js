const rank = {
  namespaced: true,

  state: {
    ranks: [],
    selectedRank: null,
    rankFormData: {
      name: null,
      point_rate: null,
      is_default: null,
      color: null
    },
    rankFormErrorMsg: {
      name: null,
      point_rate: null,
      is_default: null,
      color: null
    },
  },
  getters: {
    ranks(state){
      state.ranks
    },
    selectedRank(state){
      state.selectedRank
    },
    rankFormData(state){
      state.userFormData
    },
    rankFormErrorMsg(state){
      state.userFormErrorMsg
    },

  },
  actions: {
    setRanks(context, payload){
      context.commit('setRanks', payload)
    },
    setSelectedRank(context, payload){
      context.commit('setSelectedRank', payload)
    },
    setRankFormData(context, payload){
      context.commit('setRankFormData', payload)
    },
    setRankFormErrorMsg(context, payload){
      context.commit('setRankFormErrorMsg', payload)
    },
  },
  mutations: {
    setRanks(state, payload){
      state.ranks = payload
    },
    setSelectedRank(state, payload){
      state.selectedRank = payload
    },
    setRankFormData(state, payload){
      state.rankFormData = payload
    },
    setRankFormErrorMsg(state, payload){
      state.rankFormErrorMsg = payload
    },
  }
}

export default rank

