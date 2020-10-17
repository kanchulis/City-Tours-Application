<template>
<div class="logout-div">
  <h1>Logout</h1>
</div>
</template>

<script>
export default {
  created() {
    this.$store.commit("LOGOUT");
    this.$router.push("/login");
  }
};
</script>

<style>
.logout-div {
  font-family: 'Open Sans', sans-serif;
}
</style>
