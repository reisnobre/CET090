<template lang="html">
  <main class="page" id="home">
    <div id="contactsWrapper" class="wrapper">
      <h2>Sis-Vision</h2>
      <form class="" id="loginForm" @submit.prevent="auth">
        <b-field>
          <b-input placeholder="Login" v-model="login"></b-input>
        </b-field>
        <b-field>
          <b-input type="password" placeholder="Senha" v-model="password"></b-input>
        </b-field>
        <button type="submit">LOGIN</button>
        <router-link tag="button" :to="{ name: 'register' }">Register</router-link>
      </form>
    </div>
  </main>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'home',
  props: ['scroll'],
  data () {
    return {
      login: 'eduardo.reisnobre@gmail.com',
      password: '123456'
    }
  },
  computed: {
  },
  mounted () {
  },
  methods: {
    ...mapActions([
      'setAuthUser'
    ]),
    auth () {
      let data = {
        login: this.login,
        password: this.password
      }
      this.$http.post('http://localhost:5000/auth', data).then(response => {
        this.setAuthUser(response.data)
        this.$router.push({ name: 'dashboard' })
      })
    }
  },
  components: {
  }
}
</script>
