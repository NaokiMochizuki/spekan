<template>
  <Pageheader heading="入力項目登録"
    :breadcrumb='[
    {name: "Top", uri: "/client"},
    {name: "入力項目登録", uri: "/client/user_items/new"}]'
    iconClass="ti-list">
  </Pageheader>
  <ToastAlert ref="toastAlertRef"/>
  <Loading v-show="isLoading" />
  <div class="row">
    <div class="col-xl-6">
      <div class='card custom-card'>
        <div class="card-header justify-content-between">
          <div class="card-title">基本情報</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
          <ul class="crypto-transcation list-unstyled mg-b-0 mt-3">
            <li v-for="userItem in defaultUserItems" :key=userItem.id class="list-item mb-2 px-2 mt-2 pb-2">
              <div class="media align-items-center">
                <div class="media-body ms-3">
                  <Switcher
                    :id="`default-user-item-${userItem.id}`"
                    :itemText="userItem.name"
                    :currentVal="userItem.is_active"
                    :itemId="userItem.id"
                    @onValueChanged="onDefaultUserItemChanged" />
                </div>
              </div>
              <div class="text-end ms-auto my-auto me-2">
                <Checkbox
                  :id="`id-required-user-item-${userItem.id}`"
                  labelText="必須"
                  :currentVal="userItem.required"
                  :itemId="userItem.id"
                  @onValueChanged="onIsRequiredChanged" />
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-xl-6">
      <div class='card custom-card'>
        <div class="card-header justify-content-between">
          <div class="card-title">独自項目</div>
        </div>
        <div class='card-body' style='padding-inline: 1.563rem;'>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Pageheader from "@/components/shared/PageHeader.vue"
import ToastAlert from '@/components/shared/ToastAlert.vue'
import Switcher from '@/components/shared/form/Switcher.vue'
import Checkbox from '@/components/shared/form/Checkbox.vue'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'UserItemNew',
  components: { Pageheader, ToastAlert, Loading, Switcher, Checkbox },
  data(){
    return{
      isLoading: false,
      defaultUserItems: [],
      originalUserItems: []
    }
  },
  async mounted(){
    this.isLoading = true
    await this.fetchDefaultUserItems()
    this.isLoading = false
  },
  computed: {
  },
  methods: {
    //=====データ取得処理=====
    async fetchDefaultUserItems(){
      let url = `/api/client/user_items/default_items`
      let res = await this.$axios.get(url)
      this.defaultUserItems = res.data.user_items
    },
    //=====Userの値変更処理=====
    onDefaultUserItemChanged(val){
      let newObject = this.defaultUserItems.map(item => 
        item.id == val.id ? { ...item, is_active: val.is_active } : item
      )
      this.defaultUserItems = newObject
      console.log(this.defaultUserItems)
    },
    onIsRequiredChanged(val){
      let newObject = this.defaultUserItems.map(item => 
        item.id == val.id ? { ...item, required: val.required } : item
      )
      this.defaultUserItems = newObject
      console.log(this.defaultUserItems)
    },
  },  
}
</script>

<style></style>