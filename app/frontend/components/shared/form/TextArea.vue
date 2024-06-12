<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <div class="input-group" :class="{ 'has-validation': hasError }">
    <textarea 
      type="text"
      class="form-control"
      v-model="inputedValue" 
      :class="{ 'is-invalid': hasError }"
      :id="id"
      :rows="rows"
      :placeholder="placeholder"
      @change="onValueChanged" />
    <div class="invalid-feedback" v-show="hasError">
      {{errorMsg}}
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'TextArea',
  emits: ['onValueChanged'],
  props: ['id', 'currentVal', 'labelText', 'placeholder', 'hasError', 'errorMsg', 'rows'],
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
    }
  }

}
</script>

<style>
</style>


