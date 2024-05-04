<template>
  <div className="horizontalMenucontainer">
    <!-- <Switcher /> -->
    <div className="page">
      <Header />
      <Footer />
      <Backtotop />
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
//import Switcher from '../../../components/shared/switcher//switcher.vue'
import Header from '../../../components/shared/header/header.vue'
//import Sidebar from '../../../components/shared/sidebar/sidebar.vue'
//import Rightsidebar from '../../../components/shared/rightsidebar/rightsidebar.vue'
import Footer from '../../../components/shared/footer/footer.vue'
import Backtotop from '../../../components/shared/backtotop/backtotop.vue'
export default {
  name: 'accountDashbordIndex',
  components: { Footer, Backtotop, Header },
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


