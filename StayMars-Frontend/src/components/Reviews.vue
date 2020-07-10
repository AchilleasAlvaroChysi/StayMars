<template>
  <div>
    <h3>WELCOM TO REV {{id}}</h3>
    <div class="container">
      <div id = "details">
        <h3>{{unit.title}} <em>{{unit.region}}</em></h3>
        <div class = "row">
          <div class = "col-md-8">
            <img :src="getImgUrl(unit.image)" v-bind:alt="unit.image">
          </div>
          <div class = "col-md-4" id = "unit-details">
            <p> {{unit.score}} <span class = "fa fa-star checked"></span></p>
            <p> {{unit.price}}$ </p>
            <p><b>Cancelation Policy:</b><br><em>{{unit.cp}}</em></p>
            <p><b>Description:</b><br><em>{{unit.description}}</em></p>
          </div>
        </div>
        <div v-for="review in reviews" :review= "review" :key="review.id" class="review">
          <div class = "col-md-4">
            <h4 class= "review-creator">User {{review.user_id}} said:</h4>
          </div>
          <p class = "review-text"><em>"{{review.body}}"</em></p>
          <em>{{review.score}}</em><small><em>{{review.created_at}}</em></small>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data () {
    return {
      id: 0,
      reviews: [],
      unit: null
    }
  },
  created () {
    this.id = this.$route.params.id
    this.reviews = this.getReviews(this.id)
    this.unit = this.getUnit(this.id)
    console.log(this.unit)
  },
  methods: {
    getUnit (id) {
      axios.get('http://localhost:3000/units/' + this.id)
        .then(response => {
          this.unit = response.data['unit']
          console.log(this.unit)
        })
    },
    getReviews (id) {
      axios.get('http://localhost:3000/units/' + this.id)
        .then(response => {
          this.reviews = response.data['reviews']
        })
    },
    getImgUrl (pic) {
      return require('../assets/' + pic)
    }
  }
}
</script>
<style>
img{
  max-width: 100%
}
h3{
  text-align: center
}
small{
  float: right;
}
.review-text{
  text-align: center;
  margin: 2%;
}
.review {
  border-style: solid;
  border-width: 0px 3px 3px 0px;
  border-color: black;
  margin: 2%;
}
.review:hover{
  border-width: 0px 5px 5px 0px;
}
#unit-details{
  text-align: center;
  border-style: solid;
  border-width: 1px 2px 2px 1px;
}
#unit-details:hover{
  border-width: 2px 4px 4px 2px;
}
.review-creator{
  border-style: solid;
  border-width: 1px 1px 1px 1px;
  border-radius: 5px;
  width: 50%;
}
.checked{
  color: orange
}
</style>
