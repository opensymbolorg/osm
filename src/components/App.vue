<template>
  <div id="app">
    <router-view></router-view>
    <register-modal></register-modal>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
import RegisterModal from './RegisterModal.vue'

export default {
  name: 'app',
  components: {
    RegisterModal
  },
  methods: {
    ...mapActions([
      'fetchSymbols'
    ])
  },
  created: function () {
    this.fetchSymbols()
  }
}
</script>

<style lang="sass">
@import "../assets/css/base.scss";
@import "../assets/css/main.scss";
@import "../assets/css/footer.scss";
</style>

