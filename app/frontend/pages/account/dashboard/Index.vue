<template>
  <div>
    <button @click="increment">Count is: {{ count }}</button>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
export default {
  name: 'accountDashbordIndex',
  data() {
    return {
    }
  },
  computed: {
    ...mapState('test', ['count']),
  },
  methods: {
    ...mapActions('test', ['increment'])
  }
}
</script>

<style>
</style>


