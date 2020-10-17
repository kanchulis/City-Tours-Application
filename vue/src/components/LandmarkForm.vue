<template>
  <div class='contact-form'>

    <h2 class="h2-create">Add a Landmark</h2>

         <p class="p-create">Want to add a landmark not on this list? Fill out this form!</p>
    
    <form class ="create-itinerary-form" v-on:submit.prevent='createLandmark'>

        <label class="label-1"> <span></span><input id="name-input" name='name' v-model='newLandmark.name' placeholder="Landmark Name"/> </label>

        <label class="label-1"> <span></span><input id="address-input" name='address' v-model='newLandmark.address' placeholder="Landmark Address"/></label>
      
        <label class="label-1"> <span></span><input id="description-input" name='description' v-model='newLandmark.description' placeholder="Landmark Description"/></label>
     
        <label class="label-1"> <span></span><input id="venue-type-description" name='venue-type' v-model='newLandmark.venueType' placeholder="Venue Type"/></label>

      
         <button class="create-itinerary-button">Click here to add a Landmark!</button>
  
    </form>

  </div>
</template>

<script>
import landmarkService from '../services/LandmarkService.js';

export default {
  name: 'landmark-list',
  data(){
    return{
      newLandmark: {},
      businessHours: []
    }
  },

  methods: {
      createLandmark() {
          landmarkService.createLandmark(this.newLandmark);
          event.target.reset();
          alert("Landmark submitted for approval.");
      },
      findDay: function () {
        this.businessHours.push({value: ''});
      }
  }
}

</script>

<style>
    .landmark-list{
        padding: 5px;
        margin: 5px;
        border: 1px;
        width: 500px;
        background-color: lavender;
        padding-left: 10px;
        padding-right: 10px;
    }
    .description{
      color:darkslategray;
    }
    .landmark-form {
      font-family: 'Ubuntu', sans-serif;
    }

    .contact-form {
      font-family: 'Ubuntu', sans-serif;
      max-width: 1208px;
      margin: 0 auto;
      text-align: left;
}

  .h2-create {
    margin: 0;
    color: navy;
    text-align: left;
    font-size: 16px;
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

  #address-input, #name-input, #description-input, #venue-type-description, .create-itinerary-button {
    width: 100%; 
   padding: 0.5em;
   border: none;
    font: 300 100%/1.2 'Open Sans', sans-serif;
}

#address-input, #name-input, #description-input, #venue-type-description {
  margin: 0 0 1em;
  border: 1px solid #ccc;
  outline: none;
}

textarea {
  height: 6em;
}

    
</style>