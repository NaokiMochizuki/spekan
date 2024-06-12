<template>
  <div class="row row-sm mb-5">
    <div class="accordion accordion-primary" id="accordionSearchForm">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingSearchForm">
          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
            data-bs-target="#collapseSearchForm" aria-expanded="false" aria-controls="collapseSearchForm">
            検索
          </button>
        </h2>
        <div id="collapseSearchForm" class="accordion-collapse collapse" aria-labelledby="headingSearchForm"
          data-bs-parent="#accordionSearchForm">
          <div class="accordion-body">
            <form @submit.prevent="fetchUsers">
              <div class='row'>
                <div class="col-md-5 mb-3">
                  <TextFieldWithIcon id="inputName" :currentVal="search.name" iconClass="ri-user-line" labelText="名前"
                    @onValueChanged="onNameChanged" />
                </div>
                <div class="col-md-5 mb-3">
                  <TextFieldWithIcon id="inputEmail" :currentVal="search.email" iconClass="ri-mail-line"
                    labelText="メールアドレス" @onValueChanged="onEmailChanged" />
                </div>
              </div>
              <div class='row'>
                <div class="col-md-12">
                  <button class="btn btn-primary float-end" type="submit">検索</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import TextFieldWithIcon from "@/components/shared/form/TextFieldWithIcon.vue"
export default {
  name: 'clientUserIndexSearchForm',
  components: { TextFieldWithIcon },
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
    },
    onNameChanged(val){
      this.search.name = val
    },
    onEmailChanged(val){
      this.search.email = val
    }
  }
}
</script>

<style>
</style>
