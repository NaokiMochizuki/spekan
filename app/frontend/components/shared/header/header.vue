<template>
  <header class="app-header">

    <div class="main-header-container container-fluid">

      <div class="header-content-left">

        <div class="header-element">
          <div class="horizontal-logo">
            <router-link :to="`${url}dashboard`" class="header-logo">
              <img src="../../../images/template/brand-logos/desktop-logo.png" alt="logo" class="desktop-logo">
              <img src="../../../images/template/brand-logos/toggle-logo.png" alt="logo" class="toggle-logo">
              <img src="../../../images/template/brand-logos/desktop-dark.png" alt="logo" class="desktop-dark">
              <img src="../../../images/template/brand-logos/toggle-dark.png" alt="logo" class="toggle-dark">
              <img src="../../../images/template/brand-logos/desktop-white.png" alt="logo" class="desktop-white">
              <img src="../../../images/template/brand-logos/toggle-white.png" alt="logo" class="toggle-white">
            </router-link>
          </div>
        </div>

        <!-- サイドバー隠すハンバーガー -->
        <div class="header-element">
          <a @click="ToggleMenu" aria-label="Hide Sidebar"
            class="sidemenu-toggle header-link animated-arrow hor-toggle horizontal-navtoggle"
            href="javascript:void(0);"><span></span></a>
        </div>

        <div class="main-header-center d-none d-lg-block  header-link">
          <div class="input-group">
            <!-- この中のMultiselectが解明出来たら表示させる -->
            <!-- <div class="input-group-btn search-panel"> -->
            <!--   <Selectoptions :options="options" placeholder="Choose one" id="language" name="language" :value="value" /> -->
            <!-- </div> -->
            <input type="text" class="form-control" id="typehead" placeholder="Search for results..." autocomplete="off">
            <button class="btn btn-primary header-search-btn"><i class="fe fe-search" aria-hidden="true"></i></button>
          </div>
          <div id="headersearch" class="header-search">
            <div class="p-3">
              <div class="">
                <p class="fw-semibold text-muted mb-2 fs-13">Recent Searches</p>
                <div class="ps-2">
                  <a href="javascript:void(0)" class="search-tags"><i
                      class="fe fe-search me-2"></i>People<span></span></a>
                  <a href="javascript:void(0)" class="search-tags"><i class="fe fe-search me-2"></i>Pages<span></span></a>
                  <a href="javascript:void(0)" class="search-tags"><i
                      class="fe fe-search me-2"></i>Articles<span></span></a>
                </div>
              </div>
              <div class="mt-3">
                <p class="fw-semibold text-muted mb-2 fs-13">Apps and pages</p>
                <ul class="ps-2 list-unstyled">
                  <li class="p-1 d-flex align-items-center text-muted mb-2 search-app">
                    <router-link :to="`${url}advancedui/calendar`"><span><i
                          class='bx bx-calendar me-2 fs-14 bg-primary-transparent p-2 rounded-circle '></i>Calendar</span></router-link>
                  </li>
                  <li class="p-1 d-flex align-items-center text-muted mb-2 search-app">
                    <router-link :to="`${url}apps/mail/mailinbox`"><span><i
                          class='bx bx-envelope me-2 fs-14 bg-primary-transparent p-2 rounded-circle'></i>Mail</span></router-link>
                  </li>
                  <li class="p-1 d-flex align-items-center text-muted mb-2 search-app">
                    <router-link :to="`${url}elements/buttons`"><span><i
                          class='bx bx-dice-1 me-2 fs-14 bg-primary-transparent p-2 rounded-circle '></i>Buttons</span></router-link>
                  </li>
                </ul>
              </div>
              <div class="mt-3">
                <p class="fw-semibold text-muted mb-2 fs-13">Links</p>
                <ul class="ps-2 list-unstyled">
                  <li class="p-1 align-items-center text-muted mb-1 search-app">
                    <a href="javascript:void(0)" class="text-primary"><u>http://spruko/html/spruko.com</u></a>
                  </li>
                  <li class="p-1 align-items-center text-muted mb-1 search-app">
                    <a href="javascript:void(0)" class="text-primary"><u>http://spruko/demo/spruko.com</u></a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="py-3 border-top px-0">
              <div class="text-center">
                <a href="javascript:void(0)" class="text-primary text-decoration-underline fs-15">View all</a>
              </div>
            </div>
          </div>
        </div>

      </div>

      <div class="header-content-right">

        <!-- 通知 -->
        <div class="header-element notifications-dropdown">
          <a href="javascript:void(0);" class="header-link dropdown-toggle" data-bs-toggle="dropdown"
            data-bs-auto-close="outside" id="messageDropdown" aria-expanded="false">
            <i class="fe fe-bell header-link-icon"></i>
            <span class="badge bg-secondary rounded-pill header-icon-badge pulse pulse-secondary"
              id="notification-icon-badge">
              {{ notificationList.length }}
            </span>
          </a>

          <div class="main-header-dropdown dropdown-menu dropdown-menu-end" data-popper-placement="none">
            <div class="p-3">
              <div class="d-flex align-items-center justify-content-between">
                <p class="mb-0 fs-17 fw-semibold">Notifications</p>
                <span class="badge bg-secondary rounded-pill" id="notifiation-data">{{ notificationList.length }}
                  Unread</span>
              </div>
            </div>
            <div class="dropdown-divider"></div>
            <simplebar data-simplebar-auto-hide="false">
              <ul v-if="notificationList.length" class="list-unstyled mb-0" id="header-notification-scroll">
                <li v-for="(item, key) in notificationList" :key=key class="dropdown-item">
                  <div class="d-flex align-items-start">
                    <div class="pe-2">
                      <span class="avatar avatar-md bg-primary-transparent br-5"
                        :class="item.isOnline ? 'online' : 'offline'"><img alt="avatar" :src="item.icon"></span>
                    </div>
                    <div class="flex-grow-1 d-flex align-items-center justify-content-between">
                      <div>
                        <p class="mb-0"><router-link :to="`${url}advancedui/notifications`" class="text-dark">{{ item.title
                        }}</router-link></p>
                        <span class="text-muted fw-normal fs-12 header-notification-text">{{ item.time }}</span>
                      </div>
                      <div>
                        <a @click=removeNotification(item) href="javascript:void(0);"
                          class="min-w-fit-content text-muted me-1 dropdown-item-close1"><i class="ti ti-x fs-16"></i></a>
                      </div>
                    </div>
                  </div>
                </li>
              </ul>
            </simplebar>
            <div v-if="notificationList.length" class="p-3 empty-header-item1 border-top">
              <div class="d-grid">
                <router-link :to="`${url}advancedui/notifications`" class="btn btn-primary">View All</router-link>
              </div>
            </div>
            <div v-if="!notificationList.length" class="p-5 empty-item1">
              <div class="text-center">
                <span class="avatar avatar-xl avatar-rounded bg-secondary-transparent">
                  <i class="ri-notification-off-line fs-2"></i>
                </span>
                <h6 class="fw-semibold mt-3">No New Notifications</h6>
              </div>
            </div>
          </div>
        </div>


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
            <li><router-link class="dropdown-item d-flex border-bottom" :to="`${url}pages/profile`"><i
                  class="fe fe-user fs-16 align-middle me-2"></i>Profile</router-link></li>
            <li><router-link class="dropdown-item d-flex border-bottom" :to="`${url}apps/mail/mailinbox`"><i
                  class="fe fe-inbox fs-16 align-middle me-2"></i>Inbox <span
                  class="badge bg-success ms-auto">25</span></router-link>
            </li>
            <li><router-link class="dropdown-item d-flex border-bottom border-block-end"
                :to="`${url}pages/notificationlist`"><i
                  class="fe fe-compass fs-16 align-middle me-2"></i>Activity</router-link></li>
            <li><router-link class="dropdown-item d-flex border-bottom" :to="`${url}pages/settings`"><i
                  class="fe fe-settings fs-16 align-middle me-2"></i>Settings</router-link></li>
            <li><router-link class="dropdown-item d-flex border-bottom" :to="`${url}advancedui/chat`"><i
                  class="fe fe-headphones fs-16 align-middle me-2"></i>Support</router-link> </li>
            <li><router-link class="dropdown-item d-flex" :to="`${url}custompages/signin`"><i
                  class="fe fe-power fs-16 align-middle me-2"></i>Log
                Out</router-link></li>
          </ul>
        </div>
      </div>
    </div>

  </header>
</template>

<script>
import { notificationList } from './sampledata/notification-list.js';

export default {
  data() {
    return {
      notificationList,
      value: null,
      options: ["Firefox", "Chrome", "Safari", "Opera", "Internet Explorer"],
      url: import.meta.env.BASE_URL,
    };
  },
  //sticky-pin
  created() {
    window.addEventListener("scroll", this.handleScroll);
    this.handleScroll();
  },
  unmounted() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  methods: {
    ToggleMenu() {
      let html = document.querySelector('html');
      if (window.innerWidth <= 992) {
        let dataToggled = html.getAttribute('data-toggled');
        if (dataToggled == 'open') {
          html.setAttribute('data-toggled', 'close');
        } else {
          html.setAttribute('data-toggled', 'open');
        }
      } else {
        let menuNavLayoutType = html.getAttribute('data-nav-style');
        let verticalStyleType = html.getAttribute('data-vertical-style');
        if (menuNavLayoutType) {
          let dataToggled = html.getAttribute('data-toggled');
          if (dataToggled) {
            html.removeAttribute('data-toggled');
          } else {
            html.setAttribute('data-toggled', menuNavLayoutType + '-closed');
          }
        } else if (verticalStyleType) {
          let dataToggled = html.getAttribute('data-toggled');
          if (verticalStyleType == 'doublemenu') {
            if (html.getAttribute('data-toggled') === 'double-menu-open' && document.querySelector('.double-menu-active')) {
              html.setAttribute('data-toggled', 'double-menu-close');
            } else {
              if (document.querySelector('.double-menu-active')) {
                html.setAttribute('data-toggled', 'double-menu-open');
              }
            }
          } else if (dataToggled) {
            html.removeAttribute('data-toggled');
          } else {
            switch (verticalStyleType) {
              case 'closed':
                html.setAttribute('data-toggled', 'close-menu-close');
                break;
              case 'icontext':
                html.setAttribute('data-toggled', 'icon-text-close');
                break;
              case 'overlay':
                html.setAttribute('data-toggled', 'icon-overlay-close');
                break;
              case 'detached':
                html.setAttribute('data-toggled', 'detached-close');
                break;
            }
          }
        }
      }
    },
    removeNotification(item) {
      this.notificationList = this.notificationList.filter(itm => itm.id != item.id);
    },
    //sticky-pin
    handleScroll() {
      if (window.scrollY > 30) {
        let Scolls = document.querySelectorAll(".sticky");
        Scolls.forEach((e) => {
          e.classList.add("sticky-pin");
        });
      } else {
        let Scolls = document.querySelectorAll(".sticky");
        Scolls.forEach((e) => {
          e.classList.remove("sticky-pin");
        });
      }
    },
    headerSearch() {
      let searchBtn = document.querySelector(".header-search");
      searchBtn.classList.toggle("show");
    },
  },
  mounted() {
  },
};
</script>


