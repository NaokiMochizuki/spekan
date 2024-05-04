<template>
  <div className="horizontalMenucontainer">
    <!-- <Switcher /> -->
    <div className="page">
      <Footer />
      <Backtotop />
    </div>
    テスト
  </div>
  <!--   <Switcher /> -->
  <!--     <Header /> -->
  <!--     <Sidebar /> -->
  <!--     <div className="main-content app-content"> -->
  <!--       <div className="container-fluid"> -->
  <!--         <div> -->
  <!--           <button @click="increment">Count is: {{ count }}</button> -->
  <!--         </div> -->
  <!--       </div> -->
  <!--     </div> -->
  <!--     <Rightsidebar /> -->
</template>

<script>
import { mapState, mapActions } from 'vuex'
//import Switcher from '../../../components/shared/switcher//switcher.vue'
//import Header from '../../../components/shared/header/header.vue'
//import Sidebar from '../../../components/shared/sidebar/sidebar.vue'
//import Rightsidebar from '../../../components/shared/rightsidebar/rightsidebar.vue'
import Footer from '../../../components/shared/footer/footer.vue'
import Backtotop from '../../../components/shared/backtotop/backtotop.vue'
export default {
  name: 'accountDashbordIndex',
  components: { Footer, Backtotop },
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


