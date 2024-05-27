const user = {
  namespaced: true,

  state: {
    users: [],
    formData: {
      name: null,
      email: null,
    }
  },
  getters: {
    users(state){
      state.users
    },
    formData(state){
      state.formData
    }

  },
  actions: {
    setUsers(context, payload){
      context.commit('setUsers', payload)
    },
    setFormData(context, payload){
      context.commit('setFormData', payload)
    }
  },
  mutations: {
    setUsers(state, payload){
      state.users = payload
    },
    setFormData(state, payload){
      state.formData = payload
    }
  }
}

export default user
