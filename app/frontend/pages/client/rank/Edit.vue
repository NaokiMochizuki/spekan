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
          <div class='row'>
          </div>
          <button class="btn btn-primary float-end" type="submit">保存</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import Pageheader from "@/components/shared/PageHeader.vue"
import TextFieldWithIcon from "@/components/shared/form/TextFieldWithIcon.vue"
import SelectWithSearch from "@/components/shared/form/SelectWithSearch.vue"
import ToastAlert from '@/components/shared/ToastAlert.vue'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'clientRankEdit',
  components: { Pageheader, TextFieldWithIcon, SelectWithSearch, ToastAlert, Loading },
  async mounted(){
    await this.fetchRank()
    this.isLoading = false
  },
  data(){
    return{
      isLoading: true,
      isRankFormActive: true,
    }
  },
  computed: {
    ...mapState('rank', ['rankFormData', 'rankFormErrorMsg']),
  },
  methods: {
    async fetchRank(){
      let url = `/api/client/ranks/${this.$route.params.id}`
      let res = await this.$axios.get(url)
      this.setRankFormData(res.data['rank'])
    },
    async checkRankValidation(){
      let url = `/api/client/ranks/${this.$route.params.id}/is_valid`
      let res = await this.$axios.post(url, { rank: this.rankFormData })
      this.setRankFormErrorMsg(res.data.error_msg)
      this.checkRankFormActivation()
    },
    checkRankFormActivation(){
      let hasError = Object.values(this.rankFormErrorMsg).some(value => value !== null)
      this.isRankFormActive = !hasError
    },
    async saveRankData(){
      this.isLoading = true
      await this.checkRankValidation()
      if(this.isRankFormActive){
        let url = `/api/client/ranks/${this.$route.params.id}`
        let res = await this.$axios.patch(url, { rank: this.rankFormData })
        console.log(res.data)
        if(res.data.result){
          this.$refs.toastAlertRef.showSuccessToast('Success!', 'ランクの更新に成功しました')
        }else{
          this.$refs.toastAlertRef.showErrorToast(`Failed!', 'ランクの更新に失敗しました。${res.data.error_msg}`)
        }
        this.isLoading = false
      }
    },
    onNameChanged(val){
      let newObject = { ...this.rankFormData, name: val }
      this.setRankFormData(newObject)
      console.log()
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
    ...mapActions('rank', ['setRankFormData', 'setRankFormErrorMsg'])
  },
  watch: {
    rankFormData(newVal){
      this.checkRankValidation()
    }
  }
}
</script>

<style>
</style>


