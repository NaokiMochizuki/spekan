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
          <div class='row'>
            <div class="col-md-5 mb-3">
            </div>
            <div class="col-md-5 mb-3">
            </div>
          </div>
          <button class="btn btn-primary float-end" type="submit">保存</button>
        </div>
      </div>
    </div>
    <div class="col-xl-6">
      <div class='card custom-card'>
        <div class="card-header justify-content-between">
          <div class="card-title">ポイント付与</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
          <div class='row'>
            <div class="col-md-5 mb-3">
            </div>
            <div class="col-md-5 mb-3">
            </div>
          </div>
          <button class="btn btn-primary float-end" type="submit" >保存</button>
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
import ToastAlert from '@/components/shared/ToastAlert.vue'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'clientUserEdit',
  components: { Pageheader, TextFieldWithIcon, SelectWithSearch, ToastAlert, Loading },
  async mounted(){
    await this.fetchSelectableDefaultPayways()
    await this.fetchUser()
    this.isLoading = false
  },
  data(){
    return{
      isLoading: true,
      isUserFormActive: true,
      selectableDefaultPayways: [],
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
    ...mapState('user', ['userFormData', 'userFormErrorMsg']),
  },
  methods: {
    async fetchUser(){
      let url = `/api/client/users/${this.$route.params.id}`
      let res = await this.$axios.get(url)
      this.setUserFormData(res.data['user'])
    },
    async fetchSelectableDefaultPayways(){
      let url = `/api/client/users/${this.$route.params.id}/selectable_default_payways`
      let res = await this.$axios.get(url)
      this.selectableDefaultPayways = res.data
    },
    async checkUserValidation(){
      let url = `/api/client/users/${this.$route.params.id}/is_valid`
      let res = await this.$axios.post(url, { user: this.userFormData })
      this.setUserFormErrorMsg(res.data.error_msg)
      this.checkUserFormActivation()
    },
    checkUserFormActivation(){
      let hasError = Object.values(this.userFormErrorMsg).some(value => value !== null)
      this.isUserFormActive = !hasError
    },
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
    saveRankData(){
    },
    savePointData(){
    },
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
    ...mapActions('user', ['setUserFormData', 'setUserFormErrorMsg'])
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

