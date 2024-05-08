<template>
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
        <router-link class="dropdown-item d-flex border-bottom" :to="`${url}pages/profile`">
          <i class="fa-regular fa-user fs-16 align-middle me-2"></i>Profile
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom" :to="`${url}apps/mail/mailinbox`">
          <i class="fa-solid fa-inbox fs-16 align-middle me-2"></i>Inbox
          <span class="badge bg-success ms-auto">25</span>
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom border-block-end" :to="`${url}pages/notificationlist`">
          <i class="fa-regular fa-compass fs-16 align-middle me-2"></i>Activity
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom" :to="`${url}pages/settings`">
          <i class="fa-solid fa-gear fs-16 align-middle me-2"></i>Settings
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex border-bottom" :to="`${url}advancedui/chat`">
          <i class="fa-solid fa-headphones fs-16 align-middle me-2"></i>Support
        </router-link>
      </li>
      <li>
        <router-link class="dropdown-item d-flex" :to="`${url}custompages/signin`">
          <i class="fa-solid fa-power-off fs-16 align-middle me-2"></i>Log Out
        </router-link>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data(){
    return {
    }
  }

}
</script>

<style>
</style>
