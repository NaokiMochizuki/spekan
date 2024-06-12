<template>
	<div class="input-group mb-3">
		<input 
      type="number"
      min="0"
      class="form-control"
      :class="{ 'is-invalid': hasError }"
      v-model="inputedValue"
      @change="onValueChanged"
      :placeholder="placeholder">
    <div class="invalid-feedback" v-show="hasError">
      {{errorMsg}}
    </div>
	</div>
</template>

<script>
export default {
  name: 'NumberField',
  emits: ['onValueChanged'],
  props: ['currentVal', 'hasError', 'errorMsg', 'text', 'placeholder'],
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






