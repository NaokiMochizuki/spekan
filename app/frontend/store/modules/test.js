const test = {
  namespaced: true,
  state: {
    count: 0
  },
  getters: {
    count(state){
      state.count
    }
  },
  actions: {
    increment(context, payload){
      context.commit('increment')
    }
  },
  mutations: {
    increment(state){
      state.count++
    }
  }
}

export default test
