<template>
  <div>
    <itineraryList/>
  </div>
</template>

<script>
import itineraryList from '../components/ItineraryList.vue';

export default {
    name: 'itinerary-list',
    components: {
      itineraryList
    },
}
</script>