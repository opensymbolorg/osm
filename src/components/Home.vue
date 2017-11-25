<template>
  <el-container class="is-vertical">
    <app-header></app-header>
    <el-main class="home-view">
      <p class="intro">Blockchain Trading Symbol Standard & Registry</p>
      <el-row :gutter="20">
        <el-col :span="12" class="align-center"><el-button type="primary" size="small" @click="toggleModal">Register Symbol</el-button></el-col>
        <el-col :span="12" class="align-center"><el-button type="primary" size="small">Get Vote Token</el-button></el-col>
      </el-row>
      <section class="search">
        <el-input placeholder="Search symbol" v-model="input"></el-input>

        <div class="box">
          <h3>Registered</h3>
          <el-row :gutter=10>
            <el-col :span="8" v-for="(item, index) in registered" :key="item.symbol">
              <el-card :body-style="{ padding: '0px' }">
                <router-link :to="item.symbol" class="coin-wrapper">
                  <span class="coin-name">{{ item.symbol }}</span>
                </router-link>
              </el-card>
            </el-col>
          </el-row>
        </div>

        <div class="box">
          <h3>Voting</h3>
          <el-row :gutter=10>
            <el-col :span="8" v-for="(item, index) in voting" :key="item.symbol">
              <el-card :body-style="{ padding: '0px' }">
                <router-link :to="item.symbol" class="coin-wrapper">
                  <span class="coin-name">{{ item.symbol }}</span>
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
import { mapGetters } from 'vuex'
import AppHeader from './layout/Header'
import AppFooter from './layout/Footer'
import { EventBus } from '../event-bus.js'

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
    ...mapGetters([
      'registered',
      'voting'
    ])
  },
  methods: {
    toggleModal () {
      EventBus.$emit('toggleModal')
    }
  }
}
</script>
