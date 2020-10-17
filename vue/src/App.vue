<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">| Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
#nav{
  border-radius: 40px;
  padding-top: 12px;
  padding-left: 10px;
  padding-right: 15px;
  padding-bottom: 12px;
  margin-left: 1750px;
  display: flex;
  justify-content: flex-end;
  font-family: 'Open Sans', sans-serif;

}
</style>