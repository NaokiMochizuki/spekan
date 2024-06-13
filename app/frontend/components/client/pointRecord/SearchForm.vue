<template>
  <div class="row row-sm mb-5">
    <div class="accordion accordion-primary" id="accordionSearchForm">
      <div class="accordion-item">
        <h2 class="accordion-header" id="headingSearchForm">
          <button 
            class="accordion-button collapsed"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#collapseSearchForm" 
            aria-expanded="false" 
            aria-controls="collapseSearchForm">
            検索
          </button>
        </h2>
        
        <div id="collapseSearchForm" class="accordion-collapse collapse" aria-labelledby="headingSearchForm"
          data-bs-parent="#accordionSearchForm">
          <div class="accordion-body">
            <form @submit.prevent="fetchPointRecords">
              <div class='row'>
                <div class="col-md-5 mb-3">
                  <TextFieldWithIcon
                    id="inputUserName" 
                    :currentVal="search.user_name" 
                    iconClass="ri-user-line"
                    labelText="顧客名" 
                    @onValueChanged="onUserNameChanged" />
                </div>
                <div class="col-md-5 mb-3">
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
  name: 'clientPointRecordIndexSearchForm',
  components: { TextFieldWithIcon },
  data() {
    return {
      search: {
        user_name: null,
      },
    }
  },
  methods: {
    fetchPointRecords(){
      this.$emit('fetchPointRecords', this.search)
    },
    onUserNameChanged(val){
      this.search.user_name = val
    },
  }
}
</script>

<style>
</style>


