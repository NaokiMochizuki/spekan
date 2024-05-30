const user = {
  namespaced: true,

  state: {
    users: [],
    userFormData: {
      name: null,
      email: null,
      default_payway: null,
    },
    userFormErrorMsg: {
      name: null,
      email: null,
      default_payway: null,
    },

  },
  getters: {
    users(state){
      state.users
    },
    userFormData(state){
      state.userFormData
    },
    userFormErrorMsg(state){
      state.userFormErrorMsg
    },
  },
  actions: {
    setUsers(context, payload){
      context.commit('setUsers', payload)
    },
    setUserFormData(context, payload){
      context.commit('setUserFormData', payload)
    },
    setUserFormErrorMsg(context, payload){
      context.commit('setUserFormErrorMsg', payload)
    },
  },
  mutations: {
    setUsers(state, payload){
      state.users = payload
    },
    setUserFormData(state, payload){
      state.userFormData = payload
    },
    setUserFormErrorMsg(state, payload){
      state.userFormErrorMsg = payload
    },
  }
}

export default user
