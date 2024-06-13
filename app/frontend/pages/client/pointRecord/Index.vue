<template>
  <Loading v-show="isLoading" />
  <Pageheader heading="ポイント増減履歴"
    :breadcrumb='[
    {name: "Top", uri: "/client"},
    {name: "ポイント増減履歴", uri: "/client/point_records"}]'
    iconClass="fas fa-history">
  </Pageheader>
  <ToastAlert ref="toastAlertRef"/>

  <SearchForm @fetchPointRecords="fetchPointRecords"/>

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
                  <th scope="col">顧客名</th>
                  <th scope="col">会員番号</th>
                  <th scope="col">増減</th>
                  <th scope="col">ポイント数</th>
                  <th scope="col">日時</th>
                  <th scope="col">理由</th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="pointRecord in pointRecords" :key="pointRecord.id">
                  <th scope="row">
                    <input class="form-check-input" type="checkbox" id="checkboxNoLabel1" value="" aria-label="...">
                  </th>
                  <td>
                    <div class="d-flex align-items-center">
                      <span class="avatar avatar-xs me-2 online avatar-rounded">
                        <img src="../../../images/template/faces/3.jpg" alt="img">
                      </span>{{ pointRecord.user_name }}
                    </div>
                  </td>
                  <td>ABCDEFG</td>
                  <td>2023年9月15日</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
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
import SearchForm from '@/components/client/pointRecord/SearchForm.vue'
import Pagination from '@/components/shared/Pagination.vue'
import ToastAlert from '@/components/shared/ToastAlert.vue'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'clientPointRecordIndex',
  components: { Pageheader, SearchForm, Pagination, ToastAlert, Loading },
  async mounted(){
    await this.fetchPointRecords()
    this.isLoading = false
  },
  data() {
    return {
      page: {
        current: 1,
        total: 1,
      },
      search: {
        user_name: '',
      },
      isLoading: true,
    }
  },
  computed: {
    ...mapState('pointRecord', ['pointRecords']),
  },
  methods: {
    async fetchPointRecords(search={}) {
      this.isLoading = true
      try {
        const res = await axios.get('/api/client/point_records', {
          params: {
            user_name: search.user_name,
            page: this.page.current,
          }
        })
        this.page.current = res.data.pagination.current_page
        this.page.total = res.data.pagination.total_pages
        this.setPointRecords(res.data.point_records)
      } catch {
        alert('ERROR')
      }
      this.isLoading = false
    },
    // Paginationからの参照メソッド
    onPageChange(newPage){
      this.page.current = newPage
      this.fetchPointRecords()
    },
    ...mapActions('pointRecord', ['setPointRecords'])
  }

}
</script>

<style>
</style>