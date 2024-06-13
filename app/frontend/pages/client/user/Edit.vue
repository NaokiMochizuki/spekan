<template>
  <Pageheader heading="顧客編集"
    :breadcrumb='[
    {name: "Top", uri: "/client"},
    {name: "顧客一覧", uri: "/client/users"},
    {name: "顧客編集", uri: ""}]'
    iconClass="ti-user">
  </Pageheader>
  <ToastAlert ref="toastAlertRef"/>
  <Loading v-show="isLoading" />

  <div class="col-xl-12">
    <div class='card custom-card'>
      <div class="card-header justify-content-between">
        <div class="card-title">基本情報</div>
      </div>
      <div class='card-body' style='padding-inline: 1.563rem;'>
        <form @submit.prevent="saveUserData">
          <div class='row mb-3'>
            <div class="col-md-4">
              <TextFieldWithIcon
                id="inputName"
                :currentVal="userFormData['name']"
                iconClass="ri-user-line"
                labelText="名前"
                :hasError="userFormErrorMsg['name'] != null"
                :errorMsg="userFormErrorMsg['name']"
                @onValueChanged="onNameChanged"/>
            </div>
            <div class="col-md-4">
              <TextFieldWithIcon
                id="inputEmail"
                :currentVal="userFormData['email']"
                iconClass="ri-mail-line"
                labelText="メールアドレス"
                :hasError="userFormErrorMsg['email'] != null"
                :errorMsg="userFormErrorMsg['email']"
                @onValueChanged="onEmailChanged"/>
            </div>
            <div class="col-md-4">
              <SelectWithSearch
                id="selectDefaultPayway"
                :currentVal="selectedDefaultPayway"
                labelText="支払い方法"
                :options="selectableDefaultPayways"
                @onValueChanged="onDefaultPaywayChanged"/>
            </div>
          </div>
          <button class="btn btn-primary float-end" type="submit" :disabled="!isUserFormActive">保存</button>
        </form>
      </div>
    </div>
  </div>
  <div class='row'>
    <div class="col-xl-6">
      <div class='card custom-card'>
        <div class="card-header justify-content-between">
          <div class="card-title">ランク変更</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
          <form @submit.prevent="saveRankData">
            <div class='row'>
              <div class="col-md-12 mb-3">
                <label class="form-label fs-14">現在のランク</label>
                <p>{{ this.currentRankName }}</p>
              </div>
              <div class="col-md-12 mb-3">
                <SelectWithSearch
                  id="selectRankId"
                  labelText="変更後のランク"
                  placeholder="変更後のランクを選択してください"
                  :options="selectableRanks"
                  @onValueChanged="onRankChanged"/>
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
          <div class="card-title">ポイント付与</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
          <form @submit.prevent="getPoint">
            <div class='row'>
              <div class="col-md-12 mb-3">
                <label class="form-label fs-14">現在のポイント</label>
                <p>{{ currentPoint }}</p>
              </div>
              <div class="col-md-12 mb-3">
                <NumberFieldWithText
                  id="inputPoint"
                  text="ポイント付与する"
                  :currentVal="point"
                  labelText="付与するポイント"
                  @onValueChanged="onPointChanged"/>
              </div>
            </div>
            <button class="btn btn-primary float-end" type="submit" :disabled="!isPointFormActive">実行</button>
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
import NumberFieldWithText from "@/components/shared/form/NumberFieldWithText.vue"
import SelectWithSearch from "@/components/shared/form/SelectWithSearch.vue"
import ToastAlert from '@/components/shared/ToastAlert.vue'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'clientUserEdit',
  components: { Pageheader, TextFieldWithIcon, NumberFieldWithText, SelectWithSearch, ToastAlert, Loading },
  async mounted(){
    await this.fetchSelectableDefaultPayways()
    await this.fetchUser()
    await this.fetchSelectableRanks()
    this.isLoading = false
  },
  data(){
    return{
      isLoading: true,
      isUserFormActive: true,
      isRankFormActive: false,
      isPointFormActive: false,
      selectableDefaultPayways: [],
      currentRank: null,
      selectableRanks: [],
      point: 0
    }
  },
  computed: {
    selectedDefaultPayway(){
      if(!isEmpty(this.userFormData.default_payway) && !isEmpty(this.selectableDefaultPayways)){
        return this.selectableDefaultPayways.find(pw => pw.value == this.userFormData.default_payway)
      }else{
        return {}
      }
    },
    currentRankName(){
      return isEmpty(this.currentRank) ? '未登録' : this.currentRank['name']
    },
    currentPoint(){
      return isEmpty(this.userFormData) ? '-' : this.userFormData['point']
    },
    ...mapState({
      userFormData: state => state.user.userFormData,
      userFormErrorMsg: state => state.user.userFormErrorMsg,
      userRankFormData: state => state.userRank.userRankFormData,
    })
  },
  methods: {
    //=====データ取得処理=====
    async fetchUser(){
      let url = `/api/client/users/${this.$route.params.id}`
      let res = await this.$axios.get(url)
      this.setUserFormData(res.data['user'])
      this.setUserRankFormData(res.data['user_rank'])
      this.currentRank = res.data['rank']
    },
    async fetchSelectableRanks(){
      let url = `/api/client/ranks`
      let res = await this.$axios.get(url)
      let d = res.data.ranks.filter(item => item.id !== this.userRankFormData.rank_id)
      this.selectableRanks = d.map(r => ({ name: r.name, value: r.id }))
    },
    async fetchSelectableDefaultPayways(){
      let url = `/api/client/users/${this.$route.params.id}/selectable_default_payways`
      let res = await this.$axios.get(url)
      this.selectableDefaultPayways = res.data
    },
    
    //=====Validation処理=====
    async checkUserValidation(){
      let url = `/api/client/users/${this.$route.params.id}/is_valid`
      let res = await this.$axios.post(url, { user: this.userFormData })
      this.setUserFormErrorMsg(res.data.error_msg)
      this.checkUserFormActivation()
    },
    //=====Formの有効化処理=====
    checkUserFormActivation(){
      let hasError = Object.values(this.userFormErrorMsg).some(value => value !== null)
      this.isUserFormActive = !hasError
    },
    //=====保存処理=====
    async saveUserData(){
      this.isLoading = true
      await this.checkUserValidation()
      if(this.isUserFormActive){
        let url = `/api/client/users/${this.$route.params.id}`
        let res = await this.$axios.patch(url, { user: this.userFormData })
        if(res.data.result){
          this.$refs.toastAlertRef.showSuccessToast('Success!', '顧客の更新に成功しました')
        }else{
          this.$refs.toastAlertRef.showErrorToast('Failed!', '顧客の更新に失敗しました')
        }
        this.isLoading = false
      }
    },
    async saveRankData(){
      this.isLoading = true
      if(this.isRankFormActive){
        let url = `/api/client/users/${this.$route.params.id}/user_ranks/${this.userRankFormData.id}`
        let res = await this.$axios.patch(url, { user_rank: this.userRankFormData })
        if(res.data.result){
          await this.fetchUser()
          await this.fetchSelectableRanks()
          this.$refs.toastAlertRef.showSuccessToast('Success!', 'ランクの更新に成功しました')
        }else{
          this.$refs.toastAlertRef.showErrorToast('Failed!', `ランクの更新に失敗しました。 ${res.data.error_msg}`)
        }
      }
      this.isLoading = false
    },
    async getPoint(){
      this.isLoading = true
      if(this.isPointFormActive){
        let url = `/api/client/users/${this.$route.params.id}/get_point`
        let res = await this.$axios.post(url,
         { point: { value: this.point } }
        )
        if(res.data.result){
          await this.fetchUser()
          this.$refs.toastAlertRef.showSuccessToast('Success!', 'ポイント付与に成功しました')
          this.point = 0
        }else{
          this.$refs.toastAlertRef.showErrorToast('Failed!', `ポイント付与時にエラーが発生しました。 ${res.data.error_msg}`)
        }
      }
      this.isLoading = false
    },
    //=====Userの値変更処理=====
    onNameChanged(val){
      let newObject = { ...this.userFormData, name: val }
      this.setUserFormData(newObject)
    },
    onEmailChanged(val){
      let newObject = { ...this.userFormData, email: val }
      this.setUserFormData(newObject)
    },
    onDefaultPaywayChanged(val){
      let newObject = { ...this.userFormData, default_payway: val['value'] }
      this.setUserFormData(newObject)
    },
    //=====Rankの値変更処理=====
    onRankChanged(val){
      let newObject = { ...this.userRankFormData, rank_id: val['value'], user_id: this.$route.params.id}
      this.setUserRankFormData(newObject)
      this.isRankFormActive = !isEmpty(this.userRankFormData['rank_id'])
    },
    //=====Pointの値変更処理=====
    onPointChanged(val){
      this.point = val
      this.isPointFormActive = val > 0
    },
    ...mapActions({
      setUserFormData: 'user/setUserFormData',
      setUserFormErrorMsg: 'user/setUserFormErrorMsg',
      setUserRankFormData: 'userRank/setUserRankFormData',
    })
  },
  watch: {
    userFormData(newVal){
      this.checkUserValidation()
    },
  }
}
</script>

<style>
</style>

