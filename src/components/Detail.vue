<template>
  <el-container class="is-vertical">
    <app-header></app-header>
    <el-main>
      Detail
    </el-main>
    <app-footer></app-footer>
  </el-container>
</template>

<script>
// import { mapGetters } from 'vuex'
import AppHeader from './layout/Header'
import AppFooter from './layout/Footer'

export default {
  name: 'home',
  components: {
    AppHeader,
    AppFooter
  },
  data () {
    return {
      input: ''
    }
  },
  computed: {
    symbol () {
      return this.$route.params.symbol
    }
  }
}
</script>
