<template>
  <Loading v-show="isLoading" />
  <!-- プロフィールメニュー -->
  <div class="header-element">
    <a href="javascript:void(0);" class="header-link dropdown-toggle" id="mainHeaderProfile"
      data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
      <div class="d-flex align-items-center">
        <div class="header-link-icon">
          <img src="../../../images/template/faces/1.jpg" alt="img" width="32" height="32" class="rounded-circle">
        </div>
        <div class="d-none">
          <p class="fw-semibold mb-0">Angelica</p>
          <span class="op-7 fw-normal d-block fs-11">Web Designer</span>
        </div>
      </div>
    </a>
    <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end"
      aria-labelledby="mainHeaderProfile">
      <li>
        <div class="header-navheading border-bottom">
          <h6 class="main-notification-title">Sonia Taylor</h6>
          <p class="main-notification-text mb-0">Web Designer</p>
        </div>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom" to="/client">
          <i class="fa-regular fa-user fs-16 align-middle me-2"></i>Profile
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom" to="/client">
          <i class="fa-solid fa-inbox fs-16 align-middle me-2"></i>Inbox
          <span class="badge bg-success ms-auto">25</span>
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom border-block-end" to="/client">
          <i class="fa-regular fa-compass fs-16 align-middle me-2"></i>Activity
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom" :to="pointSettingUrl">
          <i class="fa-solid fa-gear fs-16 align-middle me-2"></i>ポイント設定
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom" to="/client">
          <i class="fa-solid fa-headphones fs-16 align-middle me-2"></i>Support
        </router-link>
      </li>
      <li>
        <a href='#' class='dropdown-item d-flex' @click.prevent='onLogout'>
          <i class="fa-solid fa-power-off fs-16 align-middle me-2"></i>ログアウト
        </a>
      </li>
    </ul>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex'
import Loading from '@/components/shared/Loading.vue'
export default {
  name: 'profileMenu',
  components: { Loading },
  data(){
    return {
      isLoading: false
    }
  },
  computed: {
    pointSettingUrl(){
      let authedClientUser = JSON.parse(localStorage.getItem('authedClientUser'))
      return `/client/point_settings/${authedClientUser['point_setting_id']}/edit`
    }
  },
  methods: {
    async onLogout(){
      this.isLoading = true
      await this.logout()
      setTimeout(() => {
        this.isLoading = false
        localStorage.setItem("loggedOut", "true")
        this.$router.push('/client/sign_in')
      }, 1000);
    },
    ...mapActions('clientUser', ['authedClientUser', 'logout']),
  }

}
</script>

<style>
</style>
