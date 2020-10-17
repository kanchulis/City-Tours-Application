<template>
  <div>


<nav>
  <ul>
    <li id="welcome-display">Welcome, {{this.$store.state.user.username}}!</li>
    <li><router-link class='link' :to="{ name: 'landmark'}"> View Landmarks </router-link></li>
    <li><router-link class='link' :to="{ name: 'landmark'}"> Create New Itinerary </router-link></li>
    <li> <router-link class='link' :to="{ name: 'itinerary'}"> View/Edit Existing Itineraries </router-link></li>
    <li class="slide"></li>
  </ul>
</nav>
<section>
  <div class="title"><span>Austin, TX</span><span>The city of Austin is a beautiful place, full of diversity. <br> Regardless of which landmarks you choose to visit, <br> you are sure to have a wonderful time! <br><br><a target="_blanck">Keep Austin Weird</a></span></div>
</section>

  </div>
</template>

<script>


export default {
  name: "home",
  components: {
    
}, 
methods: {
  
}
}
</script>

<style>

body {
  margin: 0;
  padding: 0;
  font-family: 'Open Sans', sans-serif;
}
::selection {
  background-color: lavender;
  color: #1b1b1b;
}
nav {
  width: 100%;
  background-color: white;
  position: fixed;
  bottom: 0;
  height: 100px;
  overflow: hidden;
}
nav ul {
  position: absolute;
  top: 0;
  left: 0;
  list-style-type: none;
  padding: 0;
  margin: 0;
  width: 140vw;
}
nav li {
  margin: 0;
  float: left;
  display: inline-block;
  height: 98px;
  margin-bottom: 2px;
  line-height: 100px;
  width: 20vw;
  text-align: center;
  color: lavender;
  transition: background-color 0.5s 0.2s ease, color 0.3s ease;
  cursor: pointer;
  font-size: 12px;
  text-transform: uppercase;
  letter-spacing: 4px;
  font-weight: 800;
  transform: translateY(100%);
}
nav li.active {
  background-color: #151515;
  color: #efefef;
}
nav li.active::after {
  content: "";
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 100%;
  height: 2px;
  background-color: lavender;
}
nav li:nth-child(1) {
  animation: pop 0.5s 0.15s 1 forwards;
}
nav li:nth-child(2) {
  animation: pop 0.5s 0.3s 1 forwards;
}
nav li:nth-child(3) {
  animation: pop 0.5s 0.45s 1 forwards;
}
nav li:nth-child(4) {
  animation: pop 0.5s 0.6s 1 forwards;
}
nav li:nth-child(5) {
  animation: pop 0.5s 0.75s 1 forwards;
}
nav li:nth-child(6) {
  animation: pop 0.5s 0.9s 1 forwards;
}
nav li:nth-child(7) {
  animation: pop 0.5s 1.05s 1 forwards;
}
nav li:hover {
  color: #ececec;
}
nav li:nth-child(1):hover ~ .slide {
  left: 0;
}
nav li:nth-child(2):hover ~ .slide {
  left: 20vw;
}
nav li:nth-child(3):hover ~ .slide {
  left: 40vw;
}
nav li:nth-child(4):hover ~ .slide {
  left: 60vw;
}
nav li:nth-child(5):hover ~ .slide {
  left: 80vw;
}
nav li:nth-child(6):hover ~ .slide {
  left: 100vw;
}
nav li:nth-child(7):hover ~ .slide {
  left: 120vw;
}
nav li.slide {
  position: absolute;
  left: -20vw;
  top: 0;
  background-color: #fff;
  z-index: -1;
  height: 2px;
  margin-top: 98px;
  transition: left 0.3s ease;
  transform: translateY(0);
}
section {
  background: url("https://i.postimg.cc/PJdF60zx/Purple-Flat-Minimalist-University-Education-Website.png");
  /* background-color: #1b1b1b; */
  height: 100vh;
  display: flex;
  background-repeat: no-repeat;
  background-size: 100%;
}
section .title {
  max-width: 60%;
  width: 100%;
  align-self: center;
  transform: translateY(-50px);
  margin: 0 auto;
  overflow: hidden;
  padding-bottom: 30px;
}
section .title span {
  display: inline-block;
  font-size: 5vw;
  color: #efefef;
  width: 100%;
  text-transform: uppercase;
  transform: translateX(-100%);
  animation: byBottom 1s ease both;
  font-weight: 600;
  letter-spacing: 0.25vw;
}
section .title span:last-child {
  font-size: 1rem;
  animation: byBottom 1s 0.25s ease both;
}
section .title span a {
  position: relative;
  display: inline-block;
  margin-left: 0.5rem;
  text-decoration: none;
  color: white
}
section .title span a::after {
  content: "";
  height: 2px;
  background-color: white;
  position: absolute;
  bottom: -10px;
  left: 0;
  width: 0;
  animation: linkAfter 0.5s 1s ease both;
}
@-moz-keyframes pop {
  0% {
    transform: translateY(100%);
  }
  100% {
    transform: translateY(0);
  }
}
@-webkit-keyframes pop {
  0% {
    transform: translateY(100%);
  }
  100% {
    transform: translateY(0);
  }
}
@-o-keyframes pop {
  0% {
    transform: translateY(100%);
  }
  100% {
    transform: translateY(0);
  }
}
@keyframes pop {
  0% {
    transform: translateY(100%);
  }
  100% {
    transform: translateY(0);
  }
}
@-moz-keyframes byBottom {
  0% {
    transform: translateY(150%);
  }
  100% {
    transform: translateY(0);
  }
}
@-webkit-keyframes byBottom {
  0% {
    transform: translateY(150%);
  }
  100% {
    transform: translateY(0);
  }
}
@-o-keyframes byBottom {
  0% {
    transform: translateY(150%);
  }
  100% {
    transform: translateY(0);
  }
}
@keyframes byBottom {
  0% {
    transform: translateY(150%);
  }
  100% {
    transform: translateY(0);
  }
}
@-moz-keyframes linkAfter {
  0% {
    width: 0;
  }
  100% {
    width: 30px;
  }
}
@-webkit-keyframes linkAfter {
  0% {
    width: 0;
  }
  100% {
    width: 30px;
  }
}
@-o-keyframes linkAfter {
  0% {
    width: 0;
  }
  100% {
    width: 30px;
  }
}
@keyframes linkAfter {
  0% {
    width: 0;
  }
  100% {
    width: 30px;
  }
}

#welcome-display {
  color: #1b1b1b;
}


</style>