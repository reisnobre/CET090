<template>
  <div id="app">
    <header id="mainHeader">
      <div class="wrapper" v-if="user">
        <h4>Bem vindo {{ user.name }}</h4>
        <nav>
          <ul>
            <router-link tag="li" :to="{ name: 'home' }">Início</router-link>
            <router-link tag="li" :to="{ name: 'dashboard' }">Paínel</router-link>
          </ul>
        </nav>
      </div>
      <div class="wrapper" v-else>
      </div>
    </header>
    <transition name="fade" mode="out-in">
      <router-view :scroll="scroll"></router-view>
    </transition>
  </div>
</template>

<script>
import detectIt from 'detect-it'
import { mapGetters } from 'vuex'
export default {
  name: 'app',
  data () {
    return {
      scroll: 0
    }
  },
  computed: {
    ...mapGetters([
      'user'
    ])
  },
  mounted () {
    window.addEventListener('scroll', e => {
      let scrollNode = document.scrollingElement || document.documentElement
      this.scroll = scrollNode.scrollTop
    }, detectIt.passiveEvents ? { passive: true } : false)
  },
  components: {
  }
}
</script>

<style lang="scss">
@import "~bulma/sass/utilities/_all";

$primary: #A1212C;
$primary-invert: findColorInvert($primary);
$twitter: #4099FF;
$twitter-invert: findColorInvert($twitter);

$colors: (
    "white": ($white, $black),
    "black": ($black, $white),
    "light": ($light, $light-invert),
    "dark": ($dark, $dark-invert),
    "primary": ($primary, $primary-invert),
    "info": ($info, $info-invert),
    "success": ($success, $success-invert),
    "warning": ($warning, $warning-invert),
    "danger": ($danger, $danger-invert),
    "twitter": ($twitter, $twitter-invert)
);

$link: $primary;
$link-invert: $primary-invert;
$link-focus-border: $primary;
.input{
  &:focus, &:active{
    border-color: $primary !important;
    box-shadow: 0 0 0 0.125em rgba(161, 33, 44, 0.25) !important;
  }
}
@import "./scss/main.scss";
</style>
