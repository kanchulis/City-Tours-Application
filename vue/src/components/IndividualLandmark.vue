<template>
  <div class="individual-landmark">

    <div class='header'><br>
        <router-link class='header-link' :to="{ name: 'landmark' }">Back to Landmarks</router-link>
        <h1 class="landmark-name"> {{ landmark.name }} </h1> 
    </div>


    <div class='landmark-info'>
        <h3 class="venue-type"> <br>{{ landmark.venueType }} </h3> 
        <div class='landmark-details'>
            <div class='address'>{{ landmark.address }} </div><br>
            {{ landmark.description }} <br>
        <br>
    </div>
    <div class='business-hours' v-for='hours in landmark.businessHours' v-bind:key='hours.day_of'>
        <p class='day'>{{ hours.day }}</p> {{ hours.open_time }} <br> {{ hours.close_time }} <br>
    </div>
    <br>
    </div>

    <div class="row">
    <div class='landmark-images' v-for='images in landmark.images' v-bind:key='images.imgUrl'>
        <img class="landmark-photos" v-bind:src= images.imgUrl /> <br>
    </div>
    </div>

    
  </div>
</template>

<script>
import landmarkService from '../services/LandmarkService.js';

export default {
    name: 'individual-landmark',

    data() {
       return {
            landmark: {},
       } 
    },

    methods: {
        updateItinerary(){

        }
    },

    created() {
        landmarkService.getOneLandmark(this.$route.params.id).then(
            (response) => {
                this.landmark = response.data;
            }
        );

      
    
    }

}
</script>

<style>
.header-link{
    background-color: lavenderblush;
    padding: 10px;
    border-radius: 100px;
    opacity: .85;
    margin-top: 20px;
}
.landmark-name{
    background-color: lavenderblush;
    border-radius: 100px;
    opacity: .85;
    font-family: 'Open Sans', sans-serif;
    font-size: 30px;
    margin-left: 200px;
  /* background-color: lavenderblush; */
    margin-left: 620px;
    margin-right: 620px;
    padding: 50px;
    justify-content: center;
    font-weight: 600;
    letter-spacing: 0.25vw;
    text-transform: uppercase;
    text-align: center;
}
.row {
    display: flex;
}
.landmark-images {
    flex: 33.33%;
    padding: 5px;
    margin-bottom: 20px;
}
.landmark-photos {
    float: left;
    width: 600px;
    height: 400px;
    background-size: cover;
    justify-content: center;
    border-radius: 150px;
}
.individual-landmark {
    font-family: 'Open Sans', sans-serif;
    background: lavender;
    padding-left: 10px;
}
.business-hours{
    padding: 20px;
    font-weight: bold;
}
.landmark-info{
    padding-top: 40px;
    padding-bottom: 20px;
    display: flex;
    flex-grow: 2;
    justify-content: space-between;
}
.landmark-details{
    padding-right: 20px;
    padding-left: 20px;
    padding-top: 20px;
    padding-bottom: 20px;
    text-align: center;
}
.venue-type{
    padding: 5px;
    border-radius: 40px;
    background-color:white;
    color: navy;
    text-align:center;
}
.address{
    font-weight: bold;
}
.day{
    font-weight: bold;
    font-style: italic;
}
</style>