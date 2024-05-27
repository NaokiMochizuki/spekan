<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <div class="input-group" :class="{ 'has-validation': hasError }">
    <div class="input-group-text">
      <i :class="iconClass"></i>
    </div>
    <input type="text" class="form-control" :class="{ 'is-invalid': hasError }" v-model='inputedValue' :id="id" :placeholder="placeholder" @change="onValueChanged">
    <div class="invalid-feedback" v-show="hasError">
      {{errorMsg}}
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'TextFieldWithIcon',
  props: ['id', 'iconClass', 'labelText', 'placeholder', 'hasError', 'errorMsg'],
  data(){
    return{
      inputedValue: '',
    }
  },
  computed: {
  },
  methods: {
    onValueChanged(){
      this.$emit('onValueChanged', this.inputedValue)
    },
  },

}
</script>

<style>
</style>
