const user = {
  namespaced: true,

  state: {
    users: [],
    selectedUser: null,
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
    selectedUser(state){
      state.selectedUser
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
    setSelectedUser(context, payload){
      context.commit('setSelectedUser', payload)
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
    setSelectedUser(state, payload){
      state.selectedUser = payload
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
