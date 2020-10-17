<template>
<div class="reviews">

    <h2 class='reviews-header'>Reviews</h2>

    <div class='reviews-list'>
        <div class='review' v-for='review in reviews' v-bind:key='review.id'>
            <h3 id='reviewTitle'>{{review.title}}   </h3><img class='thumb' v-if="review.thumbsUp==true" src = "https://imgur.com/LLPYyXY.png"/><img class='thumb' v-if="review.thumbsDown==true" src = "https://imgur.com/lKO2G1K.png"/>
            <p id='reviewDescription'>{{review.description}}</p>
        </div>
    </div>

  <form class='form' v-on:submit='addReview(newReview)'>
  <h3> Add a Review </h3>
      <div class='title-field'>
          <label for = 'title'>Title </label>
          <input type='text' name='title' v-model='newReview.title'/>
      </div> <br>
      <div>
          <label for = 'description'>Description </label>
          <input class ='description-field' type='text' name='description' v-model='newReview.description'/>
      </div><br>
     <div class='actions'>
         <button v-on: click="window.location.reload();">Submit Review </button>
     </div>
  </form>


</div> 
</template>

<script>
import reviewService from '../services/ReviewService.js';

export default {
    name: 'reviews',
    data() {
        return {
            newReview: {
                "landmarkId" : this.$route.params.id
            },
            reviews:[]
        }

    },

    methods: {
        addReview() {
            reviewService.createReview(this.newReview).then(
                alert("Thanks for your review!"));
                this.newReview = {
                    "landmarkId" : this.$route.params.id
                }
            
        }

    },

    created() {
        reviewService.getReviews(this.$route.params.id).then((response) => {
            this.reviews = response.data
        })
    }
}
</script>

<style>

    .thumb {
        display: inline-flex;
        width: 5%;
        padding-left: 10px;        
    }
    #reviewTitle {
        display:inline-flex;
        text-align: center;
    }
    .reviews {
         font-family: 'Open Sans', sans-serif;
    }
    .reviews-header{
        color: navy;
        text-align: center;
        font-style: bold;
        text-decoration: underline;
    }
    .reviews-list{
        display: grid;
        grid-template-columns: auto auto auto auto;
        text-align: center;
        padding-left: 20px;
        padding-right: 20px;
    }
    .review{
        padding: 20px;
        padding-top: 20px;
        border-radius: 40px;
    }
    .form{
        text-align: center;
        padding: 20px;
        background-image: linear-gradient(to bottom right, lightblue, lavenderblush);
    }
    .description-field{
        width: 50%;
    }
</style>