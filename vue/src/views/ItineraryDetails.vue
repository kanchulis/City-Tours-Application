<template>
  <div class="itinerary-div">
    <div class='header'>
    <br><br><h1 class='header-it-details'>Your Itinerary Details</h1>
    <p class="p-it-details"><router-link :to="{ name: 'itinerary'}"> Back to All Itineraries</router-link></p>
    </div>
    <itineraryUpdate/>
  </div>
</template>

<script>
import itineraryUpdate from '../components/ItineraryUpdate.vue';
export default {
    name: 'itinerary-details',
    components: {
        itineraryUpdate
    },
}
</script>

<style>

.itinerary-div {
 font-family: 'Open Sans', sans-serif;
 
}

.header-it-details {
  border-radius: 40px;
  opacity: 0.75;
  margin-left: 700px;
  margin-right: 500px;
  padding-bottom: 20px;
  font-weight: 600;
  letter-spacing: 0.25vw;
  text-transform: uppercase;
}

.p-it-details {
  padding-left: 10px;
}

</style>