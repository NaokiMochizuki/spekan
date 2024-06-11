<template>  
  <div>検索フォーム</div>
</template>

<script>
export default {
  name: 'clientRankRecordIndexSearchForm',
  data() {
    return {
      search: {
        name: null,
        before_rank_id: null,
        after_rank_id: null,
      },
    }
  },
  methods: {
    fetchRankRecords(){
      this.$emit('fetchRankRecords', this.search)
    }
  }
}
</script>

<style>
</style>

