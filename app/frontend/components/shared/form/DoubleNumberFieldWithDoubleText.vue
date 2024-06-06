<template>
	<div class="input-group mb-3" :class="{ 'has-validation': hasError }">
		<input 
      type="number"
      min="0"
      class="form-control"
      :class="{ 'is-invalid': hasError1 }"
      v-model="inputedValue1"
      @change="onValue1Changed"
      :placeholder="placeholder1">
		<span class="input-group-text">{{text1}}</span>
		<input
      type="number"
      min="0"
      class="form-control" 
      :class="{ 'is-invalid': hasError2 }"
      v-model="inputedValue2" 
      @change="onValue2Changed"
      :placeholder="placeholder2">
		<span class="input-group-text">{{text2}}</span>
    <div class="invalid-feedback" v-show="hasError1">
      {{errorMsg1}}
    </div>
    <div class="invalid-feedback" v-show="hasError2">
      {{errorMsg2}}
    </div>
	</div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'DoubleNumberFieldWithText',
  props: ['currentVal1', 'currentVal2', 'hasError1', 'hasError2', 'errorMsg1', 'errorMsg2', 'text1', 'text2', 'placeholder1', 'placeholder2'],
  data(){
    return{
      inputedValue1: this.currentVal1,
      inputedValue2: this.currentVal2,
    }
  },
  methods: {
    onValue1Changed(){
      this.$emit('onValue1Changed', this.inputedValue1)
    },
    onValue2Changed(){
      this.$emit('onValue2Changed', this.inputedValue2)
    },
  },
  watch: {
    currentVal1(newVal){
      this.inputedValue1 = newVal
    },
    currentVal2(newVal){
      this.inputedValue2 = newVal
    }
  }

}
</script>

<style>
</style>




