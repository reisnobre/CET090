<template lang="html">
  <main class="page" id="network">
    <div class="wrapper">
      <div class="columns">
        <div class="column">
          <article>
            <header>
              <img src="../../public/img/icons/contract@2x.png" alt=""/>
              <h4>ASSESSORIA</h4>
            </header>
            <div class="body">
              <p>Te ajudamos a fazer do planejamento do seu projeto ao resultado final. Colaboramos diretamente na concepção e realização das demandas necessárias para a execução de toda ou parte do projeto.</p>
              <router-link tag="button" :to="{ name: 'services' }">SAIBA MAIS</router-link>
              <!-- <button>SAIBA MAIS</button> -->
            </div>
          </article>
        </div>
        <div class="column">
          <article>
            <header>
              <img src="../../public/img/icons/time@2x.png" alt=""/>
              <h4>CONSULTORIA</h4>
            </header>
            <div class="body">
              <p>Consultoria para todas as etapas que envolvem a análise de dados. Te auxiliamos a pensar desde o planejamento até a obtenção do resultado final do seu projeto. Profissionais qualificados para a orientação e direcionamento que você precisa!</p>
              <router-link tag="button" :to="{ name: 'services' }">SAIBA MAIS</router-link>
            </div>
          </article>
        </div>
        <div class="column">
          <article>
            <header>
              <img src="../../public/img/icons/hours@2x.png" alt=""/>
              <h4>CONSULTORIA</h4>
            </header>
            <div class="body">
              <p>Consultoria para todas as etapas que envolvem a análise de dados. Te auxiliamos a pensar desde o planejamento até a obtenção do resultado final do seu projeto. Profissionais qualificados para a orientação e direcionamento que você precisa!</p>
              <router-link tag="button" :to="{ name: 'services' }">SAIBA MAIS</router-link>
            </div>
          </article>
        </div>
      </div>

    </div>
  </main>
</template>

<script>
export default {
  name: 'network',
  props: ['scroll'],
  data () {
    return {
    }
  },
  computed: {
  },
  mounted () {
  },
  components: {
  }
}
</script>
