<template>
  <div>
    <h2> Welcome </h2>
    <div class = "grid-container" id = "units">
      <div v-for= "unit in units" :unit="unit" :key="unit.id" class="grid-item">
        <h3><router-link to= "HelloWorld">{{unit.title}}</router-link></h3>
        <span class = "fa fa-map-marker">{{unit.region}}</span>
        <font-awesome-icon icon="fas fa-map-marker" />
        <img :src="getImgUrl(unit.image)" v-bind:alt="unit.image">
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
        console.log(response.data['units'] instanceof Array)
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
.checked {
    color: orange;
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
