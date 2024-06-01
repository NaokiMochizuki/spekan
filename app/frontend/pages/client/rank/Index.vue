<template>
  <Loading v-show="isLoading" />
  <Pageheader
    heading="ランク一覧"
    :breadcrumb='[
    {name: "Top", uri: "/client"},
    {name: "ランク一覧", uri: "/client/ranks"}]'
    iconClass="ti-crown">
  </Pageheader>

  <div class="row row-sm">
    <div class="col-xl-12">
      <div class="card custom-card">
        <div class="card-header justify-content-between">
          <div class="card-title">
          </div>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table text-nowrap">
              <thead>
                <tr>
                  <th scope="col"><input class="form-check-input" type="checkbox" id="checkboxNoLabel" value=""
                      aria-label="..."></th>
                  <th scope="col">ランク名</th>
                  <th scope="col">ランクカラー</th>
                  <th scope="col">ポイント還元率</th>
                  <th scope="col">初期ランク</th>
                  <th scope="col">適応人数</th>
                  <th scope="col">自動昇格設定</th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(rank, index) in ranks" :key="rank.id">
                  <th scope="row">
                    <input class="form-check-input" type="checkbox" id="checkboxNoLabel1" value="" aria-label="...">
                  </th>
                  <td>{{rank.name}}</td>
                  <td>{{rank.color}}</td>
                  <td>{{rank.point_rate}}%</td>
                  <td>{{rank.is_default ? 'YES' : ''}}</td>
                  <td>{{rank.users_count}}名</td>
                  <td>まだ未設定</td>
                  <td>
                    <div class="hstack gap-2 fs-15">
                      <a href="javascript:void(0);"
                        class="btn btn-icon btn-sm btn-success-transparent rounded-pill"
                        @click="moveToShowPage(rank.id)">
                        <i class="ri-file-list-line"></i>
                      </a>
                      <a href="javascript:void(0);"
                        class="btn btn-icon btn-sm btn-info-transparent rounded-pill"
                        @click="moveToEditPage(rank.id)">
                        <i class="ri-edit-line"></i>
                      </a>
                      <a href="javascript:void(0);"
                        class="btn btn-icon btn-sm btn-danger-transparent rounded-pill"
                        @click="onDelete(rank)">
                        <i class="ri-delete-bin-line"></i>
                      </a>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <Pagination :page="page" @onPageChange="onPageChange" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import axios from 'axios'
import Pageheader from '@/components/shared/PageHeader.vue'
import Pagination from '@/components/shared/Pagination.vue'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'clientRankIndex',
  components: { Pageheader, Loading, Pagination },
  async mounted(){
    await this.fetchRanks()
    this.isLoading = false
  },
  data() {
    return {
      page: {
        current: 1,
        total: 1,
      },
      isLoading: true,
    }
  },
  computed: {
    ...mapState('rank', ['ranks']),
  },
  methods: {
    async fetchRanks(search={}) {
      try {
        const res = await axios.get('/api/client/ranks', {
          params: {
            page: this.page.current,
          }
        })
        this.page.current = res.data.pagination.current_page
        this.page.total = res.data.pagination.total_pages
        await this.setRanks(res.data.ranks)
      } catch {
        alert('ERROR')
      }
    },
    moveToShowPage(rankId){
      this.$router.push({ path: `/client/ranks/${rankId}` })
    },
    moveToEditPage(rankId){
      this.$router.push({ path: `/client/ranks/${rankId}/edit` })
    },
    onDelete(rank){
      if(confirm(`ID: ${rank.id}: ${rank.name}を削除します(ランク適応済みの顧客がいる場合、削除後初期ランクが適応されます) よろしいですか？`)){
        //TODO: ここで削除処理
      }
    },
    onPageChange(newPage){
      this.page.current = newPage
      this.fetchRanks()
    },
    ...mapActions('rank', ['setRanks'])
  }

}
</script>

<style>
</style>
