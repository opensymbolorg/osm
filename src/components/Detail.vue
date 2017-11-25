<template>
  <el-container class="is-vertical">
    <app-header></app-header>
    <el-main class="detail-view">
      <el-row :gutter="30">
        <el-col :span="10">
          <el-card :body-style="{ padding: '0px' }">
            <div class="coin-wrapper">
              <span class="coin-name">{{ symbol }}</span>
            </div>
          </el-card>
        </el-col>
        <el-col :span="14">
          <h3>Vote ending in 30 days</h3>
          <p>Category: Gaming</p>
          <p>Status: Voting</p>
          <p>Votes: 2034</p>
          <p>Contestants: 4</p>
        </el-col>
      </el-row>
      <section>
        <h3>Tokens</h3>
        <el-row :gutter=10 v-for="(o, index) in voting" :key="o">
          <el-col :span="8">{{ o }}</el-col>
        </el-row>
      </section>
    </el-main>
    <app-footer></app-footer>
  </el-container>
</template>

<script>
import { mapState } from 'vuex'
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
    ...mapState([
      'registered',
      'voting'
    ]),
    symbol () {
      return this.$route.params.symbol
    }
  }
}
</script>
