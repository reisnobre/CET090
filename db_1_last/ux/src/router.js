import Vue from 'vue'
import Router from 'vue-router'

import Home from './views/Home.vue'
import Register from './views/Register.vue'
import Dashboard from './views/Dashboard.vue'
import Perfil from './views/Perfil.vue'
Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.NODE_ENV === 'production' ? '/dist' : '',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: 'register',
      name: 'register',
      component: Register
    },
    {
      path: 'dashboard',
      name: 'dashboard',
      component: Dashboard,
      children: [
        {
          path: '/perfil',
          name: 'perfil',
          component: Perfil
        }
      ]
    },
    {
      path: '*',
      name: 'wildcard',
      redirect: Home
    }
  ]
})
