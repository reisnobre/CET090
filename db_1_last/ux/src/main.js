import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import { api } from './api'

import axios from 'axios'
import VueAxios from 'vue-axios'
import Buefy from 'buefy'
import 'buefy/lib/buefy.css'
import VueTheMask from 'vue-the-mask'
import './registerServiceWorker'

Vue.use(VueTheMask)
Vue.use(Buefy)
Vue.use(VueAxios, axios)

Vue.config.productionTip = false
Vue.prototype.$api = api

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
