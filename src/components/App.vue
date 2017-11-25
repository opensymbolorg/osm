<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'app',
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

