<template lang="html">
  <main class="page" id="contact" v-if="contact">
    <div id="contactsWrapper" class="wrapper">
      <h2>{{ contact.name || 'Nome' }}</h2>
      <div id="control">
        <i class="material-icons" @click="editing = !editing">
          edit
        </i>
        <i class="material-icons">
          delete
        </i>
      </div>
      <transition name="fade" mode="out-in">
        <div class="body" v-if="!editing">
          <div class="content">
            <div v-if="contact">
              <h4>Dados básicos</h4>
              <p><strong>Nome: </strong>{{ contact.name }}</p>
              <p><strong>Email: </strong>{{ contact.email }}</p>
            </div>
            <div v-if="zipedPhone">
              <h4>Telefone</h4>
              <p><strong>Telefone: </strong>{{ zipedPhone }} - {{ this.phone.type_phone.name }}</p>
            </div>
            <div v-if="address">
              <h4>Endereço</h4>
              <p><strong>Rua: </strong>{{ address.street }}, nº {{ address.number }}, {{ address.type_of_address.name }}</p>
              <p><strong>Bairro: </strong>{{ address.neighborhood.name }}, <strong>Cidade: </strong>{{ address.city.name }}, <strong>Estado: </strong>{{ address.state.name }}</p>
              <p><strong>País: </strong>{{ address.country.name }}</p>
            </div>
          </div>
        </div>
        <form class="body" v-else @submit.prevent="update">
          <div class="content">
            <h4>Dados básicos</h4>
            <b-field label="Nome">
              <b-input v-model="contact.name"></b-input>
            </b-field>
            <b-field label="Email">
              <b-input v-model="contact.email"></b-input>
            </b-field>
            <b-field label="Apelido">
              <b-input v-model="contact.nickname"></b-input>
            </b-field>
            <h4>Telefone</h4>
            <div class="columns">
              <div class="column is-one-fifth">
                <b-field label="DDD">
                  <b-input v-model="phone.ddd"></b-input>
                </b-field>
              </div>
              <div class="column">
                <b-field label="Numero">
                  <b-input v-model="phone.phone"></b-input>
                </b-field>
              </div>
            </div>
            <b-field label="Tipo de Numero">
              <b-select placeholder="Selecione" v-model="phone.type_phone.id" expanded>
                <option
                    v-for="(tf, index) in typeOfPhone"
                    :value="tf.id"
                    :key="index">
                    {{ tf.name }}
                </option>
              </b-select>
            </b-field>
            <h4>Endereço</h4>
            <div class="columns">
              <div class="column">
                <b-field label="Rua">
                  <b-input v-model="address.street"></b-input>
                </b-field>
              </div>
              <div class="column is-one-fifth">
                <b-field label="Número">
                  <b-input v-model="address.number"></b-input>
                </b-field>
              </div>
            </div>
            <div class="columns">
              <div class="column is-one-fifth">
                <b-field label="Tipo de Endereço">
                  <b-select placeholder="Selecione" v-model="address.type_of_address.id" expanded>
                    <option
                        v-for="(tf, index) in typeOfPhone"
                        :value="tf.id"
                        :key="index">
                        {{ tf.name }}
                    </option>
                  </b-select>
                </b-field>
              </div>
              <div class="column">
                <b-field label="Bairro">
                  <b-select placeholder="Selecione" v-model="address.neighborhood.id" expanded>
                    <option
                        v-for="(n, index) in neighborhoods"
                        :value="n.id"
                        :key="index">
                        {{ n.name }}
                    </option>
                  </b-select>
                </b-field>
              </div>
            </div>
            <div class="columns">
              <div class="column">
                <b-field label="Cidade">
                  <b-select placeholder="Selecione" v-model="address.city.id" expanded>
                    <option
                        v-for="(n, index) in cities"
                        :value="n.id"
                        :key="index">
                        {{ n.name }}
                    </option>
                  </b-select>
                </b-field>
              </div>
              <div class="column">
                <b-field label="Estado">
                  <b-select placeholder="Selecione" v-model="address.state.id" expanded>
                    <option
                        v-for="(n, index) in states"
                        :value="n.id"
                        :key="index">
                        {{ n.name }}
                    </option>
                  </b-select>
                </b-field>
              </div>
            </div>
            <b-field label="Pais">
              <b-select placeholder="Selecione" v-model="address.country.id" expanded>
                <option
                    v-for="(n, index) in countries"
                    :value="n.id"
                    :key="index">
                    {{ n.name }}
                </option>
              </b-select>
            </b-field>
            <button type="submit">Enviar</button>
          </div>
        </form>
      </transition>
    </div>
  </main>
</template>

<script>
export default {
  name: 'home',
  props: ['scroll'],
  data () {
    return {
      contact: undefined,
      phone: undefined,
      address: undefined,
      typeOfPhone: [],
      neighborhoods: [],
      cities: [],
      states: [],
      countries: [],
      editing: false
    }
  },
  computed: {
    zipedPhone () {
      return this.phone ? (this.phone.ddd + this.phone.phone) : this.phone
    }
  },
  beforeMount () {
    this.loadData()
  },
  methods: {
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
