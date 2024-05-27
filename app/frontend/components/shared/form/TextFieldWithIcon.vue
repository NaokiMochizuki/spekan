<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <div class="input-group">
    <div class="input-group-text">
      <i :class="iconClass"></i>
    </div>
    <input type="text" class="form-control" v-model='inputedValue' :id="id" :placeholder="placeholder" @change="onValueChanged">
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'TextFieldWithIcon',
  props: ['id', 'iconClass', 'labelText', 'placeholder'],
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
  }

}
</script>

<style>
</style>
