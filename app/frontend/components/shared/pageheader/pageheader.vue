<template>
  <div class="d-md-flex d-block align-items-center justify-content-between page-header-breadcrumb">
    <div>
      <h2 class="main-content-title fs-24 mb-1">{{ heading }}</h2>
      <ol class="breadcrumb mb-0">
        <li v-for="(value, key) in breadcrumb" :key="key" class="breadcrumb-item"
          :class="key == breadcrumb.length - 1 ? 'active' : ''">
          <span v-if="key === breadcrumb.length - 1">{{ value.name }}</span>
          <span v-else>
            <router-link :to="value.uri">
              <span class="link">{{value.name}}</span>
            </router-link>
          </span>
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
export default {
  name: "pageHeader",
  props: ["heading", "breadcrumb"],
};
</script>

<style scoped></style>

