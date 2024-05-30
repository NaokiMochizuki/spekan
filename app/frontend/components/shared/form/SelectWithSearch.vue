<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <multiselect1 :show-labels="false" @select="onValueChanged" v-model="selectedValue"
      :options="options" track-by="value" label="name"></multiselect1>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import multiselect1 from 'vue-multiselect';
export default {
  name: 'SelectWithSearch',
  props: ['id', 'currentVal', 'selectableOptions', 'labelText', 'placeholder'],
  components: { multiselect1 },
  data(){
    return{
      selectedValue: null,
      options: this.selectableOptions,
    }
  },
  methods: {
    onValueChanged(e){
      this.selectedValue = e
      this.$emit('onValueChanged', this.selectedValue)
    },
  },
  watch: {
    currentVal(newVal){
      let option = this.selectableOptions.find(m => m.value == newVal)
      this.selectedValue = { value: newVal, name: option['name'] }
    },
    selectableOptions(newVal){
      this.options = newVal
    },
  }

}
</script>

<style>
</style>


