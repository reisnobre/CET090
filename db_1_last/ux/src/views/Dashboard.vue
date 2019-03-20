<template lang="html">
  <div class="page" id="dashboard">
    <div id="contactsWrapper" class="wrapper">
      <main>
      <h5>Arquivos</h5>
      <b-field>
        <b-input v-model="name" id="searchField" placeholder="Search..." type="search" icon="magnify"></b-input>
      </b-field>
      <hr>
        <div id="pdfs">
          <div v-for="(pdf, index) in pdfs" :key="index" class="columns pdf">
            <div class="column">
              {{ pdf.file_name }}
            </div>
            <div class="column is-1">
              <i class="material-icons">cloud_download</i>
            </div>
            <div class="column is-1">
              <i class="material-icons" @click="deleteFile(pdf.id)">delete_outline</i>
            </div>
          </div>
        </div>
        <hr>
        <b-field>
          <b-upload v-model="dropFiles" multiple drag-drop>
            <section class="section">
              <div class="content has-text-centered">
                <p>
                  <i class="material-icons">cloud_upload</i>
                </p>
                <p>Drop your files here or click to upload</p>
              </div>
            </section>
          </b-upload>
        </b-field>
        <div class="tags">
          <span v-for="(file, index) in dropFiles" :key="index" class="tag is-primary" >
            {{ file.name}}
            <button class="delete is-small" type="button" @click="deleteDropFile(index)"></button>
          </span>
        </div>
        <button @click="uploadBatch">Send</button>
      </main>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  name: 'dashboard',
  props: ['scroll'],
  data () {
    return {
      name: undefined,
      pdfs: [],
      dropFiles: []
    }
  },
  computed: {
    ...mapGetters([
      'user'
    ])
  },
  watch: {
    name (newVal) {
      this.$http.get('http://localhost:5000/pdf', {
        params: {
          file_name: newVal
        }
      }).then(response => {
        console.log(response)
        this.contacts = response.data
      })
    }
  },
  mounted () {
    this.loadData()
  },
  methods: {
    ...mapActions([
      'setAuthUser'
    ]),
    deleteDropFile (index) {
      this.dropFiles.splice(index, 1)
    },
    uploadBatch () {
      let file = this.dropFiles[0]
      let fileReader = new FileReader()

      fileReader.onload = () => {
        let data = fileReader.result
        let base64 = data.replace(/^[^,]*,/, '')
        this.$http.post('http://localhost:5000/pdf', { person_id: this.user.id, file_name: file.name, base_64: base64 }).then(response => {
          this.pdfs = response.data
        })
      }
      fileReader.readAsDataURL(file)
    },
    deleteFile (index) {
      this.$http.delete('http://localhost:5000/pdf', {
        data: {
          person_id: this.user.id,
          id: index
        }
      }).then(response => {
        this.pdfs = response.data
      })
    },
    loadData () {
      this.$http.get('http://localhost:5000/pdf').then(response => {
        this.pdfs = response.data
      })
    }
  },
  components: {
  }
}
</script>
