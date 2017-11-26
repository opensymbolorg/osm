<template>
  <el-container class="is-vertical">
    <app-header></app-header>
    <el-main class="detail-view">
      <el-row :gutter="30">
        <el-col :span="10">
          <el-card :body-style="{ padding: '0px' }">
            <div class="token-wrapper" style="padding: 40px 0">
              <span class="token-symbol">{{ path }}</span>
            </div>
          </el-card>
        </el-col>
        <el-col :span="14">
          <h3>Vote ending in 30 days</h3>
          <p>Status: {{ symbol.status }}</p>
          <p>Votes: {{ voteTotal }}</p>
          <p>Contestants: {{ symbol.listed.length }}</p>
        </el-col>
      </el-row>
      <section class="token-list">
        <h3>Tokens</h3>
        <el-row :gutter=10 v-for="(item, index) in symbol.listed" :key="index">
          <el-col :span="14">
            <p><b>{{ item.name }}</b></p>
            <p>{{ item.id }}</p>
          </el-col>
          <el-col :span="5">{{ item.votes }}</el-col>
          <el-col :span="5"><el-button size="small">Vote</el-button></el-col>
        </el-row>
      </section>
    </el-main>
    <app-footer></app-footer>
  </el-container>
</template>

<script>
import { mapState, mapActions } from 'vuex'
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
      input: '',
      path: null
    }
  },
  computed: {
    ...mapState([
      'symbol'
    ]),
    currentSymbol () {
      return this.$route.params.symbol
    },
    voteTotal () {
      return this.symbol.listed.reduce((acc, curr) => curr.votes + acc, 0)
    }
  },
  methods: {
    ...mapActions([
      'fetchPay',
      'fetchGame'
    ])
  },
  created () {
    this.path = this.$route.params.symbol

    if (['USD', 'PAY', 'OSM', 'BITUSD'].includes(this.path)) {
      this.fetchPay()
    } else {
      this.fetchGame()
    }
  }
}
</script>
