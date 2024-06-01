import axios from 'axios';

const clientUser = {
  namespaced: true,

  state: {
    authedClientUser: null,
    authToken: null
  },

  getters: {
    authedClientUser(state){
      state.authClientUser
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
    async login(context, payload){
      let loginUrl = `/api/client/sign_in`
      let loginRes = await axios.post(loginUrl, payload)
      context.commit('setAuthToken', loginRes.data.token)
      localStorage.authToken = loginRes.data.token
      //TODO: $axiosのheaderにtokenを入れ込む処理
      let meUrl = `/api/client/users/me`
      let meRes = await axios.get(meUrl)
      context.commit('setAuthedClientUser', meRes.data)
    },
    logout(context){
      localStorage.removeItem("authToken")
      context.commit('setAuthedClientUser', null)
      context.commit('setAuthToken', null)
      //TODO: $axiosのheaderからtokenを削除する処理
      context.commit('setAuthedClientUser', null)
    },
    async fetchAuthedClientUser(context){
      if (!localStorage.authToken) return null
      if (state.authUser) return state.authUser
      let url = `/api/client/users/me`
      let res = await this.$axios.get(url).catch((e) => {
        return null
      })
      if (res) return null
      authedClientUser = res.data
      if(authedClientUser){
        context.commit('setAuthedClientUser', authedClientUser)
        return authedClientUser
      } else {
        context.commit('setAuthedClientUser', null)
        return null
      }
    },
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
