<template>
  <div class='overlay'>
    <div class="wrapper">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Loading',
  data(){
    return{
    }
  },
}
</script>

<style>
  .overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6);
    z-index: 9999;
  }
  .wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  .spinner-border{
    color: #DF5A5A;
  }
</style>
