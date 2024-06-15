<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
	<div class="input-group mb-3">
		<input 
      type="number"
      class="form-control"
      :class="{ 'is-invalid': hasError }"
      v-model="inputedValue"
      :min="min"
      :step="step"
      @change="onValueChanged"
      :placeholder="placeholder">
		<span class="input-group-text">{{text}}</span>
    <div class="invalid-feedback" v-show="hasError">
      {{errorMsg}}
    </div>
	</div>
</template>

<script>
export default {
  name: 'NumberFieldWithText',
  emits: ['onValueChanged'],
  props: {
    id: {
      type: String,
      default: '',
    },  
    labelText: {
      type: String,
      default: '',
    },   
    currentVal: {
      type: String,
      default: '',
    },
    hasError: {
      type: Boolean,
      default: false,
    },
    errorMsg: {
      type: String,
      default: '',
    },
    placeholder: {
      type: String,
      default: '',
    },
    text: {
      type: String,
      default: '',
    },
    min: {
      type: Number,
      default: 0,
    },
    step: {
      type: Number,
      default: 1,
    },
  },
  data(){
    return{
      inputedValue: null,
    }
  },
  methods: {
    onValueChanged(){
      this.$emit('onValueChanged', this.inputedValue)
    },
  },
  watch: {
    currentVal(newVal){
      this.inputedValue = newVal
    },
  }

}
</script>

<style>
</style>