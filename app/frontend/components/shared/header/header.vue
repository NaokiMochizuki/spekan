<template>
  <header class="app-header">

    <!-- Start::main-header-container -->
    <div class="main-header-container container-fluid">

      <!-- Start::header-content-left -->
      <div class="header-content-left">

        <!-- Start::header-element -->
        <div class="header-element">
          <div class="horizontal-logo">
            <router-link :to="`${url}dashboard`" class="header-logo">
              <img src="/images/brand-logos/desktop-logo.png" alt="logo" class="desktop-logo">
              <img src="/images/brand-logos/toggle-logo.png" alt="logo" class="toggle-logo">
              <img src="/images/brand-logos/desktop-dark.png" alt="logo" class="desktop-dark">
              <img src="/images/brand-logos/toggle-dark.png" alt="logo" class="toggle-dark">
              <img src="/images/brand-logos/desktop-white.png" alt="logo" class="desktop-white">
              <img src="/images/brand-logos/toggle-white.png" alt="logo" class="toggle-white">
            </router-link>
          </div>
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element">
          <!-- Start::header-link -->
          <a @click="ToggleMenu" aria-label="Hide Sidebar"
            class="sidemenu-toggle header-link animated-arrow hor-toggle horizontal-navtoggle"
            href="javascript:void(0);"><span></span></a>
          <!-- End::header-link -->
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="main-header-center d-none d-lg-block  header-link">
          <div class="input-group">
            <div class="input-group-btn search-panel">
              <Selectoptions :options="options" placeholder="Choose one" id="language" name="language" :value="value" />
            </div>
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
        <!-- End::header-element -->

      </div>
      <!-- End::header-content-left -->

      <!-- Start::header-content-right -->
      <div class="header-content-right">

        <!-- Start::header-element -->
        <div class="header-element header-theme-mode">
          <!-- Start::header-link|layout-setting -->
          <a href="javascript:void(0);" class="header-link layout-setting">
            <span class="light-layout" @click="colorthemeFn('dark')">
              <!-- Start::header-link-icon -->
              <i class="fe fe-moon header-link-icon lh-2"></i>
              <!-- End::header-link-icon -->
            </span>
            <span class="dark-layout" @click="colorthemeFn('light')">
              <!-- Start::header-link-icon -->
              <i class="fe fe-sun header-link-icon lh-2"></i>
              <!-- End::header-link-icon -->
            </span>
          </a>
          <!-- End::header-link|layout-setting -->
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element country-selector">
          <!-- Start::header-link|dropdown-toggle -->
          <a href="javascript:void(0);" class="header-link dropdown-toggle country-Flag" data-bs-auto-close="outside"
            data-bs-toggle="dropdown">
            <span>
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                <circle cx="256" cy="256" r="256" fill="#f0f0f0" />
                <g fill="#0052b4">
                  <path
                    d="M52.92 100.142c-20.109 26.163-35.272 56.318-44.101 89.077h133.178L52.92 100.142zM503.181 189.219c-8.829-32.758-23.993-62.913-44.101-89.076l-89.075 89.076h133.176zM8.819 322.784c8.83 32.758 23.993 62.913 44.101 89.075l89.074-89.075H8.819zM411.858 52.921c-26.163-20.109-56.317-35.272-89.076-44.102v133.177l89.076-89.075zM100.142 459.079c26.163 20.109 56.318 35.272 89.076 44.102V370.005l-89.076 89.074zM189.217 8.819c-32.758 8.83-62.913 23.993-89.075 44.101l89.075 89.075V8.819zM322.783 503.181c32.758-8.83 62.913-23.993 89.075-44.101l-89.075-89.075v133.176zM370.005 322.784l89.075 89.076c20.108-26.162 35.272-56.318 44.101-89.076H370.005z" />
                </g>
                <g fill="#d80027">
                  <path
                    d="M509.833 222.609H289.392V2.167A258.556 258.556 0 00256 0c-11.319 0-22.461.744-33.391 2.167v220.441H2.167A258.556 258.556 0 000 256c0 11.319.744 22.461 2.167 33.391h220.441v220.442a258.35 258.35 0 0066.783 0V289.392h220.442A258.533 258.533 0 00512 256c0-11.317-.744-22.461-2.167-33.391z" />
                  <path
                    d="M322.783 322.784L437.019 437.02a256.636 256.636 0 0015.048-16.435l-97.802-97.802h-31.482v.001zM189.217 322.784h-.002L74.98 437.019a256.636 256.636 0 0016.435 15.048l97.802-97.804v-31.479zM189.217 189.219v-.002L74.981 74.98a256.636 256.636 0 00-15.048 16.435l97.803 97.803h31.481zM322.783 189.219L437.02 74.981a256.328 256.328 0 00-16.435-15.047l-97.802 97.803v31.482z" />
                </g>
              </svg>
            </span>
          </a>
          <!-- End::header-link|dropdown-toggle -->
          <ul class="main-header-dropdown dropdown-menu dropdown-menu-end" data-popper-placement="none">
            <li>
              <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                <span class="avatar avatar-xs lh-1 me-2">
                  <img src="/images/flags/6.jpg" alt="img">
                </span>
                English
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                <span class="avatar avatar-xs lh-1 me-2">
                  <img src="/images/flags/5.jpg" alt="img">
                </span>
                Spanish
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                <span class="avatar avatar-xs lh-1 me-2">
                  <img src="/images/flags/1.jpg" alt="img">
                </span>
                French
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                <span class="avatar avatar-xs lh-1 me-2">
                  <img src="/images/flags/2.jpg" alt="img">
                </span>
                German
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                <span class="avatar avatar-xs lh-1 me-2">
                  <img src="/images/flags/3.jpg" alt="img">
                </span>
                Italian
              </a>
            </li>
            <li>
              <a class="dropdown-item d-flex align-items-center" href="javascript:void(0);">
                <span class="avatar avatar-xs lh-1 me-2">
                  <img src="/images/flags/4.jpg" alt="img">
                </span>
                Russian
              </a>
            </li>
          </ul>
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element header-fullscreen  d-xl-flex d-none">
          <!-- Start::header-link -->
          <a @click="toggleFullScreen();" href="javascript:void(0);" class="header-link">
            <i v-if="!isFullScreen" class="fe fe-maximize full-screen-open header-link-icon"></i>
            <i v-if="isFullScreen" class="fe fe-minimize full-screen-close header-link-icon"></i>
          </a>
          <!-- End::header-link -->
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element cart-dropdown d-xl-flex d-none">
          <!-- Start::header-link|dropdown-toggle -->
          <a href="javascript:void(0);" class="header-link dropdown-toggle" data-bs-auto-close="outside"
            data-bs-toggle="dropdown">
            <i class="fe fe-shopping-cart header-link-icon"></i>
            <span class="badge bg-primary rounded-pill header-icon-badge" id="cart-icon-badge">{{ cartList.length
            }}</span>
          </a>
          <!-- End::header-link|dropdown-toggle -->
          <!-- Start::main-header-dropdown -->
          <div class="main-header-dropdown dropdown-menu dropdown-menu-end" data-popper-placement="none">
            <div class="p-3">
              <div class="d-flex align-items-center justify-content-between">
                <p class="mb-0 fs-17 fw-semibold">Cart Items</p>
                <span class="badge bg-primary rounded-pill" id="cart-data">{{ cartList.length }} Items</span>
              </div>
            </div>
            <div>
              <hr class="dropdown-divider">
            </div>
            <ul v-if="cartList.length" class="list-unstyled mb-0" id="header-cart-items-scroll">
              <li v-for="(item, key) in cartList" :key=key class="dropdown-item">
                <div class="d-flex align-items-center cart-dropdown-item">
                  <img :src="item.img" alt="img" class="avatar avatar-sm br-5 me-3">
                  <div class="flex-grow-1">
                    <div class="d-flex align-items-start justify-content-between mb-0">
                      <div class="mb-0 fs-13 text-dark fw-medium">
                        <router-link :to="`${url}ecommerce/cart`" class="text-dark">{{ item.title
                        }}</router-link>
                      </div>
                      <div>
                        <span class="text-black mb-1 fw-medium">${{ item.price }}</span>
                      </div>
                    </div>
                    <div class="min-w-fit-content d-flex align-items-start justify-content-between">
                      <ul class="header-product-item d-flex">
                        <li v-for="(cat, index) in item.categoryList" :key="index">
                          <span :class="cat.valueBgColor ? `badge ${cat.valueBgColor} fs-10` : ''">
                            {{ cat.value }}
                          </span>
                          <template v-if="cat.qty">Qty: {{ cat.qty }}</template>
                          <template v-if="cat.status">Status: <span :class="cat.statusBgColor">{{ cat.status }}</span>
                          </template>
                        </li>
                      </ul>
                      <div class="ms-auto">
                        <a @click="removeItemFromCart(item)" href="javascript:void(0);"
                          class="header-cart-remove float-end dropdown-item-close"><i
                            class="ri-delete-bin-2-line"></i></a>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
            <div v-if="cartList.length" class="p-3 empty-header-item border-top">
              <div class="d-grid">
                <router-link :to="`${url}ecommerce/checkout`" class="btn btn-primary">Proceed to
                  checkout</router-link>
              </div>
            </div>
            <div v-if="!cartList.length" class="p-5 empty-item">
              <div class="text-center">
                <span class="avatar avatar-xl avatar-rounded bg-warning-transparent">
                  <i class="ri-shopping-cart-2-line fs-2"></i>
                </span>
                <h6 class="fw-bold mb-1 mt-3">Your Cart is Empty</h6>
                <span class="mb-3 fw-normal fs-13 d-block">Add some items to make me happy :)</span>
                <router-link :to="`${url}ecommerce/products`" class="btn btn-primary btn-wave btn-sm m-1"
                  data-abc="true">
                  continue shopping <i class="bi bi-arrow-right ms-1"></i></router-link>
              </div>
            </div>
          </div>
          <!-- End::main-header-dropdown -->
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element notifications-dropdown">
          <!-- Start::header-link|dropdown-toggle -->
          <a href="javascript:void(0);" class="header-link dropdown-toggle" data-bs-toggle="dropdown"
            data-bs-auto-close="outside" id="messageDropdown" aria-expanded="false">
            <i class="fe fe-bell header-link-icon"></i>
            <span class="badge bg-secondary rounded-pill header-icon-badge pulse pulse-secondary"
              id="notification-icon-badge">
              {{ notificationList.length }}
            </span>
          </a>
          <!-- End::header-link|dropdown-toggle -->
          <!-- Start::main-header-dropdown -->
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
          <!-- End::main-header-dropdown -->
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element header-shortcuts-dropdown d-xl-flex d-none">
          <!-- Start::header-link|dropdown-toggle -->
          <a href="javascript:void(0);" class="header-link dropdown-toggle" data-bs-toggle="dropdown"
            data-bs-auto-close="outside" id="notificationDropdown" aria-expanded="false">
            <i class="fe fe-grid header-link-icon"></i>
          </a>
          <!-- End::header-link|dropdown-toggle -->
          <!-- Start::main-header-dropdown -->
          <div class="main-header-dropdown header-shortcuts-dropdown dropdown-menu pb-0 dropdown-menu-end"
            aria-labelledby="notificationDropdown">
            <div class="p-3">
              <div class="d-flex align-items-center justify-content-between">
                <p class="mb-0 fs-17 fw-semibold">Related Apps</p>
              </div>
            </div>
            <div class="dropdown-divider mb-0"></div>
            <div class="main-header-shortcuts p-2" id="header-shortcut-scroll">
              <div class="row g-2">
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/figma.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">Figma</span>
                    </div>
                  </a>
                </div>
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/microsoft-powerpoint.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">Power Point</span>
                    </div>
                  </a>
                </div>
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/microsoft-word.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">MS Word</span>
                    </div>
                  </a>
                </div>
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/calender.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">Calendar</span>
                    </div>
                  </a>
                </div>
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/sketch.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">Sketch</span>
                    </div>
                  </a>
                </div>
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/google-docs.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">Docs</span>
                    </div>
                  </a>
                </div>
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/google.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">Google</span>
                    </div>
                  </a>
                </div>
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/translate.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">Translate</span>
                    </div>
                  </a>
                </div>
                <div class="col-4">
                  <a href="javascript:void(0);">
                    <div class="text-center p-3 related-app">
                      <span class="avatar avatar-sm rounded-2 p-1 bg-primary-transparent">
                        <img src="/images/apps/google-sheets.png" alt="">
                      </span>
                      <span class="d-block fs-12 text-default">Sheets</span>
                    </div>
                  </a>
                </div>
              </div>
            </div>
            <div class="p-3 border-top">
              <div class="d-grid">
                <a href="javascript:void(0);" class="btn btn-primary">View All</a>
              </div>
            </div>
          </div>
          <!-- End::main-header-dropdown -->
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element">
          <!-- Start::header-link|dropdown-toggle -->
          <a href="javascript:void(0);" class="header-link dropdown-toggle" id="mainHeaderProfile"
            data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
            <div class="d-flex align-items-center">
              <div class="header-link-icon">
                <img src="/images/faces/1.jpg" alt="img" width="32" height="32" class="rounded-circle">
              </div>
              <div class="d-none">
                <p class="fw-semibold mb-0">Angelica</p>
                <span class="op-7 fw-normal d-block fs-11">Web Designer</span>
              </div>
            </div>
          </a>
          <!-- End::header-link|dropdown-toggle -->
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
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element right-sidebar d-xl-flex d-none">
          <a href="javascript:void(0);" class="header-link right-sidebar" data-bs-toggle="offcanvas"
            data-bs-target="#right-sidebar-canvas">
            <i class="fe fe-align-right header-icons header-link-icon"></i>
          </a>
        </div>
        <!-- End::header-element -->

        <!-- Start::header-element -->
        <div class="header-element">
          <!-- Start::header-link|switcher-icon -->
          <a href="javascript:void(0);" class="header-link switcher-icon" data-bs-toggle="offcanvas"
            data-bs-target="#switcher-canvas">
            <i class="fe fe-settings header-link-icon"></i>
          </a>
          <!-- End::header-link|switcher-icon -->
        </div>
        <!-- End::header-element -->

      </div>
      <!-- End::header-content-right -->

    </div>
    <!-- End::main-header-container -->

  </header>
</template>

<script>
import Selectoptions from "@/shared/UI/selectoptions.vue";
import { switcherStore } from '@/stores/switcher';
import { notificationList, cartList } from '@/data/headerdata.js';

export default {
  components: {
    Selectoptions
  },
  setup() {
    const switcher = switcherStore();

    const colorthemeFn = value => { localStorage.setItem('spruhacolortheme', value); switcher.colorthemeFn(value);
            localStorage.removeItem('spruhabodylightRGB')
            localStorage.removeItem('spruhabodyBgRGB') };

    return {
      switcher,
      colorthemeFn,
    }
  },
  data() {
    return {
      notificationList, cartList,
      isFullScreen: false,
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
    toggleFullScreen() {
      const element = document.documentElement; // Full-screen target element

      if (document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement) {
        // If in full-screen mode, exit it
        if (document.exitFullscreen) {
          document.exitFullscreen();
        } else if (document.mozCancelFullScreen) {
          document.mozCancelFullScreen();
        } else if (document.webkitExitFullscreen) {
          document.webkitExitFullscreen();
        }
      } else {
        // If not in full-screen mode, enter it
        if (element.requestFullscreen) {
          element.requestFullscreen();
        } else if (element.mozRequestFullScreen) {
          element.mozRequestFullScreen();
        } else if (element.webkitRequestFullscreen) {
          element.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
        }
      }
    },
    removeNotification(item) {
      this.notificationList = this.notificationList.filter(itm => itm.id != item.id);
    },
    removeItemFromCart(item) {
      this.cartList = this.cartList.filter(itm => itm.id != item.id);
    },
    fullscreenchanged() {
      if (document.fullscreenElement) {
        this.isFullScreen = true;
      } else {
        this.isFullScreen = false;
      }
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
    document.addEventListener("fullscreenchange", this.fullscreenchanged);
  },
};
</script>


