<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <div class="toggle ms-0" :class="[customClass, { 'on': isActive }]" @click="onValueChanged" :id="id">
    <span></span>
  </div>
</template>

<script>
export default {
  name: 'ToggleSwitch',
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
    //toggle-secondary, warning, info, success, dengar, light, darkに対応
    customClass: {
      type: String,
      default: '',
    },
    isOn: {
      type: Boolean,
      default: false,
    },
  },
  data(){
    return{
      isActive: false,
    }
  },
  methods: {
    onValueChanged(){
      this.isActive = !this.isActive;
      this.$emit('onValueChanged', this.isActive)
    },
  },
  watch: {
    isOn(newVal){
      this.isActive = newVal
    }
  },
}
</script>

<style>
</style>

