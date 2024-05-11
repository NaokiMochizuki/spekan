<template>
  <Pageheader heading="ダッシュボード" :maintitle='["Top", "Dashboard"]'></Pageheader>
  <div>
    <button @click="increment">Count is: {{ count }}</button>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import Pageheader from '../../../components/shared/pageheader/pageheader.vue'
export default {
  name: 'accountDashbordIndex',
  components: { Pageheader },
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



