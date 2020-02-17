<template>
  <div>
    <div class = "grid-container" id = "units">
      <div v-for= "unit in units" :unit="unit" :key="unit.id" >
        <div class="grid-item">
          <h3 class= "grid-item-title">{{unit.title}}</h3>
          <b>{{unit.score}}<br> {{unit.price}}$ </b>
          <img class= "grid-item-image" :src="getImgUrl(unit.image)" v-bind:alt="unit.image">
          <p class = "description"><b>Description: </b><em>{{unit.description.substring(0, 200)}}...</em></p>
          <p class = "description"><b>Cancelation Policy: </b><em>{{unit.cp.substring(0, 100)}}</em></p>
          <router-link :to="{ name: 'Reviews', params: { id: unit.id, unit: unit } }">{{unit.id}}</router-link>
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
      units: [],
      meta: [],
      currentPage: '',
      error: false
    }
  },
  created () {
    axios.get('http://localhost:3000/units')
      .then(response => {
        this.units = response.data['units']
        this.meta = response.data['meta']
        this.currentPage = response.data['meta']['current'].toString()
      })
      .catch(response => function (response) {
        console.log(response.data)
      })
  },
  mounted () {
    this.scroll(this.units)
  },
  methods: {
    getImgUrl (pic) {
      return require('../assets/' + pic)
    },
    scroll (units) {
      window.onscroll = () => {
        let bottomOfWindow = document.documentElement.scrollTop + window.innerHeight === document.documentElement.offsetHeight
        if (bottomOfWindow && this.currentPage <= this.meta['total']) {
          if (this.currentPage > 1) {
            axios.get('http://localhost:3000/units?page=' + (this.currentPage++))
              .then(response => {
                var arr = response.data['units']
                var i
                for (i = 0; i < arr.length; i++) {
                  this.units.push(arr[i])
                }
                // this.units.push(arr)
                // console.log(response.data['units'])
              })
          } else {
            this.currentPage++
          }
        }
      }
    }
  }
}
</script>
<style>
  .grid-container {
      grid-template-columns: auto auto auto;
      grid-auto-rows: 1fr;
      padding: 10px;
      max-width: 100%;
      display: grid;
  }
  .grid-item{
      box-shadow: 2px 6px 10px 0 rgba(0,0,0,0.1);
      padding: 1%;
      margin: 2%;
      text-align: center;
      border-radius: 25px;
  }
  .grid-item > img{
    max-width: 90%;
    max-height: 90%;
  }
  .grid-item > small{
      font-weight: bold;
  }
  .grid-item:hover{
      box-shadow: 4px 10px 18px 0 rgba(0,0,0,0.5);
  }
  .description {
    text-align: center
  }

  details {
      width: 100%;
      overflow: hidden;
      white-space: nowrap;
  }
  .button{
    float: left;
    float: inline-start;
  }
</style>
