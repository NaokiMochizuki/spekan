<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <multiselect1
    :show-labels="false"
    @select="onValueChanged"
    v-model="selectedValue"
    :options="selectableOptions"
    :placeholder="placeholder"
    track-by="value"
    label="name">

    <template #noResult>
      <span>該当する検索結果が存在しません</span>
    </template>
    <template #noOptions>
      <span>選択肢が存在しません</span>
    </template>
  </multiselect1>
</template>

<script>
import multiselect1 from 'vue-multiselect'
export default {
  name: 'SelectWithSearch',
  emits: ['onValueChanged'],
  props: {
    id: String,
    currentVal: {
      type: Object,
      default: () => {}
    },
    options: {
      type: Array,
      default: () => []
    },
    labelText: String,
    placeholder: String
  },
  components: { multiselect1 },
  data(){
    return{
      selectedValue: {},
      selectableOptions: [],
    }
  },
  computed: {
  },
  methods: {
    onValueChanged(e){
      this.selectedValue = e
      this.$emit('onValueChanged', this.selectedValue)
    },
  },
  watch: {
    currentVal(newVal){
      this.selectedValue = newVal
    },
    options(newVal){
      this.selectableOptions = newVal
    },
  }

}
</script>

<style>
</style>


