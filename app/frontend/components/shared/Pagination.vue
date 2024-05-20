<template>
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
</template>

<script>
export default {
  name: 'pagination',
  props: {
    page: {
      type: Object,
    }
  },
  methods: {
    onPageChange(nextPage){
      this.$emit('onPageChange', nextPage)
    },
  },
}
</script>

<style>
</style>
