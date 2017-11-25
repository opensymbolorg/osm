<template>
  <el-container class="is-vertical">
    <app-header></app-header>
    <el-main>
      <p class="intro">Sit aut suscipit in iure blanditiis sed accusantium ex ipsam?</p>
      <el-row :gutter="20">
        <el-col :span="12" class="align-center"><el-button type="primary" size="small">Register Symbol</el-button></el-col>
        <el-col :span="12" class="align-center"><el-button type="primary" size="small">Get Vote Token</el-button></el-col>
      </el-row>
      <section class="search">
        <el-input placeholder="Search symbol" v-model="input"></el-input>

        <div class="box">
          <h3>Registered</h3>
          <el-row :gutter=10>
            <el-col :span="8" v-for="(o, index) in registered" :key="o">
              <el-card :body-style="{ padding: '0px' }">
                <router-link :to="o" class="coin-wrapper">
                  <span class="coin-name">{{ o }}</span>
                </router-link>
              </el-card>
            </el-col>
          </el-row>
        </div>

        <div class="box">
          <h3>Voting</h3>
          <el-row :gutter=10>
            <el-col :span="8" v-for="(o, index) in voting" :key="o">
              <el-card :body-style="{ padding: '0px' }">
                <router-link :to="o" class="coin-wrapper">
                  <span class="coin-name">{{ o }}</span>
                </router-link>
              </el-card>
            </el-col>
          </el-row>
        </div>
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
    ])
  }
}
</script>
