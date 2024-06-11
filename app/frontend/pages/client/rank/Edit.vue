<template>
  <Pageheader heading="ランク編集"
    :breadcrumb='[
    {name: "Top", uri: "/client"},
    {name: "ランク一覧", uri: "/client/ranks"},
    {name: "ランク編集", uri: ""}]'
    iconClass="ti-crown">
  </Pageheader>
  <ToastAlert ref="toastAlertRef"/>
  <Loading v-show="isLoading" />

  <div class='row'>
    <div class="col-xl-6">
      <div class='card custom-card'>
        <div class="card-header justify-content-between">
          <div class="card-title">基本情報</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
          <form @submit.prevent="saveRankData">
            <div class='row mb-3'>
              <div class="col-md-6">
                <TextFieldWithIcon
                  id="inputName"
                  :currentVal="rankFormData['name']"
                  iconClass="fa-solid fa-crown"
                  labelText="名称"
                  :hasError="rankFormErrorMsg['name'] != null"
                  :errorMsg="rankFormErrorMsg['name']"
                  @onValueChanged="onNameChanged"/>
              </div>
            </div>
            <button class="btn btn-primary float-end" type="submit" :disabled="!isRankFormActive">保存</button>
          </form>
        </div>
      </div>
    </div>
    <div class="col-xl-6">
      <div class='card custom-card'>
        <div class="card-header justify-content-between">
          <div class="card-title">ランク自動昇格設定</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
          <form @submit.prevent="saveRankAutomationData">
          <div class='row'>
            <div class='col-md-12'>
              <RadioButton
                id="selectAutomationType"
                :currentVal="rankAutomationFormData['automation_type']"
                :selectables="selectableAutomationTypes"
                labelText="昇格判定基準"
                @onValueChanged="onAutomationTypeChanged"/>
            </div>
            <div v-show="rankAutomationFormData['automation_type'] != null">
              <div class='col-md-12 mt-3'>
                <DoubleNumberFieldWithDoubleText
                  :currentVal1="rankAutomationFormData['term']"
                  :currentVal2="rankAutomationFormData['value']"
                  :hasError1="rankAutomationFormErrorMsg['term'] != null"
                  :hasError2="rankAutomationFormErrorMsg['value'] != null"
                  :errorMsg1="rankAutomationFormErrorMsg['term']"
                  :errorMsg2="rankAutomationFormErrorMsg['value']"
                  :text1="termText"
                  :text2="valueText"
                  @onValue1Changed="onRankAutomationTermChanged"
                  @onValue2Changed="onRankAutomationValueChanged" />
              </div>
              <div class='col-md-12 mt-3'>
                <SelectWithSearch
                  id="selectAfterRankId"
                  :currentVal=selectedAfterRank
                  labelText="昇格後のランク"
                  :options="selectableAfterRanks"
                  @onValueChanged="onAfterRankChanged"/>
              </div>
            </div>
          </div>
          <button type="submit" class="btn btn-primary float-end mt-3" :disabled="!isRankAutomationFormActive">保存</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import { isEmpty } from '@/src/utils.js'
import Pageheader from "@/components/shared/PageHeader.vue"
import TextFieldWithIcon from "@/components/shared/form/TextFieldWithIcon.vue"
import SelectWithSearch from "@/components/shared/form/SelectWithSearch.vue"
import RadioButton from "@/components/shared/form/RadioButton.vue"
import DoubleNumberFieldWithDoubleText from "@/components/shared/form/DoubleNumberFieldWithDoubleText.vue"
import ToastAlert from '@/components/shared/ToastAlert.vue'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'clientRankEdit',
  components: { Pageheader, TextFieldWithIcon, SelectWithSearch, RadioButton, DoubleNumberFieldWithDoubleText, ToastAlert, Loading, SelectWithSearch },
  async mounted(){
    await this.fetchRank()
    await this.fetchRanks()
    await this.fetchSelectableAutomationTypes()
    this.isLoading = false
  },
  data(){
    return{
      isLoading: true,
      isRankFormActive: true,
      isRankAutomationFormActive: true,
      selectableAutomationTypes: [],
      selectableAfterRanks: [],
    }
  },
  computed: {
    // =========テキスト整形処理=========
    termText(){
      if(this.rankAutomationFormData.automation_type == 'total_amount'){
        return '日間の利用金額が'
      }else if(this.rankAutomationFormData.automation_type == 'checkin_count'){
        return '日間の来店回数が'
      }
    },
    valueText(){
      if(this.rankAutomationFormData.automation_type == 'total_amount'){
        return '円以上'
      }else if(this.rankAutomationFormData.automation_type == 'checkin_count'){
        return '回以上'
      }
    },
    // multiselect1用に選択された値を変換
    selectedAfterRank(){
      if(!isEmpty(this.rankAutomationFormData.after_rank_id) && !isEmpty(this.selectableAfterRanks)){
        return this.selectableAfterRanks.find(r => r.value == this.rankAutomationFormData.after_rank_id)
      }else{
        return {}
      }
    },
    // mapStateでVuexのstateを取得
    ...mapState({
      rankFormData: state => state.rank.rankFormData,
      rankFormErrorMsg: state => state.rank.rankFormErrorMsg,
      rankAutomationFormData: state => state.rankAutomation.rankAutomationFormData,
      rankAutomationFormErrorMsg: state => state.rankAutomation.rankAutomationFormErrorMsg
    })
  },
  methods: {
    //=====データ取得処理=====
    async fetchRank(){
      let url = `/api/client/ranks/${this.$route.params.id}`
      let res = await this.$axios.get(url)
      this.setRankFormData(res.data['rank'])
      this.setRankAutomationFormData(res.data['rank_automation'])
    },
    async fetchRanks(search={}) {
      try {
        const res = await this.$axios.get('/api/client/ranks', {
          params: {
            without_page: true,
          }
        })
        let d = res.data.ranks.filter(item => item.id !== this.rankFormData.id)
        this.selectableAfterRanks = d.map(r => ({ name: r.name, value: r.id }))
      } catch(e) {
        alert('ERROR')
      }
    },
    async fetchSelectableAutomationTypes(){
      let url = `/api/client/ranks/${this.$route.params.id}/selectable_automation_types`
      let res = await this.$axios.get(url)
      this.selectableAutomationTypes = res.data
    },
    //=====Validation処理=====
    async checkRankValidation(){
      let url = `/api/client/ranks/${this.$route.params.id}/is_valid`
      let res = await this.$axios.post(url, { rank: this.rankFormData })
      this.setRankFormErrorMsg(res.data.error_msg)
      this.checkRankFormActivation()
    },
    async checkRankAutomationValidation(){
      let url = `/api/client/ranks/${this.$route.params.id}/rank_automations/is_valid`
      let res = await this.$axios.post(url, { rank_automation: this.rankAutomationFormData })
      this.setRankAutomationFormErrorMsg(res.data.error_msg)
      this.checkRankAutomationFormActivation()
    },
    //=====Formの有効化処理=====
    checkRankFormActivation(){
      let hasError = Object.values(this.rankFormErrorMsg).some(value => value !== null)
      this.isRankFormActive = !hasError
    },
    checkRankAutomationFormActivation(){
      let hasError = Object.values(this.rankAutomationFormErrorMsg).some(value => value !== null)
      this.isRankAutomationFormActive = !hasError
    },
    //=====保存処理=====
    async saveRankData(){
      this.isLoading = true
      await this.checkRankValidation()
      if(this.isRankFormActive){
        let url = `/api/client/ranks/${this.$route.params.id}`
        let res = await this.$axios.patch(url, { rank: this.rankFormData })
        if(res.data.result){
          this.$refs.toastAlertRef.showSuccessToast('Success!', 'ランクの更新に成功しました')
        }else{
          this.$refs.toastAlertRef.showErrorToast(`Failed!', 'ランクの更新に失敗しました。${res.data.error_msg}`)
        }
        this.isLoading = false
      }
    },
    async saveRankAutomationData(){
      this.isLoading = true
      await this.checkRankAutomationValidation()
      if(this.isRankAutomationFormActive){
        let url
        let method
        if (this.rankAutomationFormData.id) {
          url = `/api/client/ranks/${this.$route.params.id}/rank_automations/${this.rankAutomationFormData.id}`
          method = 'patch'
        } else {
          url = `/api/client/ranks/${this.$route.params.id}/rank_automations`
          method = 'post'
        }
        let res = await this.$axios[method](url, { rank_automation: this.rankAutomationFormData })
        if(res.data.result){
          this.$refs.toastAlertRef.showSuccessToast('Success!', 'ランク自動昇格設定の更新に成功しました')
        }else{
          this.$refs.toastAlertRef.showErrorToast(`Failed!', 'ランク自動昇格設定の更新に失敗しました。${res.data.error_msg}`)
        }
        this.isLoading = false
      }
    },
    //=====Rankの値変更処理=====
    onNameChanged(val){
      let newObject = { ...this.rankFormData, name: val }
      this.setRankFormData(newObject)
    },
    onPointRateChanged(val){
      let newObject = { ...this.rankFormData, point_rate: val }
      this.setRankFormData(newObject)
    },
    onColorChanged(val){
      let newObject = { ...this.rankFormData, color: val['value'] }
      this.setRankFormData(newObject)
    },
    onIsDefaultChanged(val){
      let newObject = { ...this.rankFormData, is_default: val['value'] }
      this.setRankFormData(newObject)
    },
    //=====RankAutomationの値変更処理=====
    onAutomationTypeChanged(val){
      let newObject = { ...this.rankAutomationFormData, automation_type: val }
      this.setRankAutomationFormData(newObject)
    },
    onRankAutomationTermChanged(val){
      let newObject = { ...this.rankAutomationFormData, term: val }
      this.setRankAutomationFormData(newObject)
    },
    onRankAutomationValueChanged(val){
      let newObject = { ...this.rankAutomationFormData, value: val }
      this.setRankAutomationFormData(newObject)
    },
    onAfterRankChanged(val){
      let newObject = { ...this.rankAutomationFormData, after_rank_id: val['value'] }
      this.setRankAutomationFormData(newObject)
    },
    // mapActionsでVuexのactionを取得
    ...mapActions({
      setRankFormData: 'rank/setRankFormData',
      setRankFormErrorMsg: 'rank/setRankFormErrorMsg',
      setRankAutomationFormData: 'rankAutomation/setRankAutomationFormData',
      setRankAutomationFormErrorMsg: 'rankAutomation/setRankAutomationFormErrorMsg'
    })
  },
  watch: {
    rankFormData(newVal){
      this.checkRankValidation()
    },
    rankAutomationFormData(newVal){
      this.checkRankAutomationValidation()
    },
  }
}
</script>

<style>
</style>