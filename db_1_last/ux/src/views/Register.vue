<template lang="html">
  <main class="page" id="register">
    <div id="contactsWrapper" class="wrapper">
      <h3>Register</h3>
      <form class="" id="registerForm" @submit.prevent="register">
        <b-field>
          <b-input type="email" placeholder="Login" v-model="login"></b-input>
        </b-field>
        <b-field>
          <b-input placeholder="CNPJ" v-model="cnpj" v-mask="['##.###.###/####-##']"></b-input>
        </b-field>
        <b-field>
          <b-input placeholder="Nome" v-model="name"></b-input>
        </b-field>
        <b-field>
          <b-input placeholder="Nome Fantasia" v-model="fName"></b-input>
        </b-field>
        <b-field>
          <b-input type="password" placeholder="Senha" v-model="password"></b-input>
        </b-field>
        <button type="submit">Register</button>
      </form>
    </div>
  </main>
</template>

<script>
export default {
  name: 'home',
  props: ['scroll'],
  data () {
    return {
      login: undefined,
      cnpj: undefined,
      name: undefined,
      fName: undefined,
      password: undefined
    }
  },
  computed: {
  },
  beforeMount () {
  },
  methods: {
    register () {
      let data = {
        login: this.login,
        cnpj: this.cnpj,
        name: this.name,
        fantasy_name: this.fName,
        password: this.password
      }
      this.$http.post('http://localhost:5000/person', data).then(response => {
        if (response.status === 200) this.$router.push({ name: 'home' })
      })
    },
    update () {
      let address = {
        street: this.address.street,
        number: this.address.number,
        contact_id: this.address.contact_id,
        city_id: this.address.city.id,
        state_id: this.address.state.id,
        country_id: this.address.country.id,
        neighborhood_id: this.address.neighborhood.id,
        type_of_address_id: this.address.type_of_address.id
      }
      let phone = {
        contact_id: this.phone.contact_id,
        ddd: this.phone.ddd,
        phone: this.phone.phone,
        type_phone_id: this.phone.type_phone.id
      }
      this.$http.put('http://localhost:5000/contato', this.contact).then(response => {
        this.contact = response.data
        this.$http.put('http://localhost:5000/endereco', address).then(response => {
          this.address = response.data
          this.$http.put('http://localhost:5000/telefone', phone).then(response => {
            this.phone = response.data
            this.editing = false
          }).then(() => {
            // this.loadData()
          })
        })
      })
    },
    loadData () {
      this.$http.get('http://localhost:5000/contato', {
        params: {
          id: this.$route.params.id
        }
      }).then(response => {
        this.contact = response.data
        this.$http.get('http://localhost:5000/telefone', {
          params: {
            contact_id: this.$route.params.id
          }
        }).then(response => {
          this.phone = response.data
          this.$http.get('http://localhost:5000/endereco', {
            params: {
              contact_id: this.$route.params.id
            }
          }).then(response => {
            this.address = response.data
            this.loadSupportData()
          })
        })
      })
    },
    loadSupportData () {
      this.$http.get('http://localhost:5000/tipo-telefone').then(response => {
        this.typeOfPhone = response.data
        this.$http.get('http://localhost:5000/bairro').then(response => {
          this.neighborhoods = response.data
          this.$http.get('http://localhost:5000/cidade').then(response => {
            this.cities = response.data
            this.$http.get('http://localhost:5000/estado').then(response => {
              this.states = response.data
              this.$http.get('http://localhost:5000/pais').then(response => {
                this.countries = response.data
              })
            })
          })
        })
      })
    }
  },
  components: {
  }
}
</script>
