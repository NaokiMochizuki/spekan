<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <multiselect1
    :show-labels="false"
    @select="onValueChanged"
    v-model="selectedValue"
    :options="selectableOptions"
    track-by="value"
    label="name" />
</template>

<script>
import { mapState, mapActions } from 'vuex'
import multiselect1 from 'vue-multiselect'
import { isEmpty } from '@/src/utils.js'
export default {
  name: 'SelectWithSearch',
  props: {
    id: String,
    currentVal: {
      type: String,
      default: () => ''
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
      selectedValue: this.currentVal,
      options: this.options,
    }
  },
  computed: {
    selectableOptions(){
      return !isEmpty(this.options) ? this.options : []
    },
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
  }

}
</script>

<style>
</style>


