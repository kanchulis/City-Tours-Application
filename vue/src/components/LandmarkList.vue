<template>
  <div class="landmark-main-div"> <br>
  <GoogleMaps v-bind:pointsToDisplay="filteredList"/>
      
      <div class='category-dropdown'>
        <label> View Landmarks by Category: 
        <select id="categoryFilter" v-model='filter.venueType' v-on:change='changeSelectedLandmarks'>
          <option value="viewAll" default>View All</option>
          <option value="Parks & Gardens">Parks & Gardens</option>
          <option value="Museums & Historical Sites">Museums & Historical Sites</option>
          <option value="Restaurants">Restaurants</option>
          <option value="Shopping">Shopping</option>
          <option value="Kid-Friendly">Kid-Friendly</option>
        </select>
        </label>
        </div>
    
<div class="grid-container-landmark">
    <div class='landmark-list' v-for='landmark in filteredList' v-bind:key='landmark.id'>
      <router-link v-bind:to="{name: 'landmark-details', params: {id: landmark.id} }">
          <h3 class='sub-header'>{{landmark.name}}</h3> 
      </router-link>
      <div class="thumbs">
      <img class='thumbsUp' src = "https://imgur.com/LLPYyXY.png" v-on:click="addThumbsUp(landmark.id)"/><img class='thumbsDown' src = "https://imgur.com/lKO2G1K.png" v-on:click="addThumbsDown(landmark.id)"/><br>
          <p class='thumbsUpCount'>{{landmark.thumbsUp}}</p> <p class='thumbsDownCount'>{{landmark.thumbsDown}}</p>
      </div>
      <p class='description'>{{landmark.description}}</p>
      <br><br>
      <input class="checkbox" type="checkbox" v-on:click="addLandmark(landmark.id)"/><label name='addToItinerary'> Add to Itinerary </label>
    </div>
</div>

  </div>
</template>

<script>
import landmarkService from '../services/LandmarkService.js';
import reviewService from '../services/ReviewService.js';
import itineraryService from '@/services/ItineraryService.js';
import GoogleMaps from '@/components/GoogleMaps.vue';

export default {
  name: 'landmark-list',
  components : {
    GoogleMaps
  },
 
  data(){
    return{
      landmarks: [],
      newLandmark: {},
      itineraries: [],
      updatedItinerary: {
        name: "",
      },
      newReview: {},
      filter: {
        venueType: {},
        
      }
      
    }
  },

  methods: {
    addThumbsUp(id) {
      this.newReview = {
        "title" : "",
        "thumbsUp" : true,
        "landmarkId" : id
      }
      reviewService.createReview(this.newReview)
      window.location.reload()
    },

    addThumbsDown(id) {
      this.newReview = {
        "title" : "",
        "thumbsDown" : true,
        "landmarkId" : id
      }
      reviewService.createReview(this.newReview)
      window.location.reload()
    },
    addLandmark(id) {
      this.$store.commit("ADD_ITINERARY_LANDMARK", id);
    },
    changeSelectedLandmarks(){
      this.$store.commit("ASSIGN_LANDMARKS", this.filteredList)
      console.log("this is what the state looks like after I toggle the list of landmark tyhpes")
      console.log(this.$store.state.selectedLandmarks)
    }

  },
  
  created() {
    landmarkService.getLandmarks().then((response)=>{
      this.landmarks=response.data;
 
    }
     )
  },

  computed: {
    filteredList(){
      if(this.filter.venueType=='viewAll'){
        return this.landmarks;
      }
      else {
        return this.landmarks.filter(landmark=>{
          return Object.values(landmark).includes(this.filter.venueType);
      });
    }
  }
  }
}

</script>

<style>
  .category-dropdown{
    display: flex;
    flex-shrink: 2;
    justify-content: center;
    margin: 10px;
    
  }
  #category-paragraph {
    padding-bottom: 10px;
  }
  
    .landmark-list{
        padding: 5px;
        margin: 5px;
        width: 500px;
        background-image: linear-gradient(to bottom right, lightblue, lavender);
        border-radius: 20px;
    }
    .description{
      color:darkslategray;
    }

    .sub-header {
      display: inline-flex;
      flex-wrap: wrap;
      width: 75%;
    }

    .thumbs{
      /* display: inline-flex; */
      flex-wrap: wrap;
    }
    .thumbsUp {
      display: inline-flex;
      justify-content: flex-end;
      padding-right: 10px;
      width: 5%; 
    }

    .thumbsDown {
      display: inline-flex;
      justify-content: flex-end;
      padding-left: 10px; 
      width: 5%;
    }

    .thumbsUpCount {
      display: inline-flex;
      justify-content:end;
      padding-left: 2.5%
    }

    .thumbsDownCount {
      display: inline-flex;
      justify-content: end;
      padding-left: 6%
    }
    .grid-container-landmark {
      display: grid;
      grid-template-columns: auto auto auto;
      padding: 10px;
      margin-left: 75px;
  
    }
    .thumbsUp:hover {
      cursor: pointer;
    }
    .thumbsDown:hover {
      cursor: pointer;
    }
    .landmark-main-div {
      font-family: 'Open Sans', sans-serif;
    }
   
</style>