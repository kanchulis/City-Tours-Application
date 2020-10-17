<template>
  <div>
    <div id="map"></div>
    <!-- <div class="location">
      Enter Starting Location:
      <input
        id="userProvidedLocation"
        type="text"
        name="location"
        v-model="startingLocation"
      />
      <button id="manualLocation">Submit</button>
      OR
      <button id="getGeoLocation" v-on:click="getLocation()">
        Get Current Location</button
      ><br />
    </div> -->
  </div>
</template>

<script>

export default {
  name: "Map",
  props: ["pointsToDisplay"],
  watch: {
    pointsToDisplay: function (newVal, oldVal) {
     
      for (let i = 0; i < this.$markerReferences.length; i++) {
        this.$markerReferences[i].setMap(null);
      }

      for (let i = 0; i < newVal.length; i++) {
        let marker = new window.google.maps.Marker({
          position: { lat: newVal[i].lat, lng: newVal[i].lng },
          map: this.map,
        });
        this.$markerReferences.push(marker);
      }

  //     let dS = new window.google.maps.DirectionsService();

  //     let request= {
  //       origin : 'Detroit',
  //       destination : 'Cleveland',
  //       travelMode: window.google.maps.TravelMode.WALKING
  //     }

  //     dS.route(request, function(response, status) {
  //   if (status == window.google.maps.DirectionsStatus.OK) {
  //     map.fitBounds(response.routes[0].bounds);
  //   }

  //     var line = new window.google.maps.Polyline({
  //     path: directionResult.routes[0].overview_path,
  //     strokeColor: '#FF0000',
  //     strokeOpacity: 0.5,
  //     strokeWeight: 4
  // });

  // line.setMap(this.map);

  // let dR  = new window.google.maps.DirectionsRenderer({
  //         preserveViewport: true,
  //         suppressMarkers: true
  //       });




  // });


    },
  },
  data() {
    return {
      map: null,
      location: null,
      gettingLocation: false,
      errorStr: null,
      landmarks: [],
      points: [],
      startingLocation: "",
    };
  },
  methods: {
    initMap() {
      this.map = new window.google.maps.Map(document.getElementById("map"), {
        // center: { lat: 30.2672, lng: -97.7431 },
        center: {lat:30.3734125, lng: -97.744081},
        zoom: 10,
        maxZoom: 20,
        minZoom: 3,
        streetViewControl: true,
        mapTypeControl: true,
        fullscreenControl: true,
        zoomControl: true,
      });
    },
    getLocation() {
      //do we support geolocation
      if (!("geolocation" in navigator)) {
        this.errorStr = "Geolocation is not available.";
        return;
      }

      this.gettingLocation = true;
      // get position
      navigator.geolocation.getCurrentPosition(
        (pos) => {
          this.gettingLocation = false;
          this.location = this.startingLocation || pos;
          console.log(pos);
        },
        (err) => {
          this.gettingLocation = false;
          this.errorStr = err.message;
        }
      );
    },

    setMarker(points) {
      for (let i = 0; i < points.length; i++) {
        let marker = new window.google.maps.Marker({
          position: { lat: points[i].lat, lng: points[i].lng },
          map: this.map,
        });
      }
    },
  },

  created() {
    // landmarkService.getLandmarks().then((response) => {
    //   this.landmarks = response.data;

    //   this.landmarks.forEach((landmark) => {
    //     this.points.push({
    //       lat: landmark.lat,
    //       lng: landmark.lng,
    //     });
    //   });

    //   this.setMarker(this.points);

    // });

    let filteredList = this.$store.state.selectedLandmarks;
    console.log("test");
    console.log(filteredList);
  },
  mounted() {
    this.initMap();
  },
};
</script>

<style>
#map {
  height: 500px;
}
.location {
  text-align: center;
  padding-top: 10px;
}
</style>