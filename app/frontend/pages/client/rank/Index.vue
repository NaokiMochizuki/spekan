<template>
  <Pageheader heading="ランク一覧" :maintitle='["Top", "ランク一覧"]'></Pageheader>


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
          <div class="float-end mt-3">
            <nav aria-label="Page navigation" class="pagination-style-3">
              <ul class="pagination mb-0 flex-wrap">
                <li class="page-item disabled">
                  <a class="page-link" href="javascript:void(0);">
                    Prev
                  </a>
                </li>
                <li class="page-item active"><a class="page-link" href="javascript:void(0);">1</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                <li class="page-item">
                  <a class="page-link" href="javascript:void(0);">
                    <i class="bi bi-three-dots"></i>
                  </a>
                </li>
                <li class="page-item"><a class="page-link" href="javascript:void(0);">16</a></li>
                <li class="page-item">
                  <a class="page-link text-primary" href="javascript:void(0);">
                    next
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import axios from 'axios'
import Pageheader from '../../../components/shared/pageheader/pageheader.vue'
export default {
  name: 'clientRankIndex',
  components: { Pageheader },
  async mounted(){
    await this.fetchRanks()
  },
  data() {
    return {
    }
  },
  computed: {
    ...mapState('rank', ['ranks']),
  },
  methods: {
    async fetchRanks() {
      try {
        const res = await axios.get('/api/client/ranks')
        this.setRanks(res.data)
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
    ...mapActions('rank', ['setRanks'])
  }

}
</script>

<style>
</style>
