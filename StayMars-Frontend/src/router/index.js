import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Units from '@/components/Units'
import Reviews from '@/components/Reviews'
// import HelloWorld from '@/components/HelloWorld'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/units',
      name: 'Unit',
      component: Units
    },
    {
      path: '/units/:id',
      name: 'Reviews',
      component: Reviews
    }
  ]
})
