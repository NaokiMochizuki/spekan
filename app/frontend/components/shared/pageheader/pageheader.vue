<template>
  <div class="d-md-flex d-block align-items-center justify-content-between page-header-breadcrumb">
    <div>
      <h2 class="main-content-title fs-24 mb-1">{{ heading }}</h2>
      <ol class="breadcrumb mb-0">
        <li v-for="(value, key) in maintitle" :key="key" class="breadcrumb-item"
          :class="key == maintitle.length - 1 ? 'active' : ''">
          <span v-if="key === maintitle.length - 1">{{ value }}</span>
          <span v-else>
            <a href="javascript:void(0);">{{ value }}</a>
          </span>
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
export default {
  name: "Page-header",
  props: ["heading", "maintitle"],
};
</script>

<style scoped></style>

