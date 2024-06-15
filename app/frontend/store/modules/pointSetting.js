const pointSetting = {
  namespaced: true,

  state: {
    pointSettingFormData: {
      is_valid: null,
      original_name: null,
      rate: null,
      valid_days: null
    },
    pointSettingFormErrorMsg: {
      is_valid: null,
      original_name: null,
      rate: null,
      valid_days: null
    },

  },
  getters: {
    pointSettingFormData(state){
      state.pointSettingFormData
    },
    pointSettingFormErrorMsg(state){
      state.pointSettingFormErrorMsg
    },
  },
  actions: {
    setPointSettingFormData(context, payload){
      context.commit('setPointSettingFormData', payload)
    },
    setPointSettingFormErrorMsg(context, payload){
      context.commit('setPointSettingFormErrorMsg', payload)
    },
  },
  mutations: {
    setPointSettingFormData(state, payload){
      state.pointSettingFormData = payload
    },
    setPointSettingFormErrorMsg(state, payload){
      state.pointSettingFormErrorMsg = payload
    },
  }
}

export default pointSetting
