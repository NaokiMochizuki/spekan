<template>
  <Pageheader heading="ポイント設定"
    :breadcrumb='[
    {name: "Top", uri: "/client"},
    {name: "ポイント設定", uri: "/client/point_setting"}]'
    iconClass="ti-settings">
  </Pageheader>
  <ToastAlert ref="toastAlertRef"/>
  <Loading v-show="isLoading" />

  <div class="col-xl-12">
    <div class='card custom-card'>
      <div class='card-body' style='padding-inline: 1.563rem;'>
        <form @submit.prevent="savePointSettingData">
          <div class='row mb-3'>
            <div class="col-md-4">
              <ToggleSwitch 
                labelText='ポイントの有効化'
                id="isPointSettingValid"
                customClass="toggle-danger"
                :isOn="pointSettingFormData.is_valid"
                @onValueChanged="onIsValidChanged"/>
            </div>
          </div>
          <div class='row mb-3'>
            <div class="col-md-6">
              <TextField 
                id="inputOriginalName"
                :currentVal="pointSettingFormData['original_name']"
                labelText='ポイント名称'
                placeholder="独自のポイント名称を使用する場合は入力してください"
                :hasError="pointSettingFormErrorMsg['original_name'] != null"
                :errorMsg="pointSettingFormErrorMsg['original_name']"
                @onValueChanged="onOriginalNameChanged"/>
            </div>
          </div>
          <div class='row mb-3'>
            <div class="col-md-3">
              <NumberFieldWithText 
                id="inputRate"
                :currentVal="String(pointSettingFormData['rate'])"
                labelText='ポイント還元率'
                text="%還元"
                :step="0.1"
                :hasError="pointSettingFormErrorMsg['rate'] != null"
                :errorMsg="pointSettingFormErrorMsg['rate']"
                @onValueChanged="onRateChanged"/>
            </div>  
            <div class="col-md-3">
              <NumberFieldWithText 
                id="inputValidDays"
                :currentVal="String(pointSettingFormData['valid_days'])"
                labelText='ポイント有効期間'
                text="日間有効"
                :hasError="pointSettingFormErrorMsg['valid_days'] != null"
                :errorMsg="pointSettingFormErrorMsg['valid_days']"
                @onValueChanged="onValidDaysChanged"/>
            </div>  
          </div>
          <button class="btn btn-primary float-end" type="submit" :disabled="!isPointSettingFormActive">保存</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import Pageheader from "@/components/shared/PageHeader.vue"
import ToggleSwitch from "@/components/shared/form/ToggleSwitch.vue"
import TextField from "@/components/shared/form/TextField.vue"
import NumberFieldWithText from "@/components/shared/form/NumberFieldWithText.vue"
import ToastAlert from '@/components/shared/ToastAlert.vue'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'clientPointSettingEdit',
  components: { Pageheader, ToggleSwitch, NumberFieldWithText, TextField, ToastAlert, Loading },
  async mounted(){
    this.fetchPointSetting()
    this.isLoading = false
  },
  data(){
    return{
      isLoading: true,
      isPointSettingFormActive: true,
    }
  },
  computed: {
    ...mapState({
      pointSettingFormData: state => state.pointSetting.pointSettingFormData,
      pointSettingFormErrorMsg: state => state.pointSetting.pointSettingFormErrorMsg,
    })
  },
  methods: {
    //=====データ取得処理=====
    async fetchPointSetting(){
      let url = `/api/client/point_settings`
      let res = await this.$axios.get(url)
      this.setPointSettingFormData(res.data['point_setting'])
    },
    //=====保存処理=====
    async savePointSettingData(){
      this.isLoading = true
      await this.checkPointSettingValidation()
      if(this.isPointSettingFormActive){
        let url = `/api/client/point_settings`
        let res = await this.$axios.patch(url, { point_setting: this.pointSettingFormData })
        if(res.data.result){
          this.$refs.toastAlertRef.showSuccessToast('Success!', 'ポイント設定の更新に成功しました')
        }else{
          this.$refs.toastAlertRef.showErrorToast('Failed!', 'ポイント設定の更新に失敗しました')
        }
        this.isLoading = false
      }
    },
    //=====Validation処理=====
    async checkPointSettingValidation(){
      let url = `/api/client/point_settings/is_valid`
      let res = await this.$axios.post(url, { point_setting: this.pointSettingFormData })
      this.setPointSettingFormErrorMsg(res.data.error_msg)
      this.checkPointSettingFormActivation()
    },
    //=====Formの有効化処理=====
    checkPointSettingFormActivation(){
      let hasError = Object.values(this.pointSettingFormErrorMsg).some(value => value !== null)
      this.isPointSettingFormActive = !hasError
    },
    //======値の変更===========
    onIsValidChanged(val){
      let newObject = { ...this.pointSettingFormData, is_valid: val }
      this.setPointSettingFormData(newObject)
    },
    onOriginalNameChanged(val){
      let newObject = { ...this.pointSettingFormData, original_name: val }
      this.setPointSettingFormData(newObject)
    },
    onRateChanged(val){
      let newObject = { ...this.pointSettingFormData, rate: val }
      this.setPointSettingFormData(newObject)
    },
    onValidDaysChanged(val){
      let newObject = { ...this.pointSettingFormData, valid_days: val }
      this.setPointSettingFormData(newObject)
    },
    ...mapActions({
      setPointSettingFormData: 'pointSetting/setPointSettingFormData',
      setPointSettingFormErrorMsg: 'pointSetting/setPointSettingFormErrorMsg',
    })
  },
  watch: {
    pointSettingFormData(newVal){
      this.checkPointSettingValidation()
    },
  }
}
</script>

<style>
</style>


