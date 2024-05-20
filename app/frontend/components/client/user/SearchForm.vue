<template>
  <div class="row row-sm mb-5">
    <div class="accordion accordion-primary" id="accordionSearchForm">
      <div class="accordion-item">
          <h2 class="accordion-header" id="headingSearchForm">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#collapseSearchForm" aria-expanded="false"
                  aria-controls="collapseSearchForm">
                  検索
              </button>
          </h2>
          <div id="collapseSearchForm" class="accordion-collapse collapse"
              aria-labelledby="headingSearchForm" data-bs-parent="#accordionSearchForm">
              <div class="accordion-body">
                <div class='row'>
                  <div class="col-md-5 mb-3">
                      <label for="searchform-name" class="form-label fs-14">名前</label>
                      <div class="input-group">
                        <div class="input-group-text">
                          <i class="ri-user-line"></i>
                        </div>
                        <input type="text" class="form-control" id="searchform-email" placeholder="" v-model="search.name">
                      </div>
                  </div>
                  <div class="col-md-5 mb-3">
                      <label for="searchform-email" class="form-label fs-14">メールアドレス</label>
                      <div class="input-group">
                        <div class="input-group-text">
                          <i class="ri-mail-line"></i>
                        </div>
                        <input type="text" class="form-control" id="searchform-email" placeholder="" v-model="search.email">
                      </div>
                  </div>
                </div>
                <div class='row'>
                  <div class="col-md-12">
                    <button class="btn btn-primary float-end" type="submit" @click="fetchUsers">検索</button>
                  </div>
                </div>
              </div>
          </div>
      </div>
    </div>
  </div>


</template>

<script>
export default {
  name: 'clientUserIndexSearchForm',
  data() {
    return {
      search: {
        name: null,
        email: null,
      },
    }
  },
  methods: {
    fetchUsers(){
      this.$emit('fetchUsers', this.search)
    }
  }
}
</script>

<style>
</style>
