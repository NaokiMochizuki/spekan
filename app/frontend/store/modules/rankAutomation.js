const rankAutomation = {
  namespaced: true,

  state: {
    rankAutomationFormData: {
      before_rank_id: null,
      after_rank_id: null,
      automation_type: null,
      value: null,
      term: null,
    },
    rankAutomationFormErrorMsg: {
      before_rank_id: null,
      after_rank_id: null,
      automation_type: null,
      value: null,
      term: null,
    },
  },
  getters: {
    rankAutomationFormData(state){
      state.rankAutomationFormData
    },
    rankAutomationFormErrorMsg(state){
      state.rankAutomationFormErrorMsg
    },

  },
  actions: {
    setRankAutomationFormData(context, payload){
      context.commit('setRankAutomationFormData', payload)
    },
    setRankAutomationFormErrorMsg(context, payload){
      context.commit('setRankAutomationFormErrorMsg', payload)
    },
  },
  mutations: {
    setRankAutomationFormData(state, payload){
      state.rankAutomationFormData = payload
    },
    setRankAutomationFormErrorMsg(state, payload){
      state.rankAutomationFormErrorMsg = payload
    },
  }
}

export default rankAutomation
