<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <div class="form-check" v-for="(option, index) in selectables" :key="index">
    <input
      class="form-check-input"
      :id="'radioOption' + (index+1)"
      type="radio"
      name="radioButton"
      :value="option.value"
      @change='onValueChanged'
      v-model="selectedValue">
    <label class="form-check-label" :for="'radioOption' + (index+1)">
      {{option['name']}}
    </label>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'CusotmRadioButton',
  emits: ['onValueChanged'],
  props: ['id', 'currentVal', 'selectables', 'labelText', 'placeholder'],
  data(){
    return{
      selectedValue: null,
    }
  },
  computed: {
  },
  methods: {
    onValueChanged(e){
      this.selectedValue = e.target.value
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


