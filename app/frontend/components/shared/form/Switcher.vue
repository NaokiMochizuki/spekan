<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <div class="input-group">
    <div class="form-check form-switch">
      <input class="form-check-input" type="checkbox" role="switch" :id="id" :checked="isActive" @change="onValueChanged">
      <label class="form-check-label" :for="id">
        <span class="ms-2">{{ itemText }}</span>
      </label>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Switcher',
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
      type: Boolean,
      default: false,
    },
    itemText: {
      type: String,
      default: '',
    },
    itemId: {
      type: Number,
      default: null
    }
  },
  data(){
    return{
      isActive: this.currentVal,
    }
  },
  methods: {
    onValueChanged(e){
      this.isActive = !this.isActive
      this.$emit('onValueChanged', { is_active: this.isActive, id: this.itemId })
    },
  },
  watch: {
    currentVal(newVal){
      this.isActive = newVal
    }
  }

}
</script>

<style>
  .crypto-transcation.list-unstyled li {
    padding: 5px;
  }
</style>


