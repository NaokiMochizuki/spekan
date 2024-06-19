import axios from 'axios';

const clientUser = {
  namespaced: true,

  state: {
    authedClientUser: null,
    authToken: null
  },

  getters: {
    authedClientUser(state){
      state.authedClientUser
    },
    authToken(state){
      state.authToken
    }
  },
  actions: {
    setAuthedClientUser(context, payload){
      context.commit('setAuthedClientUser', payload)
    },
    setAuthToken(context, payload){
      context.commit('setAuthToken', payload)
    },
    //TODO: storeに値を入れるとなぜか消えちゃうので、localStorageに入れている。いずれ直す
    async login(context, payload){
      let loginUrl = `/api/client/sign_in`
      let loginRes = await axios.post(loginUrl, payload)
      context.commit('setAuthToken', loginRes.data.token)
      localStorage.authToken = loginRes.data.token
      let meUrl = `/api/client/client_users/me`
      let meRes = await axios.get(meUrl)
      let jsonMe = JSON.stringify(meRes.data)
      localStorage.authedClientUser = jsonMe
      context.commit('setAuthedClientUser', meRes.data)
    },
    logout(context){
      localStorage.removeItem("authToken")
      localStorage.removeItem("authedClientUser")
      context.commit('setAuthedClientUser', null)
      context.commit('setAuthToken', null)
      context.commit('setAuthedClientUser', null)
    },

    // async fetchAuthedClientUser(context){
    //   if (!localStorage.authToken) return null
    //   if (state.authedClientUser) return state.authedClientUser
    //   let url = `/api/client/client_users/me`
    //   let res = await this.$axios.get(url).catch((e) => {
    //     return null
    //   })
    //   authedClientUser = res.data
    //   if(authedClientUser){
    //     context.commit('setAuthedClientUser', authedClientUser)
    //     return authedClientUser
    //   } else {
    //     context.commit('setAuthedClientUser', null)
    //     return null
    //   }
    // },
  },
  mutations: {
    setAuthedClientUser(state, payload){
      state.authedClientUser = payload
    },
    setAuthToken(state, payload){
      state.authToken = payload
    }
  }
}

export default clientUser
