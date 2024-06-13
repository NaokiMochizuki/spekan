const pointRecord = {
  namespaced: true,

  state: {
    pointRecords: [],
  },
  getters: {
    pointRecords(state){
      state.pointRecords
    },
  },
  actions: {
    setPointRecords(context, payload){
      context.commit('setPointRecords', payload)
    },
  },
  mutations: {
    setPointRecords(state, payload){
      state.pointRecords = payload
    },
  }
}

export default pointRecord