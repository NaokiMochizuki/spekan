<template>
  <div className="horizontalMenucontainer">
    <div className="page">
      <Header />
      <Sidebar />
      <div className="main-content app-content">
        <div className="container-fluid">
          <router-view />
        </div>
      </div>
      <Footer />
    </div>
    <Backtotop />
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import Header from '../components/shared/header/header.vue'
import Sidebar from '../components/shared/sidebar/sidebar.vue'
import Footer from '../components/shared/footer/footer.vue'
import Backtotop from '../components/shared/backtotop/backtotop.vue'
export default {
  name: 'clientLayout',
  components: { Footer, Backtotop, Header, Sidebar },
  data() {
    return {
    }
  },
  computed: {
  },
  methods: {
  }
}
</script>

<style>
</style>

