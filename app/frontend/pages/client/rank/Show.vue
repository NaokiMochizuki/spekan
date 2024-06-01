<template>
  <Pageheader heading="ランク詳細"
    :breadcrumb='[
    {name: "Top", uri: "/client"},
    {name: "ランク一覧", uri: "/client/ranks"},
    {name: "ランク詳細", uri: ""}]'
    iconClass="ti-crown">
  </Pageheader>
  <Loading v-show="isLoading" />

  <div class="row row-sm">
    <div class="col-xl-3 col-lg-12 col-md-12">
      <div class="card custom-card">
        <div class="card-body text-center item-user">
          <div class="profile-pic">
            <a href="javascript:;" class="text-dark">
              <h5 class="mt-3 mb-0 fw-semibold">{{rankName}}</h5>
            </a>
          </div>
        </div>

        <div class="">
          <div class="panel panel-primary tabs-style-4">
            <div class="tab-menu-heading w-100">
              <div class="tabs-menu">
                <!-- Tabs -->
                <ul class="item1-links nav nav-tabs mb-0">
                  <li class="nav-item">
                    <a href="#basic" class="nav-link active" data-bs-toggle="tab">
                      <i class="ti-user icon1 float-start"></i>基本情報</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#rankAutomation" data-bs-toggle="tab">
                      <i class="ti-save-alt icon1 float-start"></i>自動昇格設定</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#users" data-bs-toggle="tab">
                      <i class="ti-truck icon1 float-start"></i>ランク適応中顧客一覧</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#menus" data-bs-toggle="tab">
                      <i class="ti-heart icon1 float-start"></i>選択可能なメニュー</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#subscriptions" data-bs-toggle="tab">
                      <i class="ti-wallet icon1 float-start"></i>選択可能な月額メニュー</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-9 col-lg-12 col-md-12">
      <div class="card custom-card">
        <div class="card-body">
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active p-0" id="basic" role="tabpanel">
              1
            </div>

            <div class="tab-pane fade p-0" id="rankAutomation" role="tabpanel">
              2
            </div>

            <div class="tab-pane fade p-0" id="users" role="tabpanel">
              3
            </div>

            <div class="tab-pane fade p-0" id="menus" role="tabpanel">
              4
            </div>

            <div class="tab-pane fade p-0" id="subscriptions" role="tabpanel">
              5
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import Pageheader from "@/components/shared/PageHeader.vue"
import Loading from "@/components/shared/Loading.vue"
export default {
  name: 'clientUserShow',
  components: { Pageheader, Loading },
  async mounted(){
    await this.fetchRank()
    this.isLoading = false
  },
  data() {
    return {
      isLoading: true
    }
  },
  computed: {
    rankName(){
      return this.selectedRank == null ? '' : this.selectedRank.name
    },
    ...mapState('rank', ['selectedRank']),
  },
  methods: {
    async fetchRank(){
      let url = `/api/client/ranks/${this.$route.params.id}`
      let res = await this.$axios.get(url)
      this.setSelectedRank(res.data['rank'])
    },
    ...mapActions('rank', ['setSelectedRank'])
  }

}
</script>

<style scoped></style>

