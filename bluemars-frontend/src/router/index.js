import Vue from 'vue'
import Router from 'vue-router'
import Login from '@/components/Login'
import Units from '@/components/Units'
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
    }
  ]
})
