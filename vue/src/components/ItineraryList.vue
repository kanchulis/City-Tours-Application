<template>
  <div class="itinerary-div">
    <div class="heading">
        <br><br><h1 class='header-name-it'>View Available Itineraries</h1>
    </div>

      <div class="grid-container">

          <div class="grid-child-personal">

    <h2 class='itinerary-header'>Personal Itineraries</h2>
    <div class='itinerary-list' v-for='itinerary in myItineraries' v-bind:key="itinerary.itineraryId">
        <h3 class = 'sub-header'>Name: {{itinerary.name}} </h3> <br>
        <b>Starting Location: </b> {{itinerary.startingLocation}} <br><br>
        <b>Date:</b> {{itinerary.date}} <br><br>
        <router-link :to="{ name: 'itinerary-details', params: {id: itinerary.itineraryId}}"> Edit Itinerary </router-link> <br> <br>
        <button id="drivingDirections" v-on:click='generateDrivingLink(itinerary.itineraryId, itinerary.startingLocation)'>Get Driving Directions!</button>
        <br><br><button v-on:click.prevent='deleteItinerary(itinerary.itineraryId)'> Delete </button>
    </div>
            </div>

            <div class="grid-child-shared">

    <h2 class='itinerary-header'>Itineraries Shared With You</h2>
    <div class='itinerary-list' v-for='itinerary in myFriendsItineraries' v-bind:key="itinerary.id">
        <h3 class = 'sub-header'>Name: {{itinerary.name}} </h3> <br>
        Starting Location: {{itinerary.startingLocation}} <br>
        Date: {{itinerary.date}} <br><br>
        <router-link :to="{ name: 'itinerary-details', params: {id: itinerary.itineraryId}}"> View Itinerary </router-link> 
        
    </div>
    </div>
      </div>
  </div>
</template>

<script>
import itineraryService from '../services/ItineraryService.js';
import landmarkService from '../services/LandmarkService.js';

let baseDirURL = "http://wwww.google.com/maps/dir/startinglocation/"

export default {
    name: 'itinerary-list',
    data(){
        return{
            myItineraries: [],
            myFriendsItineraries: [],
            itineraryLandmarks: [],
            landmarks: [],
            googleDirections : '',
        }
    },
    methods:{
        deleteItinerary(id) {
            if (
                confirm("Are you sure you want to delete this itinerary? This action cannot be undone.")
            ) {
                itineraryService.deleteItinerary(id)
                
            }
            window.location.reload().then(
                    alert("Itinerary successfully deleted."));
            
        },
        generateDrivingLink(id, startingLocation){
            itineraryService.getLandmarkAddresses(id).then((response)=> {
                this.itineraryLandmarks = response.data;
        this.itineraryLandmarks.forEach((landmark)=>{
            this.googleDirections = this.googleDirections + landmark.address + "/"
        })
        this.googleDirections = "http://www.google.com/maps/dir/"+ startingLocation + "/" + this.googleDirections
        window.open(this.googleDirections)
        this.googleDirections = ''
            });

        }

    },
    created(){
        itineraryService.getMyItineraries().then((response)=>{
            this.myItineraries=response.data;
        });
        itineraryService.getFriendsItineraries().then((response)=>{
            this.myFriendsItineraries=response.data;
        });
        landmarkService.getLandmarks().then((response) => {
            this.landmarks = response.data;
        })
    },
    computed: {
        
    },
}
</script>

<style>
.heading{
  background-color: lavender;
  padding-top: 1px;
  
}
.header-name-it{
    font-family: 'Open Sans', sans-serif;
    font-size: 30px;
    margin-left: 200px;
  /* background-color: lavenderblush; */
  border-radius: 40px;
  opacity: 0.75;
  margin-left: 660px;
  margin-right: 660px;
  padding-bottom: 50px;
  justify-content: center;
  font-weight: 600;
  letter-spacing: 0.25vw;
  text-transform: uppercase;
}
    .itinerary-list{
        padding: 20px;
        margin-left: 150px;
        margin-bottom: 30px;
        border: 1px;
        width: 500px;
        background-image: linear-gradient(to bottom right, lavender, lightblue);
        border-radius: 40px;
        justify-content: center;
    }
     .grid-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 200px;
        justify-content: center;
    }
    .sub-header{
        color: navy;
    }
    .itinerary-div {
        font-family: 'Open Sans', sans-serif;
    }
   .itinerary-header{
       text-align: center;
   }
</style>