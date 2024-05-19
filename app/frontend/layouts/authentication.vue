<template>
  <router-view />
</template>
<script>
export default {
  mounted() {
    document.body.classList.add("error-1");
  },
  unmounted() {
    document.body.classList.remove("error-1");
  }
};
</script>

<style scoped></style>
