<template>
  <Pageheader heading="顧客一覧"
    :breadcrumb='[
    {name: "Top", uri: "/client"},
    {name: "顧客一覧", uri: "/client/users"}]'>
  </Pageheader>

  <SearchForm @fetchUsers="fetchUsers"/>

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
                  <th scope="col">メールアドレス</th>
                  <th scope="col">保有ポイント数</th>
                  <th scope="col">ランク</th>
                  <th scope="col">登録日</th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(user, index) in users" :key="user.id">
                  <th scope="row">
                    <input class="form-check-input" type="checkbox" id="checkboxNoLabel1" value="" aria-label="...">
                  </th>
                  <td>
                    <div class="d-flex align-items-center">
                      <span class="avatar avatar-xs me-2 online avatar-rounded">
                        <img src="../../../images/template/faces/3.jpg" alt="img">
                      </span>{{user.name}}
                    </div>
                  </td>
                  <td>ABCDEFG</td>
                  <td>{{user.email}}</td>
                  <td>3333</td>
                  <td>
                    <span class="badge bg-primary-transparent">Team Lead</span>
                  </td>
                  <td>2023年9月15日</td>
                  <td>
                    <div class="hstack gap-2 fs-15">
                      <a href="javascript:void(0);"
                        class="btn btn-icon btn-sm btn-success-transparent rounded-pill"
                        @click="moveToShowPage(user.id)">
                        <i class="ri-file-list-line"></i>
                      </a>
                      <a href="javascript:void(0);"
                        class="btn btn-icon btn-sm btn-info-transparent rounded-pill"
                        @click="moveToEditPage(user.id)">
                        <i class="ri-edit-line"></i>
                      </a>
                      <a href="javascript:void(0);"
                        class="btn btn-icon btn-sm btn-danger-transparent rounded-pill"
                        @click="onDelete(user)">
                        <i class="ri-delete-bin-line"></i>
                      </a>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="float-end mt-3">
            <nav aria-label="Page navigation" class="pagination-style-3" v-if="page.total != 1">
              <ul class="pagination mb-0 flex-wrap">
                <li class="page-item" :class="{ disabled: page.current == 1 }">
                  <a class="page-link" href="javascript:void(0);" @click="onPageChange(page.current - 1)">
                    前へ
                  </a>
                </li>
                <li class="page-item" v-if="page.current - 2 > 1">
                  <a class="page-link" href="javascript:void(0);" @click="onPageChange(1)">1</a>
                </li>
                <span v-if="page.current - 3 > 1">...</span>
                <li class="page-item" v-if="page.current - 2 >= 1">
                  <a class="page-link" href="javascript:void(0);" @click="onPageChange(page.current - 2)">{{page.current - 2}}</a>
                </li>
                <li class="page-item" v-if="page.current - 1 >= 1">
                  <a class="page-link" href="javascript:void(0);" @click="onPageChange(page.current - 1)">{{page.current - 1}}</a>
                </li>
                <li class="page-item">
                  <a class="page-link active" href="javascript:void(0);" @click="onPageChange(page.current)">{{page.current}}</a>
                </li>
                <li class="page-item" v-if="page.current + 1 <= page.total">
                  <a class="page-link" href="javascript:void(0);" @click="onPageChange(page.current + 1)">{{page.current + 1}}</a>
                </li>
                <li class="page-item" v-if="page.current + 2 <= page.total">
                  <a class="page-link" href="javascript:void(0);" @click="onPageChange(page.current + 2)">{{page.current + 2}}</a>
                </li>
                <span v-if="page.total > page.current + 3">...</span>
                <li class="page-item" v-if="page.total >= page.current + 3">
                  <a class="page-link" href="javascript:void(0);" @click="onPageChange(page.total)">{{page.total}}</a>
                </li>
                <li class="page-item" :class="{ disabled: page.total == page.current }">
                  <a class="page-link text-primary" href="javascript:void(0);" @click="onPageChange(page.current + 1)">
                    次へ
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
import SearchForm from '../../../components/client/user/SearchForm.vue'
export default {
  name: 'clientUserIndex',
  components: { Pageheader, SearchForm },
  async mounted(){
    await this.fetchUsers()
  },
  data() {
    return {
      page: {
        current: 1,
        total: 1,
      }
    }
  },
  computed: {
    ...mapState('user', ['users']),
  },
  methods: {
    async fetchUsers(search={}) {
      try {
        const res = await axios.get('/api/client/users', {
          params: {
            name: search.name,
            email: search.email,
            page: this.page.current,
          }
        })
        this.page.current = res.data.pagination.current_page
        this.page.total = res.data.pagination.total_pages
        this.setUsers(res.data.users)
      } catch {
        alert('ERROR')
      }
    },
    moveToShowPage(userId){
      this.$router.push({ path: `/client/users/${userId}` })
    },
    moveToEditPage(userId){
      this.$router.push({ path: `/client/users/${userId}/edit` })
    },
    onDelete(user){
      if(confirm(`ID: ${user.id}: ${user.name}を削除します(今後の予約は全て自動で削除され、未精算金額がある場合は即時引き落としがかかります。) よろしいですか？`)){
        //TODO: ここで削除処理
      }
    },
    //TODO: ここからページネーション処理、後で別コンポーネントに切り出し
    onPageChange(page){
      this.page.current = page
      this.fetchUsers()
    },
    ...mapActions('user', ['setUsers'])
  }

}
</script>

<style>
</style>

