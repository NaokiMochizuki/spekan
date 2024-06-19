<template>
  <label :for="id" class="form-label fs-14">{{labelText}}</label>
  <div class="form-check" style="padding-left: 2em;">
    <input class="form-check-input" type="checkbox" :id="id" :checked="isActive" @change="onValueChanged">
    <label class="form-check-label" :for="id">
      <span>{{ itemText }}</span>
    </label>
  </div>
</template>

<script>
export default {
  name: 'Checkbox',
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
      default: null,
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
  computed: {
  },
  methods: {
    onValueChanged(e){
      this.isActive = !this.isActive
      this.$emit('onValueChanged', { required: this.isActive, id: this.itemId })
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
</style>


