<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <div class="input-group" :class="{ 'has-validation': hasError }">
    <input type="text" class="form-control" :class="{ 'is-invalid': hasError }" v-model="inputedValue" :id="id" :placeholder="placeholder" @change="onValueChanged">
    <div class="invalid-feedback" v-show="hasError">
      {{errorMsg}}
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'TextField',
  props: ['id', 'currentVal', 'labelText', 'placeholder', 'hasError', 'errorMsg'],
  data(){
    return{
      inputedValue: this.currentVal,
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
    }
  }

}
</script>

<style>
</style>

