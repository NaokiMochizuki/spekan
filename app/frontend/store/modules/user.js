const user = {
  namespaced: true,

  state: {
    users: [],
  },
  getters: {
    users(state){
      state.users
    }
  },
  actions: {
    setUsers(context, payload){
      context.commit('setUsers', payload)
    }
  },
  mutations: {
    setUsers(state, payload){
      state.users = payload
    }
  }
}

export default user
