<template>

 <!-- <div class="grid-container-ci"> -->

  <div class='contact-form'>
<br>
<br>
     <h2 class="h2-create">Create a New Itinerary</h2>
     <p class="p-create">Check the boxes of the landmarks you want to add to your itinerary above; then submit this form!</p>

    <form class="create-itinerary-form" v-on:submit.prevent='createItinerary'>
        <label class="label-1"><span></span><input id="name-input" name="create" v-model='newItinerary.name' type="text" placeholder="Itinerary Name"/></label>
        <label class="label-1"><span></span><input id="address-input" name="startingLocation" v-model='newItinerary.startingLocation' type="text" placeholder="Starting Address"/></label>
        <label class="label-1"><span></span><input id="date-input" type="date" name="date" v-model='newItinerary.date'></label>
        <button class="create-itinerary-button">Create your Itinerary!</button>
    </form>

  </div>

  <!-- </div> -->

</template>


<script>
import itineraryService from '../services/ItineraryService.js';

export default {
    name: 'create-itinerary',
    data(){
        return{
            newItinerary: {
              "username" : this.$store.state.user.username,
              "destinations" : this.$store.state.selectedItineraryLandmarks,
            }
        }
    },
    methods:{
      createItinerary() {
        itineraryService.createItinerary(this.newItinerary);
            window.location.href = "http://localhost:8081/itinerary"
            this.$store.commit("CLEAR_ITINERARY_LANDMARK");
        },

}
}
</script>

<style>

.contact-form {
  font-family: 'Open Sans', sans-serif;
  max-width: 1208px;
  margin: 0 auto;
  text-align: left;
}

.h2-create {
  margin: 0;
  color: navy;
 font-size: 16x;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-weight: 800;
}
.p-create {
  font-size: 12px;
  color: navy;
}

.create-itinerary-button {
  position: relative;
}

.label-1 {
  display: block;
}

.label > span {
  display: none;
}

#address-input, #name-input, #date-input, .create-itinerary-button {
  width: 100%;
  padding: 0.5em;
  border: none;
  font: 300 100%/1.2 'Open Sans', sans-serif;
}

#address-input, #name-input {
  margin: 0 0 1em;
  border: 1px solid #ccc;
  outline: none;
}

textarea {
  height: 6em;
}

input[type="submit"], .create-itinerary-button {
  background: lavender;
  color: #333;
  width: 100%;
}

input[type="submit"]:hover, button:hover {
  background: thistle;
}

/* .grid-container-ci {
  display: grid;
  grid-template-columns: 1fr 1fr;
} */

</style>