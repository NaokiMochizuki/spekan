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
            <button class="btn btn-primary header-search-btn">
              <i class="fa-solid fa-magnifying-glass"></i>
            </button>
          </div>
          <div id="headersearch" class="header-search">
            <div class="p-3">
              <div class="">
                <p class="fw-semibold text-muted mb-2 fs-13">Recent Searches</p>
                <div class="ps-2">
                  <a href="javascript:void(0)" class="search-tags">
                    <i class="fe fe-search me-2"></i>People<span></span>
                  </a>
                  <a href="javascript:void(0)" class="search-tags">
                    <i class="fe fe-search me-2"></i>Pages<span></span>
                  </a>
                  <a href="javascript:void(0)" class="search-tags">
                    <i class="fe fe-search me-2"></i>Articles<span></span>
                  </a>
                </div>
              </div>
              <div class="mt-3">
                <p class="fw-semibold text-muted mb-2 fs-13">Apps and pages</p>
                <ul class="ps-2 list-unstyled">
                  <li class="p-1 d-flex align-items-center text-muted mb-2 search-app">
                    <router-link :to="`${url}advancedui/calendar`">
                      <span>
                        <i class='bx bx-calendar me-2 fs-14 bg-primary-transparent p-2 rounded-circle'></i>Calendar
                      </span>
                    </router-link>
                  </li>
                  <li class="p-1 d-flex align-items-center text-muted mb-2 search-app">
                    <router-link :to="`${url}apps/mail/mailinbox`">
                      <span>
                        <i class='bx bx-envelope me-2 fs-14 bg-primary-transparent p-2 rounded-circle'></i>Mail
                      </span>
                    </router-link>
                  </li>
                  <li class="p-1 d-flex align-items-center text-muted mb-2 search-app">
                    <router-link :to="`${url}elements/buttons`">
                      <span>
                        <i class='bx bx-dice-1 me-2 fs-14 bg-primary-transparent p-2 rounded-circle'></i>Buttons
                      </span>
                    </router-link>
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
        <Notifications />
        <!-- メニュー -->
        <ProfileMenu />
      </div>
    </div>
  </header>
</template>

<script>
import ProfileMenu from './profileMenu.vue';
import Notifications from './notifications.vue';
export default {
  data() {
    return {
      value: null,
      options: ["Firefox", "Chrome", "Safari", "Opera", "Internet Explorer"],
      url: import.meta.env.BASE_URL,
    };
  },
  components: { ProfileMenu, Notifications },
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


